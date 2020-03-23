#!/bin/bash
# Sets up ssh-key, ssh-config. For setting up ssh-key, all we need to do is to
# check that it does not exist, and then run the ssh-keygen command. For
# ssh-config, we need to make sure that the permissions are set up correctly.
# Finally, we assume that the git repo was initialized using the http remote.
# we wish to automatically switch it to ssh remote.

# Sets up all ssh-key related things locally.
if [ ! -f $HOME/.ssh/id_rsa ]; then
    echo "Generating new public key."
    ssh-keygen -t rsa
fi

# Corrects the permission for ssh config file.
chmod 600 ~/.ssh/config

# Setup correct remotes.
if [ -z "`git remote -v | grep`" ]; then
    echo "Replacing http remote with ssh remote."
    git remote rm origin
    git remote add origin git@github.com:thkim1011/dotfiles.git
fi

# Finally, we look through the ~/.ssh directory to ensure all keys are of the
# right permissions.
for FILE in `ls ~/.ssh/*.pem`; do
    echo "Setting user-read only permission to $FILE."
    chmod 400 $FILE
done
