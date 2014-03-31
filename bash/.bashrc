# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EMAIL=stuart.freeman@et.gatech.edu

# vi keybindings
set -o vi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

export NNTPSERVER=news.gmane.org

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls
if [ "$TERM" != "dumb" ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

#hostnam=$(hostname)
#usernam=$(whoami)
#temp="$(tty)"
##   Chop off the first five chars of tty (ie /dev/):
#cur_tty="${temp:5}"
#unset temp
#
#function prompt_command {
#LASTSTATUS="$?"
#
#if (( $LASTSTATUS > 0 ))
#then
#  LASTCOLOR=$(tput setaf 1; tput bold)
#  LASTSTATUS="☠"
#else
#  LASTCOLOR=$(tput setaf 2; tput bold)
#  LASTSTATUS="✓"
#fi
#
#git_br=$(__git_ps1 "(%s)")
#git_br=${git_br:1:-1}
#
#if (( ${#git_br} > 0 ))
#then
#  git_br_pre="┤"
#  git_br_post_color=$(tput setaf 6; tput bold)
#  git_br_post="├─"
#else
#  git_br_pre="─"
#  if (( $(tput colors) > 8 ))
#  then
#    git_br_post_color=$(tput setaf 32; tput bold)
#  else
#    git_br_post_color=$(tput setaf 4; tput bold)
#  fi
#  git_br_post="──"
#fi
#
##   Find the width of the prompt:
#TERMWIDTH=${COLUMNS}
#
##   Add all the accessories below ...
#local temp="──┤${usernam}@${hostnam}:${cur_tty}├───┤${PWD}├┤$git_br├──"
#
#let fillsize=${TERMWIDTH}-${#temp}
#if [ "$fillsize" -gt "0" ]
#then
#  fill="───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
#  #   It's theoretically possible someone could need more
#  #   dashes than above, but very unlikely!  HOWTO users,
#  #   the above should be ONE LINE, it may not cut and
#  #   paste properly
#  fill="${fill:0:${fillsize}}"
#  newPWD="${PWD}"
#fi
#
#if [ "$fillsize" -lt "0" ]
#then
#  fill=""
#  let cut=3-${fillsize}
#  newPWD="...${PWD:${cut}}"
#fi
#}
#
#PROMPT_COMMAND=prompt_command
#
#function twtty {
#
#local WHITE="\[$(tput setaf 7; tput bold)\]"
#local NO_COLOUR="\[\033[0m\]"
#
#local LIGHT_BLUE="\[$(tput setaf 6; tput bold)\]"
#local BLUE="\[$(tput setaf 4; tput bold)\]"
#local YELLOW="\[$(tput setaf 3; tput bold)\]"
#local RED="\[$(tput setaf 1; tput bold)\]"
#local GREEN="\[$(tput setaf 2; tput bold)\]"
#
#if (( $(tput colors) > 8 ))
#then
#BLUE="\[$(tput setaf 32; tput bold)\]"
#fi
#
#case $TERM in
#  xterm*|rxvt*)
#    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
#    ;;
#  *)
#    TITLEBAR=""
#    ;;
#esac
#
#if [[ $usernam == 'root' ]]
#then
#  USERCOLOR=$RED
#else
#  USERCOLOR=$BLUE
#fi
#
#PS1='$(printf "%$((COLUMNS-1))s\r")'"${TITLEBAR}\
#${BLUE}─${LIGHT_BLUE}─┤\
#${USERCOLOR}\${usernam}${LIGHT_BLUE}@${YELLOW}\${hostnam}${LIGHT_BLUE}:${WHITE}\${cur_tty}\
#${LIGHT_BLUE}├─${BLUE}─\${fill}${LIGHT_BLUE}─┤\
#${BLUE}\${newPWD}\
#${LIGHT_BLUE}├\${git_br_pre}${YELLOW}\${git_br}\[\${git_br_post_color}\]\${git_br_post}${BLUE}─\
#\n\
#${BLUE}─${LIGHT_BLUE}─┤\
#${BLUE}\$(date +%H%M)${LIGHT_BLUE}:${BLUE}\$(date \"+%a,%d %b %y\")\
#${LIGHT_BLUE}:${WHITE}\[\${LASTCOLOR}\]\${LASTSTATUS}${LIGHT_BLUE}├─\
#${BLUE}─\
#${NO_COLOUR} "
#
#PS2="${BLUE}─${LIGHT_BLUE}─┼─${BLUE}─${NO_COLOUR} "
#
#}

# Prevent dropping a locked X to a term with my privs
alias startx="exec startx"

# Set up vim if we have it
if which vim > /dev/null
then
  export EDITOR=vim
  alias vi="vim -X"
else
  export EDITOR=vi
fi
export VISUAL=$EDITOR
if [[ ! -f ~/.vimrc ]]
then
  cat  > ~/.vimrc << EOF
  syntax on
  set incsearch
  set hlsearch
  set ignorecase
  set tabstop=2
  set shiftwidth=2
  set visualbell
EOF
fi

# Timezone
export TZ='America/New_York'

# History
export HISTFILESIZE=3000
export HISTSIZE=3000

# Java stuff
export JAVA_HOME=$(dirname $(dirname $(readlink -f /etc/alternatives/javac)))
export JAVA_OPTS='-Xms256m -Xmx1024m -XX:PermSize=64m -XX:MaxPermSize=512m'
export M2_HOME='/usr/share/maven'
export MAVEN_OPTS='-Xms256m -Xmx512m -XX:PermSize=64m -XX:MaxPermSize=300m'
export CATALINA_HOME='/opt/tomcat'
export CATALINA_LOGDIR=$CATALINA_HOME/logs
alias rtc="/opt/tomcat/bin/shutdown.sh && sleep 2 && /opt/tomcat/bin/startup.sh && tail -f /opt/tomcat/logs/catalina.out"
alias java="java $JAVA_OPTS"
alias jdb="java -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"

export PATH=~/bin:$PATH:/usr/bin:$MAVEN_HOME/bin:$CATALINA_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jni/
export SDC_KEY_ID=7d:2f:e4:0e:55:bd:6b:67:ce:1c:16:11:7a:5b:57:af
export DEBFULLNAME="D. Stuart Freeman"
export DEBEMAIL="stuart.freeman@et.gatech.edu"

# Set up make to utilize all processors
if [[ `uname` == 'Linux' ]]
then
  PROCESSORS=`grep processor /proc/cpuinfo|wc -l`
  if [[ PROCESSORS != 1 ]]
  then
    let PROCESSORS=$PROCESSORS+1
    export MAKEFLAGS="-j $PROCESSORS"
  fi
fi

# make-kpkg stuff
export CONCURRENCY_LEVEL=$PROCESSORS
alias make-kpkg="MAKEFLAGS=\"\" make-kpkg --rootcmd fakeroot"

## ssh-agent is a little safer than a passwordless key
#SSH_ENV=~/.ssh/environment
#
#function start_agent {
  #echo "Initialising new SSH agent..."
  #/usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
  #echo succeeded
  #chmod 600 ${SSH_ENV}
  #source ${SSH_ENV} > /dev/null
  #/usr/bin/ssh-add;
#}

## Source SSH settings, if applicable
#if [ -f "${SSH_ENV}" ]
#then
  #source ${SSH_ENV} > /dev/null
  #ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
  #start_agent;
  #}
#else
  #start_agent;
#fi

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

#twtty
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/src/nvm/nvm.sh" ]] && source "$HOME/src/nvm/nvm.sh" # Load nvm

[[ -s "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt" # load bash prompt
