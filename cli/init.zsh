export XDG_CONFIG_HOME="$HOME/.config"

DOTFILES_CLI_DIR=${0:A:h}
DOTFILES_ROOT_DIR="${DOTFILES_CLI_DIR:h}"

# Auto copmlete to uv for python
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# Source in aliases and other files as this init grows
source "${DOTFILES_CLI_DIR}/aliases.zsh"
source "${DOTFILES_CLI_DIR}/secrets.zsh"

for script in $DOTFILES_ROOT_DIR/scripts/*.sh; do
	[ -r "$script" ] && source "$script"
done


