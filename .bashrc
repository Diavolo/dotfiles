#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Ocultando la configuración por default
#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '


# Custom
echo -e ""
/usr/bin/fortune
echo -e ""
# USUARIO
#PS1='\e[0;32m\][\u@\h:\W]\$ \e[0m\]'
#PS1='\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[0;33m\][\[\e[m\]\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\W\[\e[m\]\[\e[0;33m\]]\[\e[m\]\[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
PS1='\[\e[0;33m\][\[\e[m\]\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\W\[\e[m\]\[\e[0;33m\]]\[\e[m\]\[\e[1;32m\]\$ \[\e[m\]'

# ROOT
#PS1='\[\e[0;31m\]\u@\h\[\e[m\]\[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
#PS1='\[\e[0;33m\][\[\e[m\]\[\e[0;31m\]\u@\h\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[0;33m\]]\[\e[m\]\[\e[1;32m\]\[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'

if [[ -f ~/.dir_colors ]]; then
eval $(dircolors -b ~/.dir_colors)
fi

# User specific aliases and functions
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#java dirs

#EXCLUIR TODO LO RELACIONADO CON EL COMANDO SSH
HISTIGNORE='ere*:ssh*'

#EXCLUIR TODO LO RELACIONADO CON EL COMANDO LS
HISTIGNORE='ere*:ls*'

