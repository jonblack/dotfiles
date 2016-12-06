source ~/dotfiles/submodules/antigen/antigen.zsh

antigen use oh-my-zsh

export NVM_LAZY_LOAD=true

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle lukechilds/zsh-nvm

antigen theme alanpeabody
antigen apply

# Aliases
alias apts="aptitude search"
alias apti="sudo aptitude install"
alias grepr="grep -rn --color"
alias ls="ls --color --group-directories-first"
