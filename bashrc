# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
if [ "$HOSTNAME" == "kfrance-work" ]; then
	PS1="\[\e[33;40m\]\h | \[\e[36;40m\]\W]\[\e[0m\]"
else
	PS1="\[\e[36;40m\]\h | \[\e[32;40m\]\W]\[\e[0m\]"
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
if [ "$DESKTOP_SESSION" == "kde" ]; then
	alias rm="trash.sh"
elif [ "$DESKTOP_SESSION" == "mate" ]; then
	alias rm="trash"
else
	alias rm="echo 'no trash available'"
fi
alias psx="ps aux | grep $1"
export EDITOR=vim
export TERM=xterm-256color
set -o vi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Setup PATH
export PATH=$PATH:/home/kfrance/bin:/usr/local/bin:/data/stem_features/bin:/data/stem_features/helper_scripts
export PYTHONPATH=$PYTHONPATH:/data/my_pymodules
export GREP_OPTIONS='--color=auto'
export LD_LIBRARY_PATH=/usr/local/lib:/data/stem_features/bin

# Allow core dumps to happen
ulimit -c 50000

# Set tab every 4th column
tabs -4

# command to combine pdfs
combine-pdf() { gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=combinedpdf_`date +'%F_%Hh%M'`.pdf -f "$@" ;}

umask 002