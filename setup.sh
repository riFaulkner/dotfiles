#!/bin/bash

# Ensure XDG_CONFIG_HOME is set
: "${XDG_CONFIG_HOME:=$HOME/.config}"

function create_symlink () {
    local SOURCE="$1"
    local TARGET="$2"

    if [ ! -e "$TARGET" ]; then
	ln -s "$SOURCE" "$TARGET"
	echo "Created symlink: $TARGET -> $SOURCE"
    else
	echo "Symlink already exists at: $TARGET"
    fi
}

# Variables
DOTFILES_REPO="$PWD"
NVIM_TARGET="$XDG_CONFIG_HOME/nvim"

# Create a map of the different symlinks to create, then loop through the list and create the symlink, if it hasnt already been created
LINKS=(
    "$XDG_CONFIG_HOME/nvim" "$DOTFILES_REPO/nvim"
    "$XDG_CONFIG_HOME/tmux/tmux.conf" "$DOTFILES_REPO/tmux/tmux.conf"
    "$XDG_CONFIG_HOME/ghostty/config" "$DOTFILES_REPO/ghostty/config"
    # "$HOME/.gitconfig" "$DOTFILES_REPO/git/gitconfig"
    # "$HOME/.zshhrc" "$DOTFILES_REPO/bash/bashrc" TODO: add .zshrc to dotfiles
    # "$HOME/.zshrc" "$DOTFILES_REPO/zsh/zshrc"
)


for (( i=0; i<${#LINKS[@]}; i+=2 )); do
    TARGET="${LINKS[$i]}"
    SOURCE="${LINKS[$i+1]}"
    create_symlink "$SOURCE" "$TARGET"
done
#
# # Neovim
# if [ ! -e "$NVIM_TARGET" ]; then
# 	NVIM_SOURCE="$DOTFILES_REPO/nvim"
#     echo "Nothing exists at target: $NVIM_TARGET"
# 	ln -s "$NVIM_SOURCE" "$NVIM_TARGET"
# 	echo "Created symlink: $NVIM_TARGET -> $NVIM_SOURCE"
# else
# 	echo "Symlink already exists at: $NVIM_TARGET"
# fi
#
# # Tmux
# TMUX_TARGET="$XDG_CONFIG_HOME/tmux/tmux.conf"
# if [ ! -e "$TMUX_TARGET" ]; then
# 	TMUX_SOURCE="$DOTFILES_REPO/tmux/tmux.conf"
# 	echo "Nothing at tmux config target: $TMUX_TARGET"
# 	ln -s "$TMUX_SOURCE" "$TMUX_TARET"
# 	echo "Created symlink: $TMUX_TARGET -> $TMUX_SOURCE"
# else
# 	echo "Symlink already exists at $TMUX_TARGET"
# fi
#
#
# # setup the .zshrc to use the cli_config file
# OMZ_CUSTOMIZE_DIR=" "
# ALIAS_FILE="$DOTFILES_REPO/cli_conf/aliases.zsh"
# // instead of using an alias, add the .zsh files to the custom directory for Oh My ZSH
#
#
# # Add a source line for aliases if not already present
# if ! grep -q "source $ALIAS_FILE" "$ZSHRC"; then
# 	echo "# Aliases" >> "$ZSHRC"
#     echo "source $ALIAS_FILE" >> "$ZSHRC"
#     echo "Added alias source to $ZSHRC"
# else
#     echo "Alias source already exists in $ZSHRC"
# fi
#
#
# ZSHRC="$HOME/.zshrc"
#
# # Reload .zshrc to apply changes
# if [ -n "$ZSH_VERSION" ]; then
#     echo "Reloading $ZSHRC"
#     source "$ZSHRC"
# else
#     echo "Not running Zsh. Please reload your shell manually."
# fi

