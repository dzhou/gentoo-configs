#===============================================================
#
# Versatile $HOME/.bashrc FILE for bash-2.05 or above
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features for your prompt.
#
# The majority of the code you'll find here is based on code found
# online. The modified code is designed to work on variety of 
# Linux and Solaris machines. The script can be used as it is, but 
# the users are encouraged to customized it to their own needs.
# 
# Code modified by Kefei D. Zhou
# version 0.5.1
# 
#===============================================================

#-----------------------------------
# Source global definitions (if any)
#-----------------------------------

if [ -f /etc/bashrc ]; then
        . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi


#---------------------------------------------------------------------
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
#---------------------------------------------------------------------
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


#-------------------------------------------------------------
# Automatic setting of $DISPLAY (if not set already)
# This works for linux and solaris - your mileage may vary....
#-------------------------------------------------------------

if [ -z ${DISPLAY:=""} ]; then
    DISPLAY=$(who am i)
    DISPLAY=${DISPLAY%%\!*}
    if [ -n "$DISPLAY" ]; then
        export DISPLAY=$DISPLAY:0.0
    else
        export DISPLAY=":0.0"  # fallback
    fi
fi


#--------------
# Shell options
#--------------

set -o notify           # notify background job completion
set -o noclobber        # prevent file overwritten by '>'
set -o nounset          # write to stderr when expanding unset variables
#set -o xtrace           # write to stderr a trace after each cmd
#set -o ignoreeof        # prevent exiting on EOF and <Ctrl>-D

shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s histappend histreedit
shopt -s extglob        # useful for programmable completion

#-----------------------
# Greeting, motd etc...
#-----------------------

# Define some colors first:
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
YELLOW="\[\033[1;33m\]"
NC='\[\e[0m\]'   
# --> Nice. Has the same effect as using "ansi.sys" in DOS.
# Looks best on a black background.....
# echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}"
#date

if [ -x /usr/share/fortune ]; then
    echo ""
    fortune     # makes our day a bit more fun.... :-)
fi

#Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
#Require dircolors
if [[ -f ~/.dir_colors ]]; then
	eval `dircolors -b ~/.dir_colors`
else
	eval `dircolors -b /etc/DIR_COLORS`
fi


# set command prompts
function basicprompt(){
    PS1="\u@\h \w > "
}

function gentooprompt(){
    PS1="${GREEN}\u@\h ${YELLOW}\w > ${NC}"
}

gentooprompt

#----------------------
# Environment variables
#----------------------
#export CLASSPATH=.:/usr/share/junit/lib/junit.jar:$CLASSPATH
#export LANG=en_US/ISO-8859-1
#export LD_LIBRARY_PATH=/usr/lib/gcc/i686-pc-linux-gnu/4.1.2/:/usr/lib/libstdc++-v3/:/usr/local/lib:
export IPOD_MOUNTPOINT="/mnt/ipod"
export PATH=~/bin/:$PATH:/usr/sbin/:/usr/games/bin/:~/scripts/:.
export LANG=C
#export INTEL_BATCH=1
export PATH="/usr/lib/ccache/bin:${PATH}"

# History Options
# ###############

# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
#export PROMPT_COMMAND="history -a"

HISTSIZE=10000
HISTFILESIZE=10000

#===================================================================
#
# ALIASES
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
#===================================================================

#-------------------
# Common Aliases
#-------------------

alias cp='cp -v'
alias mv='mv -vi'
alias mkdir='mkdir -p --verbose'
alias path='echo -e ${PATH//:/\\n}'
alias screen='screen -h 1000 -O'
alias ncmpc='ncmpc -mC -f ~/.ncmpcrc'
alias rsync='rsync -h --progress'
alias nano='nano -w'
alias ssh='ssh -YC'
alias eix='eix -F'
alias grep='grep --color=always'

# tailoring 'less'
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' # Use this if lesspipe.sh exists

# Shortcuts
alias xpdf="xpdf -q -z 200 &> /dev/null"
alias pdf="acroread"
alias battery="cat /proc/acpi/battery/BAT0/state"
alias cpu="cpufreq-info"
alias benchmark="time echo '999999 99999^p' | dc > /dev/null"
alias eject_ipod='mktunes.pl --fwguid=000A27001AE5497E -m /mnt/ipod'

