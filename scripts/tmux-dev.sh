#!/bin/bash

t_init() {
	SESSION="utils"
	SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)
	PY_DIR="$HOME/.config/py/util/env"
	VENV_PATH="$PY_DIR/.venv"
	REQUIREMENTS_PATH="$PY_DIR/requirements.txt"
	UTILS_PATH="$PY_DIR/utils.py"

	# Check if venv exists, create if it doesn't
	if [ ! -d "$VENV_PATH" ]; then
		echo "Virtual environment not found. Creating at $VENV_PATH..."
		mkdir -p "$PY_DIR"
		python3 -m venv "$VENV_PATH"
		echo "Virtual environment created successfully."
	fi

	if [ -z "$SESSIONEXISTS" ]; then
	# Create the session
	tmux new-session -d -s $SESSION

	# Create a pane for python rename it and start the python interpreter
	tmux rename-window -t 1 "python"
	tmux send-keys -t $SESSION:python "source $VENV_PATH/bin/activate" C-m
	tmux send-keys -t $SESSION:python "pip install -q -r $REQUIREMENTS_PATH" C-m
	tmux send-keys -t $SESSION:python "python3 -i $UTILS_PATH" C-m

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

	tmux new-session -d -s "$SESSION" -c "$DIR" -n nvim

	tmux send-keys -t "$SESSION:nvim" 'nvim .' C-m

	tmux new-window -t "$SESSION" -n shell

	fi

	tmux attach-session -t "$SESSION:nvim"
}

