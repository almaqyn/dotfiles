# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Prompt theme
ZSH_THEME="jispwoso"

# Configure ssh-agent plugin
zstyle :omz:plugins:ssh-agent lazy yes

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins to enable
plugins=(git vi-mode ssh-agent)

source $ZSH/oh-my-zsh.sh

#######################
#                     #
# User configurations #
#                     #
#######################

# Load Angular CLI autocompletion
[ -f ~/.angular-completions.zsh ] && source ~/.angular-completions.zsh

# Enable fzf autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

