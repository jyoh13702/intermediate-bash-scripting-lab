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
    echo "You selected Option 1: Show System Info"
elif [ "$choice" -eq 2 ]; then
    echo "You selected Option 2: Show Disk Usage"
elif [ "$choice" -eq 3 ]; then
    echo "You selected Option 3: Show Current Users"
elif [ "$choice" -eq 4 ]; then
    echo "Exiting the script. Goodbye!"
    exit 0
else
    echo "Invalid option. Please run the script again and choose 1–4."
fi