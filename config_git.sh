#!/bin/bash

echo 
# GitHub Personal Access Token (You need to create this in your GitHub account settings)
read -p "Enter your GitHub Personal Access Token: " GITHUB_TOKEN
echo 
echo "Starting Git Setup"

git config --global core.editor code
git config --global color.ui auto
git config --global credential.helper cache
#git config --global credential.helper 'cache --timeout=10800'
git config --global credential.helper store
git config --global init.defaultBranch main


# Fetch GitHub user info
response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user)

# Extract username and email from the response
GITHUB_NAME=$(echo "$response" | jq -r .name)
GITHUB_EMAIL=$(echo "$response" | jq -r .email)
GITHUB_USERNAME=$(echo "$response" | jq -r .login)


# Check for null name and handle it
if [[ "$GITHUB_NAME" == "null" ]]; then
    echo "Erros fetching your name. Please enter your name manually:"
    read -p "Enter your name: " GITHUB_NAME
fi

# Check for null email and handle it
if [[ "$GITHUB_EMAIL" == "null" ]]; then
    echo "Erros fetching your email. Please enter your email manually:"
    read -p "Enter your email: " GITHUB_EMAIL
fi


git config --global user.name "$GITHUB_NAME"
git config --global user.email "$GITHUB_EMAIL"


echo 
echo "Git has been configured with the following details:"
echo "----------------------------------------------"
git config --list
echo "----------------------------------------------"
echo


# Store credentials permanently without echoing
{
    echo "https://$GITHUB_USERNAME:$GITHUB_TOKEN@github.com"
} > ~/.git-credentials
