#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   zshrc
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#
# zshrc config
#


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

fpath+=~/.zfunc

# history like csh
# https://www.zsh.org/mla/users/1998/msg00227.html
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

# $fg[color]           will set the text color (red, green, blue, etc.
#                      - defaults to whatever format set prior to text)
# %F{color} [...] %f   effectively the same as the previous, but with
#                      less typing. Can also prefix F with a number
#                      instead
# $fg_no_bold[color]   will set text to non-bold and set the text color
# $fg_bold[color]      will set the text to bold and set the text color
# $reset_color         will reset the text color to the default color.
#                      Does not reset bold. use %b to reset bold. Saves
#                      typing if it's just %f though.
# %K{color} [...] %k   will set the background color. Same color as
#                      non-bold text color. Prefixing with any
#                      single-digit number makes the bg black.

# posible color values
# 0 or black
# 1 or red
# 2 or green
# 3 or yellow
# 4 or blue
# 5 or magenta
# 6 or cyan
# 7 or white

# http://tldp.org/HOWTO/Keyboard-and-Console-HOWTO-11.html
# http://tldp.org/HOWTO/Text-Terminal-HOWTO-10.html#term_not_for_emulation
if [ "$TERM" != "linux" ]; then
    echo -e ""
    /usr/bin/env fortune
    echo -e ""
fi

PROMPT='%F{3}[%f%F{2}%n@%m:%f%F{6}%1~%f%F{3}]%f%F{5}$%f $reset_color%f'

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%F{6}'\$vcs_info_msg_0_'%f$reset_color%f'
zstyle ':vcs_info:git:*' formats '%b'


# PATH
PYENV_ROOT="$HOME/.pyenv"
export PATH="/opt/node_modules/bin:$PYENV_ROOT/bin:$HOME/.local/bin:$PATH"
export PATH="/opt/telegram:/opt/insomnia:/opt/bitwarden:/opt/drawio:$PATH"
export PATH="/opt/rider/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


# EDITOR
#export EDITOR="emacs -nw"

#export JAVA_HOME=/usr/lib64/zulu-openjdk-lts
#export ANT_HOME=/usr/share/ant
#export MAVEN_HOME=/usr/share/maven
#export M2_HOME=/usr/share/maven


# ALIAS
# User specific aliases and functions
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#alias hugo='$HOME/.bin/hugo'
alias pnx='pnpm nx --'

# Emacs sin GUI
# alias emacs='emacs -nw'

# Firefox Developer
#alias firefox_dev='/opt/mozilla-firefox-developer/firefox'
#alias firefox_esr='/opt/mozilla-firefox-esr/firefox'

# Clean files with bleachbit
alias limpiar='bleachbit --clean system.cache system.localizations system.trash system.tmp'

# .NET
# https://docs.microsoft.com/en-us/dotnet/core/tools/telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
# https://github.com/OmniSharp/omnisharp-roslyn/issues/1394#issuecomment-480792868
# export MSBuildSDKsPath="/usr/share/dotnet/sdk/$(dotnet --version)/Sdks"
export PATH="$PATH:/$HOME/.dotnet/tools"


# Load Angular CLI autocompletion.
source <(ng completion script)
