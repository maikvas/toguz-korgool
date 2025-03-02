
# Toguz Korgool Game
# Toguz Korgool Game - Local Setup Guide
A web-based implementation of the traditional Central Asian board game Toguz Korgool.
## Prerequisites
- Node.js 20 or later
- npm (Node Package Manager)
## Project Structure
```
.
├── client/               # Frontend React application
│   ├── src/             # Source code
│   │   ├── components/  # React components
│   │   ├── hooks/      # Custom React hooks
│   │   ├── lib/        # Utility functions
│   │   └── pages/      # Page components
├── server/              # Backend Node.js server
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
1. Local Multiplayer:
   - Open http://localhost:5000 in your browser
   - Click "Play Local Multiplayer"
   - Two players can play on the same device
2. Online Multiplayer:
   - Open http://localhost:5000 in your browser
   - Click "Play Online Multiplayer"
   - Share your IP address with other players
   - They can connect using http://<your-ip>:5000
## Important Notes
1. Server Configuration
   - The server runs on port 5000 by default
   - Make sure port 5000 is not in use by other applications
   - If needed, you can change the port in server/index.ts
2. Network Access
   - To allow other computers on your network to connect:
     - Ensure your firewall allows connections to port 5000
     - Share your computer's local IP address with other players
3. Files to Keep
   - All files in the project directory are necessary
   - Don't delete any files as they're required for the game to work
4. Troubleshooting
   - If the server won't start, check if port 5000 is already in use
   - If clients can't connect, check your firewall settings
   - For other issues, check the console output in the terminal
## Features
- Local multiplayer
-127
+5
- Move validation and scoring
- Modern, minimalistic design
## Deployment Instructions
### Option 1: Traditional Hosting (VPS/Dedicated Server)
1. Clone or upload your project files to your server
2. Install dependencies:
```bash
npm install
```
3. Build the application:
```bash
npm run build
```
4. Set up environment variables:
- Create a `.env` file in your project root:
```env
PORT=5000  # Or your preferred port
NODE_ENV=production
```
5. Start the server:
```bash
npm start
```
6. Configure your web server (nginx/Apache):
For Nginx, create a configuration file `/etc/nginx/sites-available/toguz-korgool`:
```nginx
server {
    listen 80;
    server_name your-domain.com;
    location / {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```
For Apache, add to your virtual host configuration:
```apache
<VirtualHost *:80>
    ServerName your-domain.com
    ProxyPass / http://localhost:5000/
    ProxyPassReverse / http://localhost:5000/
    RewriteEngine on
    RewriteCond %{HTTP:Upgrade} websocket [NC]
    RewriteCond %{HTTP:Connection} upgrade [NC]
    RewriteRule ^/?(.*) "ws://localhost:5000/$1" [P,L]
</VirtualHost>
```
7. Enable and restart your web server
### Option 2: Docker Deployment
1. Build the Docker image:
```bash
docker build -t toguz-korgool .
```
2. Run the container:
```bash
docker run -d -p 5000:5000 toguz-korgool
```
### Option 3: Process Manager (PM2)
1. Install PM2 globally:
```bash
npm install -pm2 -g
```
2. Start the application:
```bash
pm2 start npm --name "toguz-korgool" -- start
```
3. Enable startup script:
```bash
pm2 startup
pm2 save
```
### Important Notes
1. WebSocket Configuration
   - Ensure your hosting provider supports WebSocket connections
   - Configure any firewalls to allow WebSocket traffic
   - If using a CDN, make sure it's configured to support WebSocket connections
2. Environment Variables
   - `PORT`: Server port (default: 5000)
   - `NODE_ENV`: Environment mode ('development' or 'production')
3. SSL/HTTPS
   - For production, always use HTTPS
   - You can use Let's Encrypt for free SSL certificates
   - Update your web server configuration accordingly
4. Monitoring
   - Use PM2 or your hosting provider's monitoring tools
   - Monitor WebSocket connections and server resources
   - Set up logging for debugging
5. Scaling
   - The game uses in-memory storage by default
   - For multiple server instances, implement a shared storage solution
## Support
If you encounter any issues during deployment, please:
1. Check the server logs
2. Verify all prerequisites are met
3. Ensure all environment variables are properly set
4. Confirm WebSocket connections are properly configured
If you encounter any issues:
1. Check the terminal for error messages
2. Verify all dependencies are installed
3. Ensure no other service is using port 5000
4. Check your firewall settings if hosting for other players
## License
MIT License - feel free to use and modify as needed.