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
alias gco='git checkout'
gcp() { git commit "$@" && git push; return $?;}
gnewbranch() { git checkout -b "$1" && git push --set-upstream origin "$1"; }
alias ga='git add'
go() { cs $1 && gs; }
alias gocfg='go ~/.cfg'
alias gomaster='go ~/Documents/bct-embedded-linux-master'
godev() { 
   if [ $# -ne 0 ]; then
      go ~/Documents/bct-embedded-linux/"$1";
   else
      go ~/Documents/bct-embedded-linux;
   fi
}

#easy shortcuts for dev board work. DEV_BOARD_IP should be defined in ~/.id
alias devboard='ssh root@$DEV_BOARD_IP'
alias db='devboard'

source ~/.cfg/python-venv
#box-level dependencies, aka what do you need to install to get the box to work
BOX_DEPS="git wget ca-certificates g++ gdb make rsync zip docker ninja-build"
update_deps() { 
   sudo apt-get update && \
   sudo apt-get -y install $BOX_DEPS && \
   sudo apt-get -y upgrade && \
   install_python_3_8 && \
   sudo apt-get -y autoremove;
   return $?
   }


# quick re-sourcing of the default bashrc env setup, including this file (if it's hooked up)
alias resource='source ~/.bashrc'

# a little unique string to query, see if this loaded right
alias cowsays='echo m0o!'

#source identity variables
source ~/.id
# This file should include:
    # 'export GITHUB_TOKEN="token here"' (should be a Personal access token) 
        # See https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
    # running 'git config --global user.name <username>'
    # running 'git config --global user.email <email>' 
    # 'export JFROG_API_KEY="key here"'
    # 'export JFROG_USERNAME="Username here"'
    # DEV_BOARD_IP="#.#.#.#"

#installation command, so you don't have to `source` this file every time.
install_cfg_file() { 
   echo "source ~/.cfg/usr.bashrc" >> .bashrc && \
   ln ~/.cfg/vimrc ~/.vimrc;
   return $?; 
}

# installation of devboard.profile
alias push_devboard_profile='scp ~/.cfg/devboard.profile root@$DEV_BOARD_IP:~/.profile && scp ~/.cfg/vimrc root@$DEV_BOARD_IP:~/.vimrc'

alias configure_devboard_pwdless_ssh='ssh-keygen -t rsa; db mkdir -p ~/.ssh && ssh-copy-id root@$DEV_BOARD_IP'

alias setup_devboard='configure_devboard_pwdless_ssh && push_devboard_profile'