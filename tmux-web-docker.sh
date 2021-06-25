SESSION=web-docker

tmux new-session -d -s ${SESSION}
tmux rename-window 'main'
tmux send-keys 'dcu' C-m

tmux split-window -v
tmux send-keys 'cd ~/Sites/web-k8s' C-m
tmux send-keys '. bin/activate' C-m

tmux select-window -t $SESSION:0
