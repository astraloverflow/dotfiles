#!/usr/bin/env zsh

#####################################################
#               Dotfiles ZSH Config                 #
#####################################################
#                      WARNING                      #
# Don't edit this file for machine specific tweaks, #
# use zsh.local.sh instead                          #
#####################################################

# Basic Stuff
setopt append_history
setopt inc_append_history
setopt share_history
HISTSIZE=100000
SAVEHIST=100000
unsetopt correct_all
setopt NO_NOMATCH
typeset -U path
export BLOCK_SIZE="'1"
export EDITOR=vim

# zmodload zsh/zutil

# Enable Autocompletion & Suggestions
autoload -Uz compinit && compinit
setopt auto_menu
# ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

# Set Terminal Prompt
# Default is [host » user] ~/path/from/home $
PROMPT="[%F{yellow}%m%f » %F{cyan}%n%f] %F{green}%~%f $ "

# Add Stuff to $PATH
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/bin ]] && PATH=$HOME/bin:$PATH

# Include Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# Load Antigen bundles
antigen bundle mfaerevaag/wd

# Tell Antigen that you're done.
antigen apply

# Add wd to completions
fpath=(~/path/to/wd $fpath)

# Aliases
alias dotfiles="~/dotfiles/install.sh"
alias dotfiles-r-zsh=". ~/dotfiles/zsh.sh"
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="ls -hFG"
alias la="ls -ahFG"
alias lls="ls -lhFG"
alias lla="ls -lahFG"
alias grep="grep --color=auto"
alias vi="vim"
alias nv="nvim"
alias gst="git status"

# Tmux Session Function
function session {
    if [[ $1 = "leave" ]]; then
        tmux detach
    elif [[ $1 = "list" ]]; then
        tmux ls
    else
        tmux attach -t $1 || tmux new -s $1
    fi
}

# Tar folder excluding node_modules
function tar_exclude_npm {
    if [[ -z "$1" && -z "$2" ]]; then
        echo "Missing arguments"
        echo "  Usage: tar_exclude_npm SOURCE_DIR DEST_TAR_FILE"
        echo "  NOTE: do not include .tar in DEST_TAR_FILE, it will be added"
        echo "  Example:"
        echo "    tar_exclude_npm ./ my_react_project"
    else
        tar -cvf --exclude='node_modules' --exclude='.git/*' --exclude='.cache/*' -cvf $2.tar $1
    fi
}
