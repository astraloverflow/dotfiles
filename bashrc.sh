#####################
#    Bash Config    #
#####################
#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ -z $PS1 ]] && return

# Include "default" dotfiles bash config
. ~/dotfiles/bash.sh

# Include local machine specific tweaks & overrides
[[ -f ~/dotfiles/local/bash.sh ]] && . ~/dotfiles/local/bash.sh
