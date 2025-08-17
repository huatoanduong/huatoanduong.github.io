# Dương Hứa Toàn (Tony) - Personal Website

## Project Overview
This repository contains my personal resume website built with MkDocs and the Material theme. The site features a professional, responsive design with light/dark theme support and is deployed via GitHub Pages.

## Features
- **Resume Website**: Professional presentation of skills, experience, and qualifications
- **Material Design**: Modern, responsive UI using MkDocs Material theme
- **Theme Support**: Light and dark theme toggle
- **Navigation**: Sidebar navigation with anchor links to different sections
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
│ └── assets/ # Images and other assets
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
This creates a `site/` directory with the built website.

### Clean Build
```bash
mkdocs build --clean
```
Removes the `site/` directory before building.

## Content Management

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
- **Theme**: Material theme with custom features
- **Navigation**: Page structure and organization
- **Extensions**: Markdown extensions and plugins

### Customization Options
- **Colors**: Modify theme colors in `mkdocs.yml`
- **Fonts**: Change typography settings
- **Features**: Enable/disable theme features
- **Navigation**: Customize navigation structure

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
- **Education**: Certificates and academic background
- **Experience**: Work history and achievements
- **Skills**: Technical skills and expertise

## Future Enhancements
- Blog post functionality
- Portfolio showcase
- Interactive elements
- Additional content sections
- Custom CSS styling
- Advanced search features

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
- Basic resume structure
- GitHub Pages deployment
- Virtual environment setup
