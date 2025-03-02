## Prerequisites
- Node.js 20 or later
- npm (Node Package Manager)
## Quick Start
1. Download all the project files to your computer
2. Make the start script executable:
```bash
chmod +x start.sh
```
3. Run the start script:
```bash
./start.sh
```
The script will:
- Check if Node.js and npm are installed
- Verify Node.js version
- Check if port 5000 is available
- Install dependencies if needed
- Start the server
- Display the URLs where you can access the game
## Manual Setup (Alternative)
If you prefer to set up manually:
1. Open a terminal in the project directory and install dependencies:
```bash
npm install
```
2. Start the development server:
```bash
npm run dev
```
3. The game will be available at:
- Local URL: http://localhost:5000
- Network URL: http://<your-ip>:5000 (accessible from other devices on your network)
## Project Structure
```
-18
+0
├── shared/              # Shared types and utilities
└── package.json         # Project dependencies
```
## Local Setup Instructions
1. Clone or download the project files to your computer
2. Open a terminal in the project directory and install dependencies:
```bash
npm install
```
3. Start the development server:
```bash
npm run dev
```
4. The game will be available at:
- Local URL: http://localhost:5000
- Network URL: http://<your-ip>:5000 (accessible from other devices on your network)
## Playing the Game
-1
+0
   - If clients can't connect, check your firewall settings
   - For other issues, check the console output in the terminal
## Features
- Local multiplayer
- Online multiplayer with WebSocket support