#!/bin/bash

t_init() {
	SESSION="utils"
	SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

	if [ -z "$SESSIONEXISTS" ]; then
	# Create the session 
	tmux new-session -d -s $SESSION

	# Create a pane for python rename it and start the python interpreter
	tmux rename-window -t 1 "python"
	tmux send-keys -t $SESSION:python 'source ~/.config/py/util/env/.venv' C-m
	tmux send-keys -t $SESSION:python 'python3' C-m
	tmux send-keys -t $SESSION:python 'python3 -i ~/.config/py/util/env/utils.py' C-m

	# Create a pane for the terminal, this should take up the majority of the screen width
	tmux split-window -dh -l 80%
	fi

	tmux attach-session -t $SESSION:python
}

t_new() {
	DIR=$(pwd)
	SESSION=$(echo "$1" | xargs)
	echo "Creating a new session named: " $SESSION

	if ! tmux has-session -t "$SESSION" 2>/dev/null; then

	tmux new-session -d -s "$SESSION" -c $DIR -n nvim

	tmux send-keys -t "$SESSION:nvim" 'nvim .' C-m

	tmux new-window -t $SESSION -n shell

	fi

	tmux attach-session -t $SESSION:nvim
}

