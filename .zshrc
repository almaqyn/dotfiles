# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Prompt theme
ZSH_THEME="jispwoso"

# Configure ssh-agent plugin
zstyle :omz:plugins:ssh-agent lazy yes

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins to enable
plugins=(eza pipenv rust ssh-agent vi-mode wd)

source $ZSH/oh-my-zsh.sh

#######################
#                     #
# User configurations #
#                     #
#######################

pathgrep() {
    echo $PATH | tr ":" "\n" | uniq | xargs fd $@ 2> /dev/null
}

help() {
    $@ --help | $PAGER
}

# Load Angular CLI autocompletion
[ -f ~/.angular-completions.zsh ] && source ~/.angular-completions.zsh

# Enable fzf autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load RVM into a shell session *as a function*
[ -f "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"

