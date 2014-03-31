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

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

#twtty
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/src/nvm/nvm.sh" ]] && source "$HOME/src/nvm/nvm.sh" # Load nvm

[[ -s "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt" # load bash prompt
