# dotfiles
Backup restore and version control for dotfiles used in development config

## Requirements

- gnu stow (enables storing of dotfiles in seperate directory, usually ~/dotfiles away from $HOME) https://www.gnu.org/software/stow/manual/stow.html
- git (allows version control of ~/dotfiles as a repo)
- set up github ssh key see:
  + https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent  
  + https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account 

## Set up new env from scratch

1. Change shell to zsh
2. Install homebrew (https://brew.sh/) and follow the post install tasks
3. run 'brew install' for 'git', 'stow' , 'zoxide', 'tmux', 'fzf'  
4. clone this repo directly within the $HOME directory
5. run 'stow .' to set up the symlinked dot files in the $HOME directory
6. clone https://github.com/romkatv/powerlevel10k directly within the $HOME directory
7. for envars are split along those that are system specific and those that are global 
- global/sharable env vars go in to '.env_vars' check for conflicts
- private env vars go in to '.env_vars_local' this is ignored but allows a single file to be in sync with other dotfiles  
8. zsh user additions
- clone zsh-users/zsh-syntax-highlighting, zsh-users/zsh-completions, zsh-users/zsh-autosuggestions 
## Making changes
