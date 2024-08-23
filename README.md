# cfg

Contains configuration items for bash and other cli utilities (like vim)

# Setup instructions:
- create ~/.id as defined below
- clone bct-embedded-linux to ~/Documents/bct-embedded-linux
    - (requires pre-installing git and running 'source ~/.id')
- clone this repo to ~/.cfg
- run: 
```bash
source ~/.cfg/usr.bashrc
```
- run: 
```bash
update_deps && install_cfg_file
```
- optional: run:
```bash
push_devboard_profile
```

# .id file
    - contains 
    ```bash
    GITHUB_TOKEN="blah"
    ```
    -style directives for:
        - GITHUB_TOKEN
        - JFROG_API_KEY
        - JFROG_USERNAME
        - DEV_BOARD_IP