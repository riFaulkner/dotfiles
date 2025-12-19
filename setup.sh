#!/bin/bash

source "$(dirname "$0")/config.sh"

function create_symlink () {
    local SOURCE="$1"
    local TARGET="$2"

    if [ ! -e "$TARGET" ]; then
	if [ ! -L "$TARGET" ]; then
	    echo "Something is at the target ($TARGET) but it is not a symlink"
	fi

	mkdir -p "$(dirname "$TARGET")"
	ln -s "$SOURCE" "$TARGET"
	echo "Created symlink: $TARGET -> $SOURCE"
    else
	echo "Symlink already exists at: $TARGET"
    fi
}

# See config.sh for the list of links to create
for (( i=0; i<${#links[@]}; i+=2 )); do
    target="${links[$i]}"
    source="${links[$i+1]}"
    create_symlink "$source" "$target"
done

# Clone TPM if not already installed, this is a tmux plugin
TPM_DIR="${XDG_CONFIG_HOME}/tmux/plugins/tpm"
if [ ! -d "$TPM_DIR/.git" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi


CUSTOMIZE_FILE="$DOTFILES_REPO/cli/init.zsh"
SOURCE_COMMAND="source $CUSTOMIZE_FILE"

if ! grep -q "$SOURCE_COMMAND" "$ZSHRC"; then
    echo "# Setup customizations in dotfiles" >> "$ZSHRC"
    echo "$SOURCE_COMMAND" >> "$ZSHRC"

    echo "$SOURCE_COMMAND"
    echo "Added customize file source to $ZSHRC"
else
    echo "Customize file already exists in $ZSHRC"
fi

# Reload .zshrc to apply changes
if [ -n "$ZSH_VERSION" ]; then
    echo "Reloading $ZSHRC"
    source "$ZSHRC"
else
    echo "Not running Zsh. Please reload your shell manually."
fi

