#!/bin/bash

# Description:
# This script sets up a Docker project structure in the /docker directory. It creates a root folder for the project,
# initializes a docker-compose.yml file, and creates additional folders as specified by the user.

# Function to handle errors and exit
handle_error() {
    echo "Error: $1"
    exit 1
}

# Ensure the /docker directory exists
echo "Navigating to /docker directory..."
cd /docker || { 
    echo "/docker directory does not exist. Creating it now...";
    sudo mkdir /docker || handle_error "Failed to create /docker directory";
    cd /docker || handle_error "Failed to navigate to /docker directory after creation";
}

# Prompt the user for the root folder name
read -p "Enter root folder name for docker project: " root

# Create the root folder
echo "Creating root folder: /docker/$root"
sudo mkdir "/docker/$root" || handle_error "Failed to create root folder"
cd "/docker/$root" || handle_error "Failed to navigate to root folder"

# Create the docker-compose.yml file
echo "Creating docker-compose.yml file..."
sudo touch "docker-compose.yml" || handle_error "Failed to create docker-compose.yml file"
echo "Created file: /docker/$root/docker-compose.yml"

# Prompt the user for additional folder names
read -p "Enter folder names separated by spaces: " -a folders

# Loop through each folder name provided and create the folders
for folder in "${folders[@]}"
do
  echo "Creating folder: $folder"
  sudo mkdir -p "$folder" || handle_error "Failed to create folder: $folder"
  echo "Created folder: $folder"
done

echo "All folders and files created successfully."
