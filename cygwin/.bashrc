# base-files version 3.7-1

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file


# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
# export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

alias ls='ls --color --show-control-chars -X'

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -lX'                              # long list
alias la='ls -laX'                              # all but . and ..
alias '..'='cd ..'
alias q='exit'
alias ck='ck -fg white -bg black -cr white -g 128x40 -skin -skinbmp ~/.ck/default-custom.txt'
alias pmc='cd /cygdrive/c/PMC_SOURCE'
alias lv='lv -Ia -Os'
alias w3m='w3m -s'
alias mlterm='mlterm -geometry 128x40'
alias 'c:'='cd /cygdrive/c'
alias 'e:'='cd /cygdrive/e'
alias 'x:'='cd /cygdrive/x'
alias grepsrc='find | sed -e "/\.[Cc]$/p" -e "/\.[Hh]$/p" -e "/\.mip/p" -e "/\.Ss$/p" -e d | xargs grep $1'
alias sdiff='sdiff -t'
alias lesss='less -n'
alias sl='sl -aFl'
alias mydoc='cd "/cygdrive/c/Users/${USER}/Documents"'
alias vi='vim'
alias apt-cyg='apt-cyg -c /package -m ftp://ftp.jaist.ac.jp/pub/cygwin/'
alias cyg-fast='cyg-fast -c /package -m ftp://ftp.jaist.ac.jp/pub/cygwin/'

export LESS='-RNM -x4'
export DISPLAY=localhost:0
export LIBRARY_PATH=/usr/local/lib
#export LANG=ja_JP.SJIS
export LANG=ja_JP.UTF-8
eval $(dircolors.exe -b ~/.dir_colors)
export PATH=$(echo $PATH | tr ":" "\n" | sed -e "/^\/cygdrive\/c\/Windows/p" -e "/^\/cygdrive/d" | tr "\n" ":")

# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

#TERM="cygwin"
#export TERM

if [ $TERM = "kterm" ]; then
	export TERMINFO=/usr/lib/terminfo
fi

case ${TERM} in
	kterm|xterm|xterm-256color|mlterm|cygwin|vt102|ck)
		export ADDR=$(ipconfig 2>&1 | grep -a "IPv4" | head -n 1 | awk '{print $14}' | col | tail -n 1)
		PS1="[Cygwin@${ADDR}:\w] "
		PROMPT_COMMAND='echo -ne "\033]0;Cygwin@${ADDR}:${PWD/#${HOME}/~}\007"'
		export -n ADDR
	;;
esac

