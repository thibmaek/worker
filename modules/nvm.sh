#!/usr/bin/env bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# nvm sources in the .bashrc by default. If .bash_profile
# is available, this if sources it in the .bash_profile instead.
# You still need to manually remove it from .bashrc though…
if [[ -f ~/.bash_profile ]]; then
  echo "export NVM_DIR='/Users/$(whoami)/.nvm'" >> ~/.bash_profile
  echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"" >> ~/.bash_profile
fi

# As long as the shell is not loaded `nvm` is unknown to the shell
# The shell will restart after worker is finished.
# For now they are run directly from the shell script in the nvm directory.
$NVM_DIR/nvm.sh install v5.0.0
$NVM_DIR/nvm.sh install v4.2.2
$NVM_DIR/nvm.sh alias default v4.2.2
