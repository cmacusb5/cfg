#!/usr/bin/bash

# some basics
cs() { cd "$@" && ls; }
alias grep='grep -n'
PATH="$PATH:$HOME/.local/bin:."

#update pkgs
alias update='sudo apt-get update && sudo apt-get -y upgrade && sudo apt -y autoremove'

#box-level dependencies, aka what do you need to install to get the box to work
PY_DEPS='python3.8 python3.8-venv'
BOX_DEPS="git $PY_DEPS"
update_deps() { 
    sudo add-apt-repository -y ppa:deadsnakes/ppa && \
    sudo apt-get update && \
    sudo apt-get -y install $BOX_DEPS && \
    sudo apt-get -y upgrade && \
    sudo apt-get -y autoremove && \
    pyvenv && \
    pip install pytest && \
    deactivate;
    return $?
    }

cleanup_python_3.8() {
    sudo apt-get remove -y $PY_DEPS && \
    sudo add-apt-repository ppa:deadsnakes/ppa --remove -y && \
    sudo apt-get autoremove -y;
    return $?;
}

alias pyvenv='python3.8 -m venv dev3.8 && source dev3.8/bin/activate'
#and use 'deactivate' to exit the venv

# dev accelerators
alias ts='~/tempscript.sh'
alias gp='git push'
alias gs='git status'
alias gc='git commit'
gcp() { git commit "$@" && git push; return $?;}
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