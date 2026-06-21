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
if command -v tailscale >/dev/null 2>&1; then
    echo "Tailscale IP: $(tailscale ip -4)"
fi

echo "Disk Usage: $(df -h / | tail -1 | awk '{print $5}')"

if command -v docker >/dev/null 2>&1; then
    echo "Containers: $(docker ps -q | wc -l) running"
fi
echo "-------------------------------------------"
echo "" # Add a blank line after the system info
