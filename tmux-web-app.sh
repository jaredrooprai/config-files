SESSION=web-app

tmux new-session -d -s ${SESSION}
tmux rename-window 'vim'
tmux send-keys 'cd ~/Sites/web-app' C-m
tmux send-keys 'v .' C-m

tmux new-window -t $SESSION:1 -n 'main'
tmux send-keys 'slow' C-m

tmux split-window -h
tmux send-keys 'leg-watch' C-m
tmux split-window -v
tmux send-keys 'leg-celery' C-m

tmux select-window -t $SESSION:0

tmux a -t $SESSION

