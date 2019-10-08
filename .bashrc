#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# GIT PROMPT
# source /usr/share/git/completion/git-prompt.sh
source /usr/doc/git-2.14.4/contrib/completion/git-prompt.sh


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
export PATH="/opt/node_modules/bin:$HOME/.rbenv/bin:$(ruby -e 'print Gem.user_dir')/bin:$HOME/.cabal/bin:$HOME/.local/bin:$PATH"

eval "$(rbenv init -)"
eval "$(stack --bash-completion-script stack)"


# EDITOR
export EDITOR="emacs -nw"

# Color git log
export LESS=R


# ALIAS
# User specific aliases and functions
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias hugo='~/.bin/hugo'

# Emacs sin GUI
alias emacs='emacs -nw'

# JDeveloper
alias jdev='/opt/Oracle/Middleware/Oracle_Home/jdeveloper/jdev/bin/jdev'

# Limpia archivos via bleachbit
alias limpiar='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'


# EXCLUSIONES DEL HISTORIAL
# Excluir todo lo relacionado con el comando 'ssh'
#HISTIGNORE='ere*:ssh*'

# Excluir todo lo relacionado con el comando 'ls'
#HISTIGNORE='ere*:ls*'


# IMGUR
imgur() {
    for i in "$@"; do
        curl -# -F "image"=@"$i" -F "key"="4907fcd89e761c6b07eeb8292d5a9b2a" imgur.com/api/upload.xml|\
            grep -Eo '<[a-z_]+>http[^<]+'|sed 's/^<.\|_./\U&/g;s/_/ /;s/<\(.*\)>/\x1B[0;34m\1:\x1B[0m /'
    done
    }

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/diavolo/.sdkman"
[[ -s "/home/diavolo/.sdkman/bin/sdkman-init.sh" ]] && source "/home/diavolo/.sdkman/bin/sdkman-init.sh"
