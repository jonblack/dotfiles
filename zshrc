source ~/dotfiles/submodules/antigen/antigen.zsh

antigen use oh-my-zsh

export NVM_LAZY_LOAD=true

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle lukechilds/zsh-nvm

antigen theme blinks
antigen apply

# Aliases
alias ls="ls --color --group-directories-first"

source $HOME/.cargo/env

export PATH=/home/jon/.bin:$PATH

# gnome-keyring-daemon
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
