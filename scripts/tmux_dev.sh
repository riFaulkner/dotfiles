#!/bin/bash

echo "Creating a new session named: " $1
SESSION=$1
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" == "" ]
then

tmux new-session -d -s $SESSION

tmux rename-window -t 1 "code"
tmux send-keys -t $SESSION:code 'nvim .' C-m

tmux new-window -t $SESSION -n 'git'
tmux send-keys -t $SESSION:git 'lg' C-m

tmux new-window -t $SESSION -n 'shell'


fi
tmux attach-session -t $SESSION:code
