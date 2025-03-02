#!/bin/bash

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install Node.js 20 or later."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Please install npm."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo "Node.js version 20 or later is required. Current version: $(node -v)"
    exit 1
fi

# Check if port 5000 is available
if lsof -Pi :5000 -sTCP:LISTEN -t >/dev/null ; then
    echo "Port 5000 is already in use. Please free up port 5000 and try again."
    exit 1
fi

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Start the server
echo "Starting Toguz Korgool server..."
echo "The game will be available at:"
echo "- Local URL: http://localhost:5000"
echo "- Network URL: http://$(hostname -I | cut -d' ' -f1):5000"

npm run dev
