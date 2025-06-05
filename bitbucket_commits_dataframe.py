#!/usr/bin/env python3
"""
Script to create a DataFrame from Git commit data across multiple repositories.
This script extracts commit information and creates a pandas DataFrame for analysis.
"""

import pandas as pd
import subprocess
import os
import json
from datetime import datetime
from pathlib import Path

def get_git_commits(repo_path, max_commits=100):
    """
    Extract commit data from a Git repository.
    
    Args:
        repo_path (str): Path to the Git repository
        max_commits (int): Maximum number of commits to retrieve
        
    Returns:
        list: List of commit dictionaries
    """
    commits = []
    
    try:
        os.chdir(repo_path)
        
        cmd = [
            'git', 'log', 
            f'--max-count={max_commits}',
            '--pretty=format:{"hash":"%H","short_hash":"%h","author":"%an","author_email":"%ae","date":"%ai","subject":"%s","body":"%b"}',
            '--no-merges'
        ]
        
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        
        for line in result.stdout.strip().split('\n'):
            if line.strip():
                try:
                    commit_data = json.loads(line)
                    commit_data['repository'] = os.path.basename(repo_path)
                    commit_data['repo_path'] = repo_path
                    commits.append(commit_data)
                except json.JSONDecodeError:
                    continue
                    
    except subprocess.CalledProcessError as e:
        print(f"Error getting commits from {repo_path}: {e}")
    except Exception as e:
        print(f"Unexpected error with {repo_path}: {e}")
        
    return commits

def get_commit_stats(repo_path, commit_hash):
    """
    Get additional statistics for a commit (files changed, insertions, deletions).
    
    Args:
        repo_path (str): Path to the Git repository
        commit_hash (str): Commit hash
        
    Returns:
        dict: Statistics dictionary
    """
    try:
        os.chdir(repo_path)
        cmd = ['git', 'show', '--stat', '--format=', commit_hash]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        
        lines = result.stdout.strip().split('\n')
        stats = {'files_changed': 0, 'insertions': 0, 'deletions': 0}
        
        for line in lines:
            if 'files changed' in line or 'file changed' in line:
                parts = line.split(',')
                for part in parts:
                    part = part.strip()
                    if 'file' in part and 'changed' in part:
                        stats['files_changed'] = int(part.split()[0])
                    elif 'insertion' in part:
                        stats['insertions'] = int(part.split()[0])
                    elif 'deletion' in part:
                        stats['deletions'] = int(part.split()[0])
                        
        return stats
    except:
        return {'files_changed': 0, 'insertions': 0, 'deletions': 0}

def create_commits_dataframe(repos_dir="/home/ubuntu/repos", max_commits_per_repo=50):
    """
    Create a pandas DataFrame from commit data across multiple repositories.
    
    Args:
        repos_dir (str): Directory containing Git repositories
        max_commits_per_repo (int): Maximum commits to extract per repository
        
    Returns:
        pandas.DataFrame: DataFrame containing commit information
    """
    all_commits = []
    
    repos_path = Path(repos_dir)
    if not repos_path.exists():
        print(f"Repository directory {repos_dir} does not exist")
        return pd.DataFrame()
    
    for repo_dir in repos_path.iterdir():
        if repo_dir.is_dir() and (repo_dir / '.git').exists():
            print(f"Processing repository: {repo_dir.name}")
            commits = get_git_commits(str(repo_dir), max_commits_per_repo)
            all_commits.extend(commits)
    
    if not all_commits:
        print("No commits found in any repository")
        return pd.DataFrame()
    
    df = pd.DataFrame(all_commits)
    
    df['date'] = pd.to_datetime(df['date'], utc=True)
    
    df['commit_year'] = df['date'].dt.year
    df['commit_month'] = df['date'].dt.month
    df['commit_day_of_week'] = df['date'].dt.day_name()
    df['subject_length'] = df['subject'].str.len()
    df['has_body'] = df['body'].str.len() > 0
    
    df = df.sort_values('date', ascending=False).reset_index(drop=True)
    
    return df

def analyze_commits_dataframe(df):
    """
    Perform basic analysis on the commits DataFrame.
    
    Args:
        df (pandas.DataFrame): Commits DataFrame
        
    Returns:
        dict: Analysis results
    """
    if df.empty:
        return {}
    
    analysis = {
        'total_commits': len(df),
        'unique_authors': df['author'].nunique(),
        'repositories': df['repository'].unique().tolist(),
        'date_range': {
            'earliest': df['date'].min(),
            'latest': df['date'].max()
        },
        'commits_by_repo': df['repository'].value_counts().to_dict(),
        'commits_by_author': df['author'].value_counts().head(10).to_dict(),
        'commits_by_year': df['commit_year'].value_counts().sort_index().to_dict(),
        'avg_subject_length': df['subject_length'].mean(),
        'commits_with_body': df['has_body'].sum()
    }
    
    return analysis

def main():
    """Main function to create and analyze commits DataFrame."""
    print("Creating commits DataFrame from Git repositories...")
    
    df = create_commits_dataframe()
    
    if df.empty:
        print("No commit data found.")
        return
    
    print(f"\nDataFrame created with {len(df)} commits")
    print(f"Columns: {list(df.columns)}")
    
    print("\nFirst 5 commits:")
    print(df[['repository', 'author', 'date', 'subject']].head())
    
    analysis = analyze_commits_dataframe(df)
    
    print("\n" + "="*50)
    print("COMMIT ANALYSIS SUMMARY")
    print("="*50)
    
    for key, value in analysis.items():
        if isinstance(value, dict):
            print(f"\n{key.replace('_', ' ').title()}:")
            for k, v in value.items():
                print(f"  {k}: {v}")
        else:
            print(f"{key.replace('_', ' ').title()}: {value}")
    
    output_file = "/home/ubuntu/commits_dataframe.csv"
    df.to_csv(output_file, index=False)
    print(f"\nDataFrame saved to: {output_file}")
    
    analysis_file = "/home/ubuntu/commits_analysis.json"
    analysis_json = analysis.copy()
    if 'date_range' in analysis_json:
        analysis_json['date_range']['earliest'] = str(analysis_json['date_range']['earliest'])
        analysis_json['date_range']['latest'] = str(analysis_json['date_range']['latest'])
    
    for key, value in analysis_json.items():
        if isinstance(value, dict):
            for k, v in value.items():
                if hasattr(v, 'item'):  # numpy scalar
                    analysis_json[key][k] = v.item()
        elif hasattr(value, 'item'):  # numpy scalar
            analysis_json[key] = value.item()
    
    with open(analysis_file, 'w') as f:
        json.dump(analysis_json, f, indent=2)
    print(f"Analysis saved to: {analysis_file}")
    
    return df

if __name__ == "__main__":
    df = main()
