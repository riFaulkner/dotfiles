DOTFILES_CLI_DIR=${0:A:h}
DOTFILES_ROOT_DIR="${DOTFILES_CLI_DIR:h}"

# Source in aliases and other files as this init grows
source "${DOTFILES_CLI_DIR}/aliases.zsh"
source "${DOTFILES_CLI_DIR}/secrets.zsh"

for script in $DOTFILES_ROOT_DIR/scripts/*.sh; do
	[ -r "$script" ] && source "$script"
done


