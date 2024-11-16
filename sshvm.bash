#!/bin/bash

# Update package lists and upgrade existing packages
sudo apt-get update && sudo apt-get upgrade -y

# Install XFCE desktop environment
sudo apt-get install -y xfce4 xfce4-goodies

# Install VNC server
sudo apt-get install -y tightvncserver

# Set up VNC server for the first time
vncserver :1

# Kill the VNC server to configure it
vncserver -kill :1

# Backup the original xstartup file
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak

# Create a new xstartup file
cat <<EOL > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOL

# Make the xstartup file executable
chmod +x ~/.vnc/xstartup

# Start the VNC server
vncserver :1

echo "Desktop environment installed and VNC server started."
echo "You can connect to your VPS using a VNC client on port 5901."
