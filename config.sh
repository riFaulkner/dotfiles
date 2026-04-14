#!/bin/bash
: "${XDG_CONFIG_HOME:=$HOME/.config}"

DOTFILES_REPO="$PWD"
ZSHRC="$HOME/.zshrc"

links=(
    "$XDG_CONFIG_HOME/nvim" "$DOTFILES_REPO/nvim"
    "$XDG_CONFIG_HOME/tmux/tmux.conf" "$DOTFILES_REPO/tmux/tmux.conf"
    "$XDG_CONFIG_HOME/ghostty" "$DOTFILES_REPO/ghostty"
    "$XDG_CONFIG_HOME/py" "$DOTFILES_REPO/python"
    "$XDG_CONFIG_HOME/k9s" "$DOTFILES_REPO/k9s"
)

# TMP is a tmux plugin, requires to be installed from git
TPM_DIR="${XDG_CONFIG_HOME}/tmux/plugins/tpm"
