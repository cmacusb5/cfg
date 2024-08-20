#!/usr/bin/bash

# Setup instructions:
    # create ~/.id as defined below
    # clone bct-embedded-linux to ~/Documents/bct-embedded-linux
        # (requires pre-installing git and running 'source ~/.id')
    # clone this repo to ~/.cfg
    # source this file
    # run 'update_deps && install_cfg_file'

# some basics
cs() { cd "$@" && ls; }
alias grep='grep -n'
PATH="$PATH:$HOME/.local/bin:."

#update pkgs
alias update='sudo apt-get update && sudo apt-get -y upgrade && sudo apt -y autoremove'

# dev accelerators
alias ts='~/tempscript.sh'
alias gp='git push'
alias gs='git status'
alias gc='git commit'
gcp() { git commit "$@" && git push; return $?;}
alias ga='git add'
alias godev='cs ~/Documents/bct-embedded-linux && gs'
alias gocfg='cs ~/.cfg && gs'
alias pyvenv='python3.8 -m venv ~/dev3.8 && source ~/dev3.8/bin/activate'
#and use 'deactivate' to exit the venv. 
#Requires the PY_DEPS and update_deps as defined below

#box-level dependencies, aka what do you need to install to get the box to work
PY_DEPS='python3.8 python3.8-venv'
BOX_DEPS="$PY_DEPS git wget ca-certificates g++ gdb make  rsync zip docker ninja-build"
update_deps() { 
    sudo add-apt-repository -y ppa:deadsnakes/ppa && \
    sudo apt-get update && \
    sudo apt-get -y install $BOX_DEPS && \
    sudo apt-get -y upgrade && \
    sudo apt-get -y autoremove && \
    pyvenv && \
    pip install pytest && \
    pip install -r ~/Documents/bct-embedded-linux/Common/Automation/Pytest/requirements.txt 
    deactivate;
    return $?;
    }

cleanup_python_3.8() {
    sudo apt-get remove -y $PY_DEPS && \
    sudo add-apt-repository ppa:deadsnakes/ppa --remove -y && \
    sudo apt-get autoremove -y;
    rm -rf ~/dev3.8
    return $?;
}

# quick re-sourcing of the default bashrc env setup, including this file (if it's hooked up)
alias resource='source ~/.bashrc'

# a little unique string to query, see if this loaded right
alias cowsays='echo m0o!'

#source identity variables
source ~/.id
# This file should define (A simple "key='value'" directive should suffice unless you need to run something):
    # GITHUB_TOKEN (should be a Personal access token. 
        # See https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
    # running 'git config --global user.name <username>'
    # running 'git config --global user.email <email>'. 
    # JFROG_API_KEY
    # JFROG_USERNAME.

#installation command, so you don't have to `source` this file every time.
install_cfg_file() { echo "source ~/.cfg/usr.bashrc" >> .bashrc; ln ~/.cfg/vimrc ~/.vimrc; }