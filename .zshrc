# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/diavolo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# $fg[color]           will set the text color (red, green, blue, etc. - defaults to whatever format set prior to text)
# %F{color} [...] %f   effectively the same as the previous, but with less typing. Can also prefix F with a number instead
# $fg_no_bold[color]   will set text to non-bold and set the text color
# $fg_bold[color]      will set the text to bold and set the text color
# $reset_color         will reset the text color to the default color. Does not reset bold. use %b to reset bold. Saves typing if it's just %f though. 
# %K{color} [...] %k   will set the background color. Same color as non-bold text color. Prefixing with any single-digit number makes the bg black.

# posible color values
# black or 0    red or 1    green or 2    yellow or 3    blue or 4    magenta or 5    cyan or 6    white or 7

echo -e ""
/usr/bin/fortune
echo -e ""

PROMPT='%F{3}[%f%F{2}%n@%m:%f%F{6}%1~%f%F{3}]%f%F{5}$%f $reset_color%f'

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%F{6}'\$vcs_info_msg_0_'%f$reset_color%f'
zstyle ':vcs_info:git:*' formats '%b'



# PATH
export PATH="/opt/node_modules/bin:$HOME/.composer/vendor/bin:$HOME/.rbenv/bin:$HOME/.cabal/bin:$HOME/.local/bin:$PATH"

eval "$(rbenv init -)"
#eval "$(stack --bash-completion-script stack)"


# EDITOR
export EDITOR="emacs -nw"


# ALIAS
# User specific aliases and functions
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Emacs sin GUI
alias emacs='emacs -nw'

# JDeveloper
alias jdev='/opt/Oracle/Middleware/Oracle_Home/jdeveloper/jdev/bin/jdev'

# Limpia archivos via bleachbit
alias limpiar='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'
