SESSION=web-docker

tmux new-session -d -s ${SESSION}
tmux rename-window 'main'
tmux send-keys 'dcu' C-m

tmux select-window -t $SESSION:0
