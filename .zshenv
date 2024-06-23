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
alias jf='wd'
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

FD_TOOL="fd"
FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"

export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard 2>/dev/null || ${FD_TOOL} ${FD_OPTIONS} --type f --type l"
export FZF_DEFAULT_OPTS="\
  --no-mouse \
  --no-scrollbar \
  --multi \
  --cycle \
  --reverse \
  --marker=+ \
  --height=80% \
  --border=none \
  --info=inline \
  --preview='if [ -d {} ]; then tree -C -L 2 {}; elif [ -f {} ]; then bat -f --style=numbers {}; fi' \
  --preview-window='right:60%:wrap,<50(bottom,50%)' \
  --history='$HOME/.fzf_history' --history-size=50 \
  --bind='f3:execute(bat --style=numbers {} || less -f {})' \
  --bind='f4:execute($EDITOR {})' \
  --bind='alt-w:toggle-preview-wrap' \
  --bind='ctrl-d:half-page-down' \
  --bind='ctrl-u:half-page-up' \
  --bind='ctrl-x:execute(rm -i {+})+abort' \
  --bind='ctrl-l:clear-query+first' \
  --bind='ctrl-y:execute-silent(echo {+} | xclip)+abort' \
  --bind='ctrl-\:change-preview-window(hidden|bottom,50%|right:60%)'"

#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_CTRL_T_OPTS=""

export FZF_CTRL_R_OPTS=" \
  --height=60% \
  --with-nth='2..' \
  --preview='echo {2..}' \
  --preview-window='bottom:3:wrap:border-top,<50(bottom:3:wrap:border-top)' \
  --bind='change:first' \
  --bind='ctrl-y:execute-silent(echo -n {2..} | xclip)+abort'"

export FZF_ALT_C_COMMAND="${FD_TOOL} ${FD_OPTIONS} --type d"

# PATH
pathmunge $HOME/.local/bin
pathmunge $HOME/.cargo/bin
pathmunge $HOME/tools/flutter/bin
pathmunge $JAVA_HOME/bin
pathmunge $ANDROID_HOME/cmdline-tools/latest/bin
pathmunge $ANDROID_HOME/platform-tools

unset -f pathmunge

