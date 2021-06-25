SESSION=web-front

tmux send-keys 'tmux a -t s-f' C-m

tmux new-session -d -s ${SESSION}
tmux rename-window 'vim'
tmux send-keys 'v' C-m
tmux send-keys '3' C-m

tmux new-window -t $SESSION:1 -n 'server'
tmux send-keys 'cd ~/sites/showpass-frontend' C-m
tmux send-keys 'nvm use' C-m
tmux send-keys 'npm run next:start' C-m
tmux select-window -t $SESSION:0

tmux a -t $SESSION
