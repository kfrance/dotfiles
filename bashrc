# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
#TITLEBAR="\[\033]2;\u@\h\007\]"
parse_git_branch() {
	git branch 2> //dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
if [ $(id -u) -eq 0 ]; then
	PS1='${TITLEBAR}\[\e[91;40m\]#\h | \[\e[36;40m\]\W]\[\e[0m\]'
else
	PS1='\[\e[36;40m\]\h | \[\e[32;40m\]\W$(__git_ps1)]\[\e[0m\]'
fi

if [ $IN_DOCKER ]; then
	PS1="\[\033[38;5;166;48;5;240m\]DOCKER | \[\033[38;5;111;48;5;240m\]\W]\[\033[m\]"
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
alias psx="ps aux | grep $1"
alias grep="/bin/grep --color=auto"
export EDITOR=vim
export TERM=xterm-256color
alias bsai="conda activate balena-sai"
alias subup="git submodule update --recursive --init"
alias analytics='mongosh "mongodb+srv://analytics.6chxf.mongodb.net/myFirstDatabase" --apiVersion 1 --username kirt'
set -o vi

# Function that could be an alias but I couldn't get the quotes right
docker_rm_stopped() {
	docker ps -a | grep Exited | awk '{print $1}' | xargs --no-run-if-empty docker rm
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Setup PATH
export PATH=$PATH:$HOME/bin:/usr/local/bin:/data/svw_cli:/opt/balena-cli:/usr/local/go/bin
export PYTHONPATH=$PYTHONPATH:/data/my_pymodules

# Allow core dumps to happen
ulimit -s 50000

# Set tab every 4th column
tabs -4

# command to combine pdfs
combine-pdf() { gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=combinedpdf_`date +'%F_%Hh%M'`.pdf -f "$@" ;}

umask 002

# Save history after every command
export PROMPT_COMMAND='history -a'

export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export HISTSIZE=5000
export HISTFILESIZE=5000

export VTE_SH=/etc/profile.d/vte.sh
[ -s $VTE_SH ] &&  \. $VTE_SH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kfrance/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kfrance/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kfrance/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kfrance/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


complete -C /usr/bin/terraform terraform

complete -C /usr/bin/vault vault

export PYTHONNOUSERSITE=True

source ~/.git-prompt.sh

# Better bash history
PROMPT_COMMAND='history -a'
shopt -s histappend
HISTFILESIZE=1000000
HISTCONTROL=ignoreboth

# Bash completion for svw-cli
source setup_bash_completion.sh
conda activate svw_cli
