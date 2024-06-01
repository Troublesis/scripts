#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/Troublesis/scripts/main/bash/firewall-open.sh | bash

# Description:
# This script disables the firewall on a CentOS system, ensuring all ports are open.

# Function to handle errors and exit
handle_error() {
    echo "Error: $1"
    exit 1
}

echo "Stopping and disabling the firewall..."

# Stop the firewall
sudo systemctl stop firewalld || handle_error "Failed to stop firewalld"

# Disable the firewall
sudo systemctl disable firewalld || handle_error "Failed to disable firewalld"

# Check the status of the firewall
firewall_status=$(sudo systemctl is-active firewalld)
if [ "$firewall_status" == "inactive" ]; then
    echo "Firewall is inactive. All ports should be open."
else
    handle_error "Firewall is still active."
fi

# Verify no iptables rules are blocking ports
iptables_rules=$(sudo iptables -L)
echo "Current iptables rules:"
echo "$iptables_rules"

echo "Firewall disabled and all ports are open."
