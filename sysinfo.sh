#!/bin/bash

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "System Information Tool"
    echo
    echo "This script provides a menu-driven interface to display"
    echo "useful system information."
    echo
    echo "Menu options include:"
    echo "  1. Show System Info      - OS, hostname, kernel, uptime"
    echo "  2. Show Disk Usage      - Disk usage for all filesystems"
    echo "  3. Show Current Users   - Logged-in users and their activity"
    echo "  4. Show Top Processes   - Top 5 CPU-intensive processes"
    echo "  5. Exit"
    echo
    echo "Usage:"
    echo "  ./sysinfo.sh            Run the interactive menu"
    echo "  ./sysinfo.sh -h|--help  Display this help message"
    exit 0
fi

while true; do
# Title
echo "=============================="
echo "   System Information Tool"
echo "=============================="
echo

# Menu
echo "Welcome, select one of the following options using the number keys:"
echo "----------------------------------------"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4. Show Top Processes"
echo "5: Exit"
echo "----------------------------------------"
echo

# Read user input
read -p "Enter your choice: " choice
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Handle choices
if [ "$choice" -eq 1 ]; then
    echo "========================================"
    echo "            SYSTEM INFORMATION"
    echo "========================================"
    echo "Generated on: $TIMESTAMP"
    echo "----------------------------------------"
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
    echo "========================================"
    echo "               DISK USAGE"
    echo "========================================"    
    echo "Generated on: $TIMESTAMP"
    echo "----------------------------------------"
    df -h
elif [ "$choice" -eq 3 ]; then
    logged_in_users=$(who | awk '{print $1}' | sort -u)
    echo "========================================"
    echo "Currently Logged In Users and their Running Applications"
    echo "========================================"
    echo "Generated on: $TIMESTAMP"
    echo "----------------------------------------"

    # Iterate over each logged-in user
    for user in $logged_in_users; do
        echo ""
        echo "========================================"
        echo "               User: $user"
        echo "========================================"

        ps -u "$user" -o pid,pcpu,pmem,etime
    done
    echo ""
    echo "--- Report Complete ---"
elif [ "$choice" -eq 4 ]; then
    echo "========================================"
    echo "          TOP CPU PROCESSES"
    echo "========================================"
    echo "Generated on: $TIMESTAMP"
    echo "----------------------------------------"
    ps -e -o pid,user,%cpu,comm | head -n 6

elif [ "$choice" -eq 5 ]; then
    echo "========================================"
    echo "Exiting the script. Goodbye!"
    echo "========================================"
    echo "Generated on: $TIMESTAMP"
    echo "----------------------------------------"
    exit 0
else
    echo "----------------------------------------"
    echo "Invalid option. Please select 1–5."
    echo "----------------------------------------"
fi
echo
read -p "Press Enter to return to the menu..."
done