#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   ~/.bashrc config
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# GIT PROMPT
# source /usr/share/git/completion/git-prompt.sh
source /usr/doc/git-2.35.3/contrib/completion/git-prompt.sh

# tcsh-like history search
# https://forums.freebsd.org/threads/emulating-tcsh-history-search-in-bash.35554/
# https://stackoverflow.com/a/1030206
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi


# RANDOM FORTUNES
# http://tldp.org/HOWTO/Keyboard-and-Console-HOWTO-11.html
# http://tldp.org/HOWTO/Text-Terminal-HOWTO-10.html#term_not_for_emulation
if [ "$TERM" != "linux" ]; then
    echo -e ""
    /usr/bin/env fortune
    echo -e ""
fi


# PROMPT USUARIO
#PS1='[\u@\h \W]\$ '
#PS1='\e[0;32m\][\u@\h:\W]\$ \e[0m\]'
#PS1='\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[0;33m\][\[\e[m\]\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\W\[\e[m\]\[\e[0;33m\]]\[\e[m\]\[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[0;33m\][\[\e[m\]\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\W\[\e[m\]\[\e[0;33m\]]\[\e[m\]\[\e[1;32m\]\$ \[\e[m\]'
PS1='\[\e[0;33m\][\[\e[m\]\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\W\[\e[m\]\[\e[0;33m\]]\[\e[m\]\[\e[1;32m\]\$\[\e[m\]$(__git_ps1 "(%s)") '

# PROMPT ROOT
#PS1='\[\e[0;33m\][\[\e[m\]\[\e[0;31m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[0;33m\]]\[\e[m\]\[\e[1;32m\]\[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'

if [[ -f ~/.dir_colors ]]; then
eval $(dircolors -b ~/.dir_colors)
fi


# PATH
export PATH="/opt/node_modules/bin:$HOME/.local/bin:$PATH"


# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"    # if `pyenv` is not already on PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


# EDITOR
export EDITOR="emacs -nw"

# export JAVA_HOME=/usr/bin/java
export JAVA_HOME=/usr/lib64/zulu-openjdk-lts
export ANT_HOME=/usr/share/ant
export MAVEN_HOME=/usr/share/maven
export M2_HOME=/usr/share/maven

# Color git log
export LESS=R


# ALIAS
# User specific aliases and functions
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias hugo='~/.bin/hugo'

# Emacs without X
alias emacs='emacs -nw'

# JDeveloper
alias jdev='/opt/Oracle/Middleware/Oracle_Home/jdeveloper/jdev/bin/jdev'

# Clean with bleachbit
alias limpiar='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'


# EXCLUDE HISTORY
# Exclude all history related to 'ssh' command
#HISTIGNORE='ere*:ssh*'
# Exclude all history related to 'ls' command
#HISTIGNORE='ere*:ls*'
