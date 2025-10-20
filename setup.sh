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

DOTFILES_REPO="$PWD"

# Create a map of the different symlinks to create, then loop through the list and create the symlink, if it hasn't already been created
LINKS=(
    "$XDG_CONFIG_HOME/nvim" "$DOTFILES_REPO/nvim"
    "$XDG_CONFIG_HOME/tmux" "$DOTFILES_REPO/tmux"
    "$XDG_CONFIG_HOME/ghostty" "$DOTFILES_REPO/ghostty"
    "$XDG_CONFIG_HOME/py" "$DOTFILES_REPO/python"
)


for (( i=0; i<${#LINKS[@]}; i+=2 )); do
    TARGET="${LINKS[$i]}"
    SOURCE="${LINKS[$i+1]}"
    create_symlink "$SOURCE" "$TARGET"
done


# TODO: 
# I think the way I want to handle this config is to have my zshrc load one config file that I have in my dot files repo, that file can then source everything it need to
# - p10k
# - source scripts
# - override the omzsh customizations file
#    - This will allow for aliases to be loaded from my dotfiles config

ZSHRC="$HOME/.zshrc"
CUSTOMIZE_FILE="$DOTFILES_REPO/cli/init.zsh"
SOURCE_COMMAND="source $CUSTOMIZE_FILE"

if grep -q "source $SOURCE_COMMAND" "$ZSHRC"; then
    echo "# Setup customizations in dotfiles" >> "$ZSHRC"
    echo "source $CUSTOMIZE_FILE" >> "$ZSHRC"

    echo "$SOURCE_COMMAND"
    echo "Added customize file source to $ZSHRC"
else
    echo "Customize file already exists in $ZSHRC"
fi

#
# Reload .zshrc to apply changes
if [ -n "$ZSH_VERSION" ]; then
    echo "Reloading $ZSHRC"
    source "$ZSHRC"
else
    echo "Not running Zsh. Please reload your shell manually."
fi

