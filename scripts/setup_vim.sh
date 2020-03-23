#!/bin/bash
# This is a script for installing vim from source.

# Ensure the builds directory exists.
if [ ! -d $HOME/builds ]; then
    mkdir ~/builds
fi

cd ~/builds

# Clone the source code from github.
git clone --depth=1 https://github.com/vim/vim.git
cd vim

    # install libncurses5-dev 
