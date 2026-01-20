#!/bin/bash

# Title
echo "=============================="
echo "   System Information Tool"
echo "=============================="
echo

# Menu
echo "Welcome, select one of the following options using the number keys:"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4: Exit"
echo

# Read user input
read -p "Enter your choice: " choice

# Handle choices
if [ "$choice" -eq 1 ]; then
    echo "=== System Information ==="
    echo "Operating System:"
    hostnamectl | grep "Operating System"
    echo
    echo "Hostname:"
    hostname
    echo
    echo "Kernel Version:"
    uname -r
    echo
    echo "System Uptime:"
    uptime -p
elif [ "$choice" -eq 2 ]; then
    echo "=== Disk Usage ==="
    df -h
elif [ "$choice" -eq 3 ]; then
    echo "=== Current Users ==="
    echo "Logged-in users and their running processes:"
    w
elif [ "$choice" -eq 4 ]; then
    echo "Exiting the script. Goodbye!"
    exit 0
else
    echo "Invalid option. Please select a number between 1 and 4."
fi
echo
read -p "Press Enter to return to the menu..."
done