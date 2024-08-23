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
contains definitions in the below example
```bash
GITHUB_TOKEN="blah"
```
for:
- GITHUB_TOKEN (see https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
- JFROG_API_KEY
- JFROG_USERNAME
- DEV_BOARD_IP
- directive to run: `git config --global user.name <username>` 
- directive to run: `git config --global user.email <email>` 