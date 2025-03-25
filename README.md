# GETTING STARTED


```bash
./setup.sh

```

Run the dotfiles setup script. This will run a `brew install` to install all the necessary packages and then symlink the dotfiles to the home directory. There are some minor updates that need to be done to the .zshrc file to get everything fully connected and working -- though soon that should be taken care of. All scripts in the `./scripts` file are loaded on shell startup. 

- `brew install` -- install external dependencies from the Brewfile
- symlink dotfiles to XDG_CONFIG_HOME directory
   - nvim config
   - tmux config
   - ghosty config
- .zshrc updates
   - [TODO] automate adding `./cli_conf/custom` to .zshrc (this is how the aliases are loaded)
   - 

