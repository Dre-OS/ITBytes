# ITBytes - Single-Page Ecommerce Web Application

<p align="center">
    <img src="https://raw.githubusercontent.com/Dre-OS/ITBytes/refs/heads/main/itbytes_logo.webp" alt="ITBytes Logo" width="200">
</p>

## Project Overview
This repository contains a single-page ecommerce web application for ITBytes, a business that sells computers and CCTV systems.

## Features 🧑‍💻
- Product browsing and searching
- Shopping cart functionality
- Secure checkout process
- User account management

## Technology Stack 🪛
MongoDB, Express, React.js, Node.js

## Archictecture 🏗️
Microarchitecture design 
(Front-end website accessing Multiple APIs connected through Event-Driven Messaging)

<p align="center">
    <img src="https://raw.githubusercontent.com/Dre-OS/ITBytes/refs/heads/main/itbytes_sysarchi.webp" alt="ITBytes Logo" width="1000">
</p>

## Getting Started

### NOTICE ⚠️
- in case any of the functionality are unresponsive in the demo deployment, proceed to https://it-bytes-ui.vercel.app/test to refresh all services, this is due to the limitations of the free services on inactivity
- demo credentials are available in credetials.txt inside the ZIP file
- Documentation is available [Here](https://github.com/Dre-OS/ITBytes "ITBytes Documentation Repository")

### Required: 
- Node.JS
- Internet Access

### Option 1: Access demo deployment
Proceed to https://itbytes.dreos.qzz.io/ to view the current build of the web app, batteries included 🔋

### Option 2: Clone Repository/Extract Repository files

1. Extract folder ITBytes
2. Install Node.js (node-v22.17.1-x64.msi)
3. Choose one of the following methods:

- **Run Setup Script:**

click to run the script file

*OR*

Run on cmd:
```bash
# Run setup script
cd ITBytes
./setup.bat
```
     
- **OR Clone repositories for each module:**
```bash

# Clone the repository
git clone https://github.com/Dre-OS/ITBytes-[ModuleName].git

# Navigate to the project directory
cd ITBytes-[ModuleName]

# Navigate to the root directory (contains package.json)
cd ./path/to/root

# Install dependencies
npm install

# Start the development server
npm run dev

```

After cloning, you'll need to set up environment variables. Create a `.env` file in the root directory


## License
Apache License 2.0


