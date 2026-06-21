#!/bin/bash
# Display ASCII art and simplified system info on login

ART_FILE="${HOME}/.zsh/login_art.txt"

if [ -f "$ART_FILE" ]; then
    cat "$ART_FILE"
    echo "" # Add a blank line after the art
fi

echo "-------------------------------------------"
echo "System: $(lsb_release -ds)"
echo "Uptime: $(uptime -p)"
echo "Tailscale IP: $(tailscale ip -4)"
echo "Disk Usage: $(df -h / | tail -1 | awk '{print $5}')"
echo "Containers: $(docker ps -q | wc -l) running"
echo "-------------------------------------------"
echo "" # Add a blank line after the system info
