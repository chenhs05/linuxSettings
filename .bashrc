# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# ---
# Enable 256 color capabilities for appropriate terminals

# Set this variable in your local shell config if you want remote
# xterms connecting to this system, to be sent 256 colors.
# This can be done in /etc/csh.cshrc, or in an earlier profile.d script.
#   SEND_256_COLORS_TO_REMOTE=1

# Terminals with any of the following set, support 256 colors (and are local)
local256="$COLORTERM$XTERM_VERSION$ROXTERM_ID$KONSOLE_DBUS_SESSION"

if [ -n "$local256" ] || [ -n "$SEND_256_COLORS_TO_REMOTE" ]; then

  case "$TERM" in
    'xterm') TERM=xterm-256color;;
    'screen') TERM=screen-256color;;
    'Eterm') TERM=Eterm-256color;;
  esac
  export TERM

  if [ -n "$TERMCAP" ] && [ "$TERM" = "screen-256color" ]; then
    TERMCAP=$(echo "$TERMCAP" | sed -e 's/Co#8/Co#256/g')
    export TERMCAP
  fi
fi

unset local256
# ----


RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

# function parse_git_branch {
# 	local RED="\001\033[0;31m\002"
# 	local YELLOW="\001\033[0;33m\002"
# 	local GREEN="\001\033[0;32m\002"
# 	local BLUE="\001\033[0;34m\002"
# 	local LIGHT_RED="\001\033[1;31m\002"
# 	local LIGHT_GREEN="\001\033[1;32m\002"
# 	local WHITE="\001\033[1;37m\002"
# 	local LIGHT_GRAY="\001\033[0;37m\002"
# 	local COLOR_NONE="\001\e[0m\002"
# 	git rev-parse --git-dir &> /dev/null
#         git_status="$(git status 2> /dev/null)"   #THE STATUS TAKES TOO LONG FOR LARGE REPOS
#         branch_pattern="^On branch ([^${IFS}]*)"
#         remote_pattern="Your branch is (.*) of"
#         diverge_pattern="Your branch and (behind|ahead) "
# #	echo $git_status
# #	echo $branch_pattern
# #	echo $remote_pattern
# #	echo $diverge_pattern
#         if [[ ! ${git_status} =~ "working directory clean" ]]; then
#         	state="${RED}⚡"
#         fi
# 	# add an else if or two here if you want to get more specific
# 	if [[ ${git_status} =~ ${remote_pattern} ]]; then
#         if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
#         	remote="${YELLOW}↑"
# 	else
#         	remote="${YELLOW}↓"
#         fi
#      	fi
#       	if [[ ${git_status} =~ ${diverge_pattern} ]]; then
#                	remote="${YELLOW}↕"
#         fi
#         if [[ ${git_status} =~ ${branch_pattern} ]]; then
#       		branch=${BASH_REMATCH[1]}
# 		echo -e " (${branch})${remote}${state}"
#         fi
# }

# for __git_ps1 parameters
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

function prompt_func() {
    	previous_return_value=$?;
    	# prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
    	# prompt="${TITLEBAR}${GREEN}\u@${BLACK}\h:${BLUE}[${RED}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE} "
	# prompt="${debian_chroot:+($debian_chroot)}${GREEN}\u${COLOR_NONE}@${GREEN}\h:${BLUE}[${RED}\w${GREEN}\$(parse_git_branch)${BLUE}] "
	prompt="${debian_chroot:+($debian_chroot)}${GREEN}\u${COLOR_NONE}@${GREEN}\h:${BLUE}[${RED}\w${GREEN}\$(__git_ps1)${BLUE}] "
    	if test $previous_return_value -eq 0
   	then
		PS1="${prompt}${BLUE}>>${COLOR_NONE} "
	else
	        PS1="${prompt}${RED}>>${COLOR_NONE} "
	fi 
}

# PROMPT_COMMAND=prompt_func

# show only the last three directory on the path
export PROMPT_DIRTRIM=3


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #PS1="${debian_chroot:+($debian_chroot)}${GREEN}\u@${COLOR_NONE}\h:${BLUE}[${RED}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE}\$${COLOR_NONE} "
	prompt_func
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PROMPT_COMMAND="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lt='ls -lhrt'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
#. /usr/local/bin/thisroot.sh
