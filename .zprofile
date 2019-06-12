export EDITOR=/usr/bin/vim

alias tmux='tmux -u'
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux attach -t default || tmux new -s default
fi
