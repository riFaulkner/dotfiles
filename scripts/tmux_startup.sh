#!/bin/bash

# TODO: make this script called on startup
# Goals for this script, this will be for my ghostty drop down. I want it to have a python interpreter in one window and a regular terminal in the other. Ideally the python terminal will be quite small since I mostly just use it for a calculator

SESSION="utils"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" == "" ]
then
# Create the session 
tmux new-session -d -s $SESSION

# Create a pane for python rename it and start the python interpreter
tmux rename-window -t 1 "python"
tmux send-keys -t $SESSION:python 'python3' C-m

# Create a pane for the terminal, this should take up the majority of the screen width
tmux split-window -dh -l 80%

fi

tmux attach-session -t $SESSION:python
