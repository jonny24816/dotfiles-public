platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

if [[ $platform == "linux" ]]; then
    source ~/dotfiles/.zshrc_linux
fi 
if [[ $platform == "mac" ]]; then
    source ~/dotfiles/.zshrc_mac
fi 


# export useful envars
source ~/.env_vars
source ~/.env_vars_local

# export path changes

# zsh options

# zsh options.history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_save_no_dups

# keybindings

bindkey -v
bindkey '^p' history-search-forward
bindkey '^n' history-search-backward

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colours '${(s.:.)LS_COLORS}'

# prompt
eval "$(oh-my-posh init zsh --config $HOME/.base.toml)"

#  autoSetupRemote = trueommand completion

# aliases
alias g=git
alias gco="git checkout"
alias dca="docker-clean-active"
alias dci="docker-clean-images"
alias zshrs="source ~/.zshrc"
alias vim="nvim"
alias c="clear"
alias ls="ls --color"
alias k="kubectl"

source ~/.functions

# custom functions

# other (zshrc commands for other installed packages)

# other.zoxide
eval "$(fzf --zsh)"

eval "$(zoxide init zsh)"

# zsh-users plugins

source ~/dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath=(~/dotfiles/zsh-completions/src $fpath)

# echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc sort of thing for adding to a setup.sh script
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jonathanhughes/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Created by `pipx` on 2025-10-07 14:35:53
export PATH="$PATH:/Users/jonathanhughes/.local/bin"

autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
