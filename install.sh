#!/usr/bin/env bash

if [[ $1 = "bash" ]]; then
  echo "bash Selected"
  cp ~/dotfiles/bashrc.sh ~/.bashrc \
  && echo ".bashrc copied successfully"

elif [[ $1 = "tmux" ]]; then
  echo "tmux Selected"
  cp ~/dotfiles/tmux.conf ~/.tmux.conf \
  && echo ".tmux.conf copied successfully"

elif [[ $1 = "vim" ]]; then
  echo "vim Selected"
  cp ~/dotfiles/vimrc.vim ~/.vimrc \
  && echo ".vimrc copied successfully"

elif [[ $1 = "vim-plug" ]]; then
  echo "vim-plug Selected"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && echo "vim-plug downloaded successfully"

elif [[ $1 = "vim-minimal" ]]; then
  echo "vim-minimal Selected"
  cp ~/dotfiles/vim/vimrc-minimal.vim ~/.vimrc \
  && echo ".vimrc copied successfully"

else
  if [[ $1 != "" ]]; then
    echo ""
    echo "  ##################################################"
    echo ""
    echo "    [!] Not a valid installer "
    echo ""
    echo "  ##################################################"
    echo ""
  fi
  echo ""
  echo "  Available Installers (case sensitive)"
  echo ""
  echo "    bash"
  echo "      Bash (Terminal Enviroment) Config"
  echo "      (~/.bashrc)"
  echo ""
  echo "    tmux"
  echo "      Tmux (Terminal Multiplexer) Config"
  echo "      (~/.tmux.conf)"
  echo ""
  echo "    vim"
  echo "      vim (Terminal Text Editor) Config"
  echo "      (~/.vimrc)"
  echo ""
  echo "    vim-plug"
  echo "      vim-plug (a plugin manager for vim) Installation"
  echo "      [REQUIRES CURL]"
  echo "      (~/.vim/autoload/plug.vim)"
  echo ""
  echo "    vim-minimal"
  echo "      vim Config, without vim-plug & plugins"
  echo "      (~/.vimrc) "
  echo ""
fi