#SSH 
#alias seas_p='ssh zhouk@plus.seas.upenn.edu'
#alias seas_m='ssh zhouk@minus.seas.upenn.edu'
#alias teclist='ssh teclist@minus.seas.upenn.edu'
#alias bunny='ssh zhouk@fuzzybunny.cis.upenn.edu'
#alias zhoukcom='ssh zhoukcom@zhouk.com'

# Development
#alias cvs_bunny="cvs -d :pserver:zhouk@fuzzybunny:/usr/local/cvsroot"
#alias cvs_bunny_login="cvs -d :pserver:zhouk@fuzzybunny:/usr/local/cvsroot login"
#alias cvs_fann_login="cvs -d:pserver:anonymous@fann.cvs.sourceforge.net:/cvsroot/fann login"
#export svnroot='https://dev1.invitemedia.com/svn'
#alias eclipse='~/projects/eclipse/eclipse'
alias im-ssh='ssh -p 9022 -l dzhou dev1.invitemedia.com'
alias vbox='sudo modprobe vboxdrv; sudo VirtualBox'
alias vpy='source /mnt/ops/vpy/bin/activate'
alias v='vim'

# FX
alias fxtrade="javaws ~/bin/beta.jnlp"
alias fxnews="javaws ~/bin/fxnews.jnlp"

#SUDO
alias wireless="sudo /etc/init.d/net.wlan0 restart"
alias wireless_stop="sudo /etc/init.d/net.wlan0 stop"
alias wired="sudo /etc/init.d/net.eth0 restart"
alias wired_stop="sudo /etc/init.d/net.eth0 stop"
alias reboot="sudo /sbin/reboot"
alias halt="sudo /sbin/halt"
alias mount="sudo /bin/mount"
alias umount="sudo /bin/umount"
alias hibernate='sudo hibernate'
alias hibernate-ram='sudo hibernate-ram'

alias la='ls -Al'               # show hidden files
alias ls='ls -hF --color=always'       # add colors for filetype recognition
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'              # sort by change time  
alias lu='ls -lur'              # sort by access time   
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias tree='tree -Csu'          # nice alternative to 'ls'
alias du='du -kh'
alias df='df -kTh'
export LESS='-i -N -w  -z-4 -g -M -X -F -R -P%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'


# Use bash-completion, if available
#if [ -f /etc/bash_completion ]; then
#  . /etc/bash_completion
#fi

PROMPT_COMMAND='history -a'  

#=========================================================================
#
# PROGRAMMABLE COMPLETION - ONLY SINCE BASH-2.04
# (Most are taken from the bash 2.05 documentation)
# You will in fact need bash-2.05 for some features
#
#=========================================================================

if [ "${BASH_VERSION%.*}" \< "2.05" ]; then
    echo "upgrade to version 2.05 for programmable completion"
    return
fi

# Ignore case while completing
set completion-ignore-case on
# Make Bash 8bit clean
set meta-flag on
set convert-meta off
set output-meta on

shopt -s extglob        # necessary
set +o nounset      # otherwise some completions will fail

complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A command    nohup exec eval trace gdb
complete -A command    command type which
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help     # currently same as builtins
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

complete -f -d -X '*.gz'  gzip
complete -f -d -X '*.bz2' bzip2
complete -f -o default -X '!*.gz'  gunzip
complete -f -o default -X '!*.bz2' bunzip2
complete -f -o default -X '!*.pl'  perl perl5
complete -f -o default -X '!*.ps'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X '!*.dvi' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.pdf' acroread pdf2ps xpdf
complete -f -o default -X '!*.+(pdf|ps)' gv 
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex 
complete -f -o default -X '!*.lyx' lyx 
complete -f -o default -X '!*.+(jpg|gif|xpm|png|bmp)' xv gimp
complete -f -o default -X '!*.mp3' mpg123 
complete -f -o default -X '!*.ogg' ogg123 


# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
