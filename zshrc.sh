#!/usr/bin/env zsh

#####################
#    Bash Config    #
#####################

# Include "default" dotfiles bash config
. ~/dotfiles/zsh.sh

# Include local machine specific tweaks & overrides
[[ -f ~/dotfiles/local/zsh.sh ]] && . ~/dotfiles/local/zsh.sh
