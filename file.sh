#! /usr/bin/bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if assetfinder is installed; if not, install it
if ! command_exists "assetfinder"; then
    echo "Installing assetfinder..."
    sudo apt install -y assetfinder
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install assetfinder."
        exit 1
    fi
fi

# Check if httprobe is installed; if not, install it
if ! command_exists "httprobe"; then
    echo "Installing httprobe..."
    sudo apt install -y httprobe
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install httprobe."
        exit 1
    fi
fi

echo -e "\e[31m██████  █████ ██████ ██   ██    ██     ███████████████  
██   ████   ████   ████  ██     ██     ████     ██   ██ 
██   ███████████████ █████      ██  █  ███████  ██████  
██   ████   ████   ████  ██     ██ ███ ████     ██   ██ 
██████ ██   ████   ████   ██     ███ ███ █████████████  
                                                        "
echo "The dark web is the World Wide Web content that exists on darknets"
read -p "Enter Domain Name:" hello
assetfinder $hello > test 
cat test | httprobe > live
sort -u live > sorted
cat sorted 

