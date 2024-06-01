#!/bin/bash

# Description:
# This script sets up a Docker project structure in the /docker directory. It creates a root folder for the project,
# initializes a docker-compose.yml file, and creates additional folders as specified by the user.

# Function to handle errors and exit
handle_error() {
    echo "Error: $1"
    exit 1
}

# Prompt the user for the root folder name
read -p "Enter root folder name for docker project: " root

# Create the root folder
echo "Creating root folder: $PWD/$root"
sudo mkdir "$PWD/$root" || handle_error "Failed to create root folder"
cd "$PWD/$root" || handle_error "Failed to navigate to root folder"

# Create the docker-compose.yml file
echo "Creating docker-compose.yml file..."
sudo touch "$PWD/docker-compose.yml" || handle_error "Failed to create docker-compose.yml file"
echo "Created file: $PWD/docker-compose.yml"

# Prompt the user for additional folder names
read -p "Enter folder names separated by spaces: " -a folders

# Loop through each folder name provided and create the folders
for folder in "${folders[@]}"
do
  echo "Creating folder: $folder"
  sudo mkdir -p "$PWD/$folder" || handle_error "Failed to create folder: $PWD/$folder"
  echo "Created folder: $PWD/$folder"
done

echo "All folders and files created successfully."
