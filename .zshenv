# usage: pathmunge $path [after]
pathmunge()
{
    if ! echo $PATH | /bin/grep -qE "(^|:)$1($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH=$PATH:$1
        else
            PATH=$1:$PATH
        fi
    fi
}

# aliases
alias nv='nvim'
alias rm='echo "Please use trash-cli instead!"; false'
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# env_vars
export VISUAL=vim
export EDITOR=vim

# PATH
pathmunge $HOME/.local/bin
pathmunge $HOME/.cargo/bin after

unset -f pathmunge

