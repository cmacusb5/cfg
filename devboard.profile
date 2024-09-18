#!/bin/sh
# Cameron MacDonald

# accelerators
cs() { cd "$@" && ls; }
alias grep='grep -n'
PATH="$PATH:$HOME/.local/bin:."
alias la='ls -a'
alias ll='ls -l'

# some 
soft_reboot() { 
   redis-cli -s /data/share/redis.sock publish ResetDeviceMessage '{"powerOff":false}'; 
   return $?;
}
alias ifconfig='lxc-ls -f'
