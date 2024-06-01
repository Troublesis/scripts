#!/bin/bash

# Change directory to /docker
cd /docker || { echo "Failed to change directory to /docker"; exit 1; }

# Create a root docker project folder
read -p "Enter root folder name for docker project: " -a root
cd "$root"

# Create a docker-compose.yml file in the folder
sudo touch "docker-compose.yml"
echo "Created file: /docker/$root/docker-compose.yml"

# Ask for a list of folder names
read -p "Enter folder names separated by spaces: " -a folders

# Loop through each folder name provided
for folder in "${folders[@]}"
do
  # Create the folder
  sudo mkdir -p "$folder"
  echo "Created folder: $folder"
done

echo "All folders and files created successfully."
