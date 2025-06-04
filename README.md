# Corporate Banking Portal Evolution Demo

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/BoweyLou/InteractiveDocumentation)

## Overview

This repository is a demonstration platform that simulates the evolution of a corporate banking portal through different technology stacks. It showcases how a legacy banking application might progress from static HTML to ASP.NET Web Forms across different versions, all simulated within a single Flask application.

The project demonstrates realistic migration patterns from legacy web technologies to modern server-side frameworks, allowing users to experience the same banking portal functionality across different technology implementations.

## Technology Versions

The application provides three distinct technology demonstrations:

1. **Legacy Static Version (circa 2004-2005)** - Original static HTML website using table-based layouts, spacer GIFs, and font tags with limited JavaScript
2. **ASP.NET 3.5 Web Forms Migration** - Shows how the legacy site would be wrapped in ASP.NET 3.5 Web Forms architecture with Master Pages and server controls
3. **ASP.NET 4.5 Web Forms Migration** - Further evolution to ASP.NET 4.5 Web Forms, maintaining backward compatibility while leveraging newer framework features

## Features

- **Version Selector Landing Page** - Choose between different technology implementations
- **Corporate Banking Interface** - Login, dashboard, account settings, and transaction reports
- **XML Report Generation** - XSLT-based transformation system for banking transaction data
- **File Upload System** - Upload and process custom XML transaction files
- **ASP.NET Simulation** - Flask-based simulation of ASP.NET Web Forms processing
- **Responsive Navigation** - Era-appropriate navigation and UI patterns for each technology version

## Prerequisites

- Python 3.11 or higher
- pip or poetry for package management

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/BoweyLou/InteractiveDocumentation.git
   cd InteractiveDocumentation
   ```

2. **Install dependencies:**
   ```bash
   pip install -e .
   ```
   
   Or using poetry:
   ```bash
   poetry install
   ```

3. **Run the application:**
   ```bash
   python main.py
   ```

4. **Access the application:**
   Open your browser and navigate to `http://localhost:5000`

## Usage

### Version Selector
Start at the main page (`http://localhost:5000`) to choose between technology versions:

- **Legacy Static Version**: `/LegacySite/Pages/login.html`
- **ASP.NET 3.5 Version**: `/CorporateBanking.Web35/login.aspx`
- **ASP.NET 4.5 Version**: `/CorporateBanking.Web45/login.aspx`

### Navigation Flow
1. Select a technology version from the landing page
2. Use the login page (no authentication required - any credentials work)
3. Explore the dashboard with account information and transaction data
4. Access account settings and transaction reports
5. Generate XML reports or upload custom transaction files

### XML Report System
- **Generate Reports**: Visit `/generate-report` to create transaction reports using XSLT transformation
- **Upload Custom Data**: Use `/upload-xml` to process your own XML transaction files
- **Download Templates**: Get sample XML templates to understand the expected data structure

## Project Structure

```
├── app.py                          # Main Flask application and routing
├── main.py                         # Application entry point
├── pyproject.toml                  # Python dependencies and configuration
├── static/LegacySite/             # Legacy static HTML implementation
│   ├── Pages/                     # HTML pages (login, dashboard, settings)
│   ├── Styles/                    # CSS stylesheets
│   ├── Scripts/                   # JavaScript files
│   └── Data/                      # XML data and XSLT transformations
├── CorporateBankingSolution/      # ASP.NET Web Forms versions
│   ├── CorporateBanking.Web35/    # .NET 3.5 implementation
│   └── CorporateBanking.Web45/    # .NET 4.5 implementation
└── README.md                      # This file
```

### Key Files

- **`app.py`** - Flask application with routes for all technology versions and ASP.NET simulation logic
- **`main.py`** - Simple entry point that runs the Flask development server
- **`static/LegacySite/Data/ReportTransform.xslt`** - XSLT stylesheet for XML report generation
- **`static/LegacySite/Data/sample-report.xml`** - Example transaction data
- **`CorporateBankingSolution/*/Site.master`** - ASP.NET master page templates

## Development

### ASP.NET Simulation
The Flask application simulates ASP.NET Web Forms by:
- Processing `.aspx` files and master pages
- Converting ASP.NET server controls to HTML
- Replacing data binding expressions with sample values
- Maintaining the look and feel of each technology era

### Adding New Features
- Static content goes in `static/LegacySite/`
- ASP.NET pages go in the respective `CorporateBanking.Web35/` or `CorporateBanking.Web45/` directories
- Route handling is managed in `app.py`

### Environment Variables
- `SESSION_SECRET` - Optional Flask session secret (defaults to "legacy_site_secret_key")

## Target Audience

- Software architects planning legacy modernization projects
- Developers learning about web technology evolution  
- Technical stakeholders evaluating migration strategies
- Anyone interested in the history of web development technologies

## License

This project is for educational and demonstration purposes.

## Contributing

This is a demonstration project. For questions or suggestions, please open an issue. 
