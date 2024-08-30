# cfg

Contains configuration items for bash and other cli utilities (like vim)

# Contents
- a vimrc file, which sets up vim how I like it. YMMV
- a python-venv file, which sets up a python virtual environment for python3.8
- a devboard.profile, which (when installed on your dev board) configures the default Bourne shell to have some cli shortcuts/accelerators
- a usr.bashrc file that contains local bash configuration directives for various cli shortcuts/accelerators as well as commands to install the other 3 files. See Setup Instructions below


# Setup instructions:
- create ~/.id as defined below
- clone bct-embedded-linux to ~/Documents/bct-embedded-linux
   - (requires pre-installing git and running `source ~/.id`)
- clone this repo to ~/.cfg
- run: `source ~/.cfg/usr.bashrc`
- run: `update_deps && install_cfg_file`
- (optional) run: `push_devboard_profile` 
- (optional) run: `configure_devboard_pwdless_ssh`


# .id file
contains identity definitions:
- `export GITHUB_TOKEN='token here'` (see https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
- `export JFROG_API_KEY='key here'`
- `export JFROG_USERNAME='username here'`
- `DEV_BOARD_IP='ip address here'`
- directive to run: `git config --global user.name <username>` 
- directive to run: `git config --global user.email <email>` 

# Docker setup for local device builds on WSL
- update_deps to install wsl-side dependencies (if not already done)
- Follow https://docs.docker.com/desktop/wsl/ to set up docker with WSL integration. 
   - for installing Docker Desktop with the Thycotic Permission Access Manager you will need to use the "TBCT - Request Run as Administrator" option in Windows
   - Make sure to enable enable Docker Desktop > Settings > Resources > WSL Integration.
   - Make sure to execute (from windows cmd or powershell) `wsl --set-default Ubuntu`