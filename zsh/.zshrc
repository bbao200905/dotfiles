# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Nice Bash History
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000
# 

# Insert into .bashrc

# Make sure you remove the existing history lines
# Usually:
###
#    HISTCONTROL=ignoreboth
#    shopt -s histappend
#    HISTSIZE=1000
#    HISTFILESIZE=2000
# https://abarry.org/bash-history-finally-done-right/
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows/48116#48116
# https://superuser.com/questions/417627/oh-my-zsh-history-completion/418299#418299
###

HISTSIZE=9000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups
_bash_history_sync() {
    builtin history -a
    HISTFILESIZE=$HISTSIZE
}
history() {
    _bash_history_sync
    builtin history "$@"
}
PROMPT_COMMAND=_bash_history_sync

if [[ "$-" =~ "i" ]] # Don't do this on non-interactive shells
then
    # Add MATLAB-style up-arrow, so if you type "ca[UP ARROW]" you'll get
    # completions for only things that start with "ca" like "cat abc.txt"
    bindkey '\e[A' history-beginning-search-backward
    bindkey '\e[B' history-beginning-search-forward
fi

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    # debian_chroot=$(cat /etc/debian_chroot)
# fi



# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    # ;;
# *)
    # ;;
# esac

# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     # alias ls='ls --color=auto'
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'

#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -laF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
