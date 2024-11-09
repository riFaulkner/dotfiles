#!/bin/sh
#shopt -s expand_aliases


# Git Aliases
git config --global alias.cam 'commit -am'
git config --global alias.co 'checkout'
git config --global alias.cob 'co -b'
git config --global alias.re 'reset --hard'
git config --global alias.s 'status'
git config --system alias.up '!sh -c "git pull --prune && git sub module update --init --recursive"'


git config --system color.ui "true";
git config --system push.default "current";
git config --system alias.st "status -sb";

git config --system alias.ci "commit";
git config --system alias.d "diff";

git config --system alias.cp "cherry-pick";

git config --system alias.unstage "reset HEAD";
git config --system alias.ca "commit --amend";
git config --system alias.caa "commit -a --amend -C HEAD";

git config --system alias.pr "pull-request";
git config --system hub.protocol "https";
git config --global pull.rebase false


alias k=kubectl
alias kx=switch 
alias v='nvim .'
alias lg=lazygit
