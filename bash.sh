#!/usr/bin/env bash

#####################################################
#               Dotfiles Bash Config                #
#####################################################
#                      WARNING                      #
# Don't edit this file for machine specific tweaks, #
# use bash.local.sh instead                         #
#####################################################

# Basic Stuff
shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT="%F %T "
PROMPT_COMMAND="history -a;"
export EDITOR=vim

# Enable Autocompletion & Suggestions
[[ -f /etc/bash_completion ]] && . /etc/bash_completion
bind "set show-all-if-ambiguous on"
bind "TAB:menu-complete"
shopt -s no_empty_cmd_completion

# Set Terminal Prompt
# Default is [host » user] ~/path/from/home $
if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
    PS1="[\[\e[33m\]\h\[\e[m\] » \[\e[36m\]\u\[\e[m\]] \[\e[32m\]\w\[\e[m\] \$ "
else
    PS1="[\h » \u] \w \$ "
fi

# Add Stuff to $PATH
[[ -d $HOME/.bin ]] && PATH=$HOME/.bin:$PATH
[[ -d $HOME/bin ]] && PATH=$HOME/bin:$PATH

# Aliases
alias dotfiles="~/dotfiles/install.sh"
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="ls -hF --color=auto --group-directories-first"
alias la="ls -ahF --color=auto --group-directories-first"
alias lls="ls -lhF --color=auto --group-directories-first"
alias lla="ls -lahF --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias vi="vim"
alias nv="nvim"
alias gst="git status"
alias yt-mp3="youtube-dl -x --audio-format mp3 -f bestaudio"
alias yt-mp4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"
alias yt-webm="youtube-dl -f 'bestvideo[ext=webm]+bestaudio/bestvideo+bestaudio' --merge-output-format webm"

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
        tar -cvf --exclude='node_modules' --exclude='.git/*' --exclude='.cache/*' $2.tar $1
    fi
}

