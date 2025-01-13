#!/bin/bash

# TODO: make this script called on startup
# Goals for this script, this will be for my ghostty drop down. I want it to have a python interpreter in one window and a regular terminal in the other. Ideally the python terminal will be quite small since I mostly just use it for a calculator

SESSION="utils"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" == "" ]
then
tmux new-session -d -s $session
tmux rename-window -t 0 "python"

# tmux window-name -t $SESSION:0 "python"
# tmux send-keys -t $SESSION:0.0 'python' 
tmux send-keys -t $SESSION:python 'python'

tmux split-window -dh -l 80%

fi

tmux attach-session -t $SESSION:0
