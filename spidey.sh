#!/bin/bash

PROJECT_DIR="/www/wwwroot/"
BRANCH="master"
USERNAME="ShineShineDev"
PASSWORD="ghp_KgpBKXYXnMUr2l7EGNL8eYgoDTds"
REPO_URL="https://$USERNAME:$PASSWORD@github.com/ShineShineDev/ec-api"

cd $PROJECT_DIR || { echo "Directory not found"; exit 1; }

# Ensure we are on the correct branch
git checkout $BRANCH

# Fetch the latest changes from the remote repository using the embedded username and password
git fetch $REPO_URL

# Reset the local branch to the fetched changes
git reset --hard FETCH_HEAD

git checkout -- .env

# Restart your application (adjust this command to your needs)
# Example for a Node.js application using sPM2
# pm2 restart all

echo "Hello Spidey, Deployment completed successfully."
