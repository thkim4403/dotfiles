#!/bin/bash
# Installs powerline. Adds the relevant commands to bashrc.
source setup_vars.sh

if $IS_WSL; then
    OUTPUT_PATH=~/.profile
else
    OUTPUT_PATH=~/.bashrc
fi

PYTHON=/usr/bin/python3
PIP=/usr/bin/pip3

if [ -z "$($PIP show powerline-status)" ]; then
    echo "Installing powerline."
    $PIP install powerline-status
fi

POWERLINE_PATH=$($PIP show powerline-status | grep Location: | cut -d' ' -f2)

echo "Found successful powerline installation at $POWERLINE_PATH."

# Ensure .bashrc does not already have powerline setup.
if [ -z "$(cat $OUTPUT_PATH | grep powerline-daemon)" ]; then
    echo "Installing powerline into $OUTPUT_PATH"
    echo >> $OUTPUT_PATH
    echo "# Setting up powerline." >> $OUTPUT_PATH
    echo "powerline-daemon -q" >> $OUTPUT_PATH
    echo "POWERLINE_BASH_CONTINUATION=1" >> $OUTPUT_PATH
    echo "POWERLINE_BASH_SELECT=1" >> $OUTPUT_PATH
    echo "source $POWERLINE_PATH/powerline/bindings/bash/powerline.sh" >> \
        $OUTPUT_PATH
else
    echo "Powerline already installed into $OUTPUT_PATH"
fi
