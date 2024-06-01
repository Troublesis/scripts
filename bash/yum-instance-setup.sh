#!/bin/bash
# install script
# curl -fsSL https://raw.githubusercontent.com/Troublesis/scripts/main/bash/yum-instance-setup.sh | bash

# Description:
# This script sets up a CentOS instance with the following tools:
# - Zsh
# - Vim
# - Curl
# - Git
# It also installs Docker and its dependencies, then starts the Docker service.

# Function to handle errors and exit
handle_error() {
    echo "Error: $1"
    exit 1
}

echo "Starting CentOS instance setup..."

# Install basic tools
echo "Installing Zsh, Vim, Curl, and Git..."
yum install zsh vim curl git -y || handle_error "Failed to install basic tools"

# Add Docker repository
echo "Adding Docker repository..."
yum install -y yum-utils || handle_error "Failed to install yum-utils"
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo || handle_error "Failed to add Docker repository"

# Install Docker and its components
echo "Installing Docker and its components..."
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || handle_error "Failed to install Docker components"

# Start Docker service
echo "Starting Docker service..."
systemctl start docker || handle_error "Failed to start Docker service"

echo "CentOS instance setup completed successfully."
