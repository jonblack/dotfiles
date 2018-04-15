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

source $HOME/.cargo/env

export PATH=/home/jon/.bin:$PATH

# Android development
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export ANDROID_HOME=/home/jon/.android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jon/.sdkman"
[[ -s "/home/jon/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jon/.sdkman/bin/sdkman-init.sh"
