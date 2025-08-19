# Dương Hứa Toàn (Tony) - Personal Website

## Project Overview
This repository contains my personal resume website built with MkDocs and the Material theme. The site features a professional, responsive design with light/dark theme support and is deployed via GitHub Pages.

## Features
- **Resume Website**: Professional presentation of skills, experience, and qualifications
- **Material Design**: Modern, responsive UI using MkDocs Material theme
- **Theme Support**: Light and dark theme toggle (dark mode default)
- **Navigation**: Sidebar navigation with anchor links to different sections
- **PDF Export**: Built-in PDF export functionality for resume download
- **Future Ready**: Extensible structure for future blog posts and content
- **GitHub Pages**: Automatic deployment via GitHub Actions

## Technology Stack
- **MkDocs**: Static site generator
- **Material Theme**: Professional documentation theme
- **Python**: Virtual environment (.venv) for dependencies
- **GitHub Actions**: CI/CD pipeline for deployment
- **GitHub Pages**: Hosting platform

## Project Structure
```
huatoanduong.github.io/
├── docs/ # MkDocs documentation source
│ ├── index.md # Main resume content
│ ├── javascripts/ # JavaScript files
│ │ └── pdf-button.js # PDF export button functionality
│ └── stylesheets/ # CSS styling files
│ └── pdf-button.css # PDF button styling
├── .github/workflows/ # GitHub Actions workflows
├── .venv/ # Python virtual environment
├── requirements.txt # Python dependencies
├── mkdocs.yml # MkDocs configuration
└── README.md # This file

```

## Development Setup

### Prerequisites
- Python 3.8 or higher
- Git
- GitHub account

### Step 1: Clone the Repository
```bash
git clone https://github.com/huatoanduong/huatoanduong.github.io.git
cd huatoanduong.github.io
```

### Step 2: Create Python Virtual Environment
```bash
# Windows
python -m venv .venv
.venv\Scripts\activate

# macOS/Linux
python3 -m venv .venv
source .venv/bin/activate
```

### Step 3: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 4: Verify Installation
```bash
mkdocs --version
```

## Local Development

### Serve Locally
```bash
# Make sure virtual environment is activated
mkdocs serve
```
The site will be available at `http://127.0.0.1:8000/`

### Build for Production
```bash
mkdocs build
```
This creates a `dist/` directory with the built website.

### Clean Build
```bash
mkdocs build --clean
```
Removes the `dist/` directory before building.

## Content Management

### Resume Structure
The resume is organized into the following sections:

1. **Personal Information**: Name, title, professional summary
2. **Contact Information**: Phone, email, social media links
3. **Technical Skills**: Programming languages, frameworks, and technologies
4. **Work Experience**: Detailed work history in table format including:
   - Zuhlke Group (Current) - Zurich Neo insurance project
   - GIC Singapore - External EIPs data tool
   - Grab - Express Web portal
   - Kassom - Online learning platform
   - Positive Thinking Company - TradeTeq trading platform
   - Haravan - E-commerce platform
   - Restaff - Software development
   - Freelancer Team - Various client projects
   - Nexcel Solution (Taiwan) - Business analysis
   - Teg Solution (Singapore) - Project coordination
   - HLV Solution - Software development
5. **Certificates & Education**: Academic background and certifications

### Adding New Content
1. Create new markdown files in the `docs/` directory
2. Update `mkdocs.yml` navigation section
3. Use proper markdown syntax and frontmatter

### Markdown Guidelines
- Use `#` for main headings
- Use `##` for section headings
- Use `###` for subsection headings
- Include frontmatter for metadata
- Use proper link formatting
- Use HTML tables for structured content
- Use `<ul><li>` tags for lists in tables

### Frontmatter Example
```yaml
---
title: "Page Title"
description: "Page description"
date: "2024-01-15"
---
```

## Configuration

### MkDocs Configuration (`mkdocs.yml`)
- **Site Settings**: Name, description, author, URL
- **Theme**: Material theme with dark mode default
- **Navigation**: Page structure and organization
- **Extensions**: Markdown extensions and plugins
- **PDF Export**: Custom JavaScript and CSS for PDF functionality

### Customization Options
- **Colors**: Dark theme by default with light mode toggle
- **Fonts**: Material Design typography
- **Features**: Enhanced navigation, search, and content features
- **Navigation**: Structured sidebar with anchor links

## PDF Export Functionality

### Features
- **Floating Export Button**: Professional PDF export button positioned on the page
- **Print Integration**: Integrates with browser's print functionality
- **Responsive Design**: Button adapts to different screen sizes
- **Theme Support**: Works with both light and dark themes

### Implementation
- **JavaScript**: `docs/javascripts/pdf-button.js` handles button functionality
- **CSS**: `docs/stylesheets/pdf-button.css` provides styling
- **Integration**: Automatically appears on all pages

## Deployment

### Automatic Deployment (GitHub Pages)
The website automatically deploys when you push changes to the main branch.

### Manual Deployment
```bash
# Build the site
mkdocs build

# Deploy to GitHub Pages (if using gh-pages branch)
mkdocs gh-deploy
```

### GitHub Actions Workflow
The `.github/workflows/deploy.yml` file handles:
- Building the MkDocs site
- Deploying to GitHub Pages
- Automatic updates on push

## Troubleshooting

### Common Issues

#### Virtual Environment Not Activated
```bash
# Windows
.venv\Scripts\activate

# macOS/Linux
source .venv/bin/activate
```

#### Dependencies Not Found
```bash
pip install -r requirements.txt
```

#### Port Already in Use
```bash
mkdocs serve -a 127.0.0.1:8001
```

#### Build Errors
```bash
mkdocs build --verbose
```

### Debug Mode
```bash
mkdocs serve --verbose
```

## Content Structure
- **Personal**: Name, title, professional summary
- **Contact**: Phone, email, social media links
- **Technical Skills**: Programming languages, frameworks, and technologies
- **Work Experience**: Comprehensive work history with detailed tables
- **Education**: Certificates and academic background

## Future Enhancements
- Blog post functionality
- Portfolio showcase
- Interactive elements
- Additional content sections
- Custom CSS styling
- Advanced search features
- Multi-language support

## Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `mkdocs serve`
5. Submit a pull request

## License
This project is open source and available under the MIT License.

## Support
For issues or questions:
- Check the [MkDocs documentation](https://www.mkdocs.org/)
- Review [Material theme documentation](https://squidfunk.github.io/mkdocs-material/)
- Open an issue in this repository

## Changelog
- **v1.0.0**: Initial setup with MkDocs and Material theme
- **v1.1.0**: Added comprehensive work experience sections
- **v1.2.0**: Implemented PDF export functionality
- **v1.3.0**: Enhanced table formatting and content structure
- **v1.4.0**: Added dark theme as default with light mode toggle

## About the Resume
This resume showcases 15+ years of experience in software development, with expertise in:
- Full-stack development (.NET, Angular, React, Golang)
- Team leadership and project management
- Cloud-native architecture (Azure, Docker, Kubernetes)
- Startup environments and agile methodologies
- International project experience across multiple countries

The resume is designed to be both human-readable and machine-parseable, making it suitable for both direct review and ATS systems.