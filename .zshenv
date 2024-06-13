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

export JAVA_HOME=/snap/openjdk/current/jdk
export BOOST_ROOT=$HOME/libs/boost
export FLUTTER_ROOT=$HOME/tools/flutter
export ANDROID_HOME=$HOME/tools/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export CHROME_EXECUTABLE=/snap/bin/chromium

# PATH
pathmunge $HOME/.local/bin
pathmunge $HOME/.cargo/bin
pathmunge $HOME/tools/flutter/bin
pathmunge $JAVA_HOME/bin
pathmunge $ANDROID_HOME/cmdline-tools/latest/bin
pathmunge $ANDROID_HOME/platform-tools

unset -f pathmunge

