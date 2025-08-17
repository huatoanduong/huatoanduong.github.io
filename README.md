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
1. Create Python virtual environment: `python -m venv .venv`
2. Activate virtual environment: `.venv\Scripts\activate` (Windows) or `source .venv/bin/activate` (Unix)
3. Install dependencies: `pip install -r requirements.txt`
4. Serve locally: `mkdocs serve`
5. Build: `mkdocs build`

## Deployment
The website automatically deploys to GitHub Pages via GitHub Actions when changes are pushed to the main branch.

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

## License
This project is open source and available under the MIT License.