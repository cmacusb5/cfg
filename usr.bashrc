#!/usr/bin/bash

# some basics
cs() { cd "$@" && ls; }
alias grep='grep -n'
PATH="$PATH:$HOME/.local/bin:."

#update av, update pkgs
alias update='sudo apt-get update && sudo apt-get -y upgrade && sudo apt -y autoremove'

#box-level dependencies, aka what do you need to install to get the box to work
BOX_DEPS='git'
update_deps() { 
    update && sudo apt-get -y install $BOX_DEPS; 
    }

# dev accelerators
alias ts='~/tempscript.sh'
alias gp='git push'
alias gs='git status'
alias gc='git commit'
gcp() { git commit "$@" && git push; }
alias ga='git add'
alias godev='cs PATH/TO/REPO && gs'
alias gocfg='cs ~/.cfg && gs'

# quick re-sourcing of the default bashrc env setup, including this file (if it's hooked up)
alias resource='source ~/.bashrc'

# a little unique string to query, see if this loaded right
alias cowsays='echo m0o!'

#source identity variables
source ~/identity

#installation command, so you don't have to `source` this file every time.
install_cfg_file() { echo "source ~/.cfg/usr.bashrc" >> .bashrc; ln ~/.cfg/vimrc ~/.vimrc; }