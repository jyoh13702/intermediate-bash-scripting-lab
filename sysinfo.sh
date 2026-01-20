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
    uname -s
    uname -v
    echo
    echo "Hostname:"
    hostname
    echo
    echo "Kernel Version:"
    uname -r
    echo
    echo "System Uptime:"
    uptime
elif [ "$choice" -eq 2 ]; then
    echo "=== Disk Usage ==="
    df -h
elif [ "$choice" -eq 3 ]; then
    logged_in_users=$(who | awk '{print $1}' | sort -u)

    echo "--- Currently Logged In Users and their Running Applications ---"

    # Iterate over each logged-in user
    for user in $logged_in_users; do
        echo ""
        echo "====================================================="
        echo "User: $user"
        echo "====================================================="
        # List all processes (applications) for the specific user
        # ps -u [username] shows processes owned by that user
        # 'u' option provides detailed info in user format (UID, PID, %CPU, %MEM, etc.)
        ps -u "$user" -o pid,pcpu,pmem,etime
    done
    echo ""
    echo "--- Report Complete ---"
elif [ "$choice" -eq 4 ]; then
    echo "Exiting the script. Goodbye!"
    exit 0
else
    echo "Invalid option. Please select a number between 1 and 4."
fi
echo
read -p "Press Enter to return to the menu..."
done