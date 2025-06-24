# Corporate Banking Portal - Replit Documentation

## Overview

This repository contains a demonstration platform that simulates the evolution of a corporate banking portal through different technology stacks. The application showcases how a legacy banking application might progress from traditional static HTML to modern web technologies, serving as an educational tool for understanding technology migration patterns in enterprise banking systems.

## System Architecture

### Frontend Architecture
- **Legacy Static Site**: HTML 4.01 Transitional with table-based layouts
- **CSS Strategy**: Split between legacy styles (`co.css`) and modern placeholder (`modern-stub.css`)
- **JavaScript**: jQuery 1.4.2 with legacy browser compatibility functions
- **Responsive Design**: Fixed 780px width targeting 800x600 resolution (era-appropriate)

### Backend Architecture
- **Flask Application**: Python-based web server serving static content and routing
- **Template Engine**: Flask's Jinja2 for dynamic content generation
- **WSGI Server**: Gunicorn for production deployment
- **Static Asset Management**: Direct file serving from `/static/LegacySite/` directory

### Data Processing
- **XML/XSLT Pipeline**: Legacy reporting system using XML data with XSLT transformations
- **File Upload Support**: Basic file handling for XML report uploads
- **Data Storage**: File-based XML storage in `/static/LegacySite/Data/`

## Key Components

### 1. Version Selector Landing Page
- **Purpose**: Entry point demonstrating different technology stack versions
- **Implementation**: Dynamically generated HTML with inline styling
- **Navigation**: Links to various legacy portal implementations

### 2. Legacy Banking Interface
- **Components**: Login, Dashboard, Settings, Reports, Modal Dialogs
- **Styling**: Era-appropriate design with spacer GIFs, font tags, and table layouts
- **Functionality**: Static demonstration pages with legacy JavaScript interactions

### 3. Metrics and Analysis System
- **Real-time Analysis**: JavaScript-based legacy code metrics calculation
- **Metrics Tracked**: Inline CSS usage, table count, legacy artifacts, browser hacks
- **Display**: Collapsible panel showing technical debt analysis

### 4. Report Generation System
- **XML Processing**: XSLT transformation of banking transaction data
- **Multiple Formats**: Pre-rendered and dynamically generated reports
- **Legacy Compatibility**: Supports old browser rendering patterns

## Data Flow

1. **User Request**: Client accesses main Flask application
2. **Route Processing**: Flask routes determine content type (static vs. dynamic)
3. **Content Serving**: Static assets served directly, dynamic content rendered through templates
4. **Legacy Processing**: XSLT transformations applied to XML data for reports
5. **Metrics Calculation**: Client-side JavaScript analyzes rendered DOM for legacy patterns
6. **Response Delivery**: Complete HTML with embedded CSS/JS delivered to client

## External Dependencies

### Python Dependencies
- **Flask 3.1.0**: Web framework for routing and templating
- **lxml 5.4.0**: XML and XSLT processing
- **Gunicorn 23.0.0**: WSGI HTTP Server for production
- **email-validator 2.2.0**: Email validation utilities
- **psycopg2-binary 2.9.10**: PostgreSQL adapter (prepared for future database integration)

### Frontend Dependencies
- **jQuery 1.4.2**: Legacy JavaScript library (bundled)
- **Custom Legacy Scripts**: Browser compatibility and metrics calculation
- **Era-appropriate CSS**: Table layouts, font tags, spacer GIFs

## Deployment Strategy

### Development Environment
- **Runtime**: Python 3.11 with Nix package manager
- **Development Server**: Flask development server with debug mode
- **Hot Reload**: Automatic restart on code changes

### Production Environment
- **Server**: Gunicorn with auto-scaling deployment target
- **Port Configuration**: Internal 5000, external 80
- **Process Management**: Parallel workflow execution
- **Static Assets**: Served directly through Flask static file handling

### Configuration Management
- **Environment Variables**: Session secrets and configuration
- **Upload Handling**: Automatic directory creation for file uploads
- **Cross-platform Support**: Nix-based dependency management

## Changelog

- June 24, 2025: Initial setup and architecture implementation
- June 24, 2025: Fixed CSS toggle functionality with real-time metrics updates across all legacy pages - stylesheet count now properly changes from 24 rules (legacy CSS) to 0 rules (modern stub) when toggling, updating percentage distribution accordingly

## User Preferences

Preferred communication style: Simple, everyday language.