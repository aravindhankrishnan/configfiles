# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Start tmux by default
tmux

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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

#function customfind () {
#  command="find ."
#  for i in $@
#  do
#    file=" -iname \\*.$i -or"
#    command="$command $file"
#  done
#  trimmedcommand=$(echo $command | head -c -5)
#  eval $trimmedcommand
#}

function set_terminal_name () {
  printf "\033];%s\07\n" $1
}

function customgrep() {
  command="grep --color=auto $1 ./* -Iirn"
  eval $command
}

#function customgrep () {
#  command="grep -Iirn --color=auto "
#  echo "Search pattern ${1}"
#  command="$command --regexp=${1}"
#  for i in $(seq 2 $#) 
#  do
#    command="$command --include=${!i} "
#  done
#  echo $command
#  $command
#}

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gvi='gvim --remote-silent '
alias f='customfind'
alias g='customgrep'
alias g1='grep --color=auto'
alias x='exit'
alias codefind='find ./* -iname "*.cpp" -or -iname "*.c" -or -iname "*.h" -or -iname "*.hpp" -or -iname "*.m"'
alias stn='set_terminal_name'
alias gdt='git difftool --no-prompt --tool=vimdiff'
alias gst='git status'
# pbcopy
alias pbc='xclip -selection clipboard'
# pbpaste
alias pbp='xclip -selection clipboard -o'
# pbselect
alias pbs='xclip -selection primary -o'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function set_terminal_name() {
    printf "\033];%s\07\n" $1
}

export PS1="$ "

ulimit -c unlimited

alias p='pwd'
alias rm='trash-put'
alias del='trash-put'
alias x='exit'
alias f='find . -iname '
alias h='hostname'
alias codefind='find ./* -iname "*.cpp" -or -iname "*.c" -or -iname "*.h" -or -iname "*.hpp" -or -iname "*.m" -or -iname "*.py"'
alias stn='set_terminal_name'

alias gvi='gvim --remote-silent '
alias stn='set_terminal_name'

alias gdt='git difftool --no-prompt --tool=vimdiff'
alias gst='git status'
alias gpo='git push origin'
alias gb='git branch'

# pbcopy
alias pbc='xclip -selection clipboard'
# pbpaste
alias pbp='xclip -selection clipboard -o'
# pbselect
alias pbs='xclip -selection primary -o'

alias bc='bc -l'
alias cat='batcat'
alias fzfp='fzf --preview "cat {}"'

# enable vim shortcuts in bash
set -o vi
