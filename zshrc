source ~/dotfiles/submodules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme wedisagree
antigen apply

# Aliases
alias apts="aptitude search"
alias apti="sudo aptitude install"
alias grepr="grep -rn --color"
alias ls="ls --color --group-directories-first"
