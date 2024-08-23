# cfg

Contains configuration items for bash and other cli utilities (like vim)

# Setup instructions:
    -create ~/.id as defined below
    -clone bct-embedded-linux to ~/Documents/bct-embedded-linux
        --(requires pre-installing git and running 'source ~/.id')
    -clone this repo to ~/.cfg
    -`source ~/.cfg/usr.bashrc`
    -`update_deps && install_cfg_file`
    -optional: `push_devboard_profile

# .id file
    -contains `GITHUB_TOKEN="blah"`