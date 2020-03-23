#!/bin/bash
# These are commands specifically related to setting up WSL correctly.

if [ -z "`which pip3`" -o -z "`which pip`" ]; then
    echo "Installing pip and pip3"
    sudo apt update
    sudo apt install python3-pip
    sudo apt install python-pip
fi

if [ ! -f "$HOME/builds" ]; then
    mkdir ~/builds
fi

if ! $PROFILE; then
    echo "PROFILE=/mnt/c/Users/thkim/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json"\
        >> ~/.bashrc
fi
