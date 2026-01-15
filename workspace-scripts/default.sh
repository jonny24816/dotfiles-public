SESSION_NAME=${1:-"default"}
BRANCH=${2:-"main"}
DIRECTORY=${3:-"."}

tmux new-session -s ${SESSION_NAME} -d -n explorer
tmux new-window -t ${SESSION_NAME} -d -n dotfiles
tmux new-window -t ${SESSION_NAME} -d -n docker
tmux new-window -t ${SESSION_NAME} -d -n apicalls

tmux select-window -t ${SESSION_NAME}:explorer
tmux split-window -h
tmux send-keys "clear" Enter 
tmux split-window -v
tmux send-keys "clear" Enter 
tmux select-layout main-vertical

tmux select-window -t ${SESSION_NAME}:dotfiles
tmux send-keys "cd ~/dotfiles; clear" Enter 

tmux select-window -t ${SESSION_NAME}:docker
tmux send-keys "cd ~; clear" Enter 
tmux split-window -v
tmux send-keys "cd ~; clear" Enter
tmux send-keys "echo \"ADD DOCKER POLLING TOOL HERE\"" Enter

tmux select-window -t ${SESSION_NAME}:explorer
tmux switch-client -t ${SESSION_NAME}
