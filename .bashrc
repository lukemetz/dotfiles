#Thanks Reilly!

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Vi mode.
#set -o vi

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Change the window title of X terminals 
case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
    	;;
	screen)
    	PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
        ;;
esac

use_color=false
# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS. Try to use the external file
# first to take advantage of user additions. Use internal bash
# globbing instead of external grep binary.
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    # Get Git prompt for fancy PS1
    source /usr/share/git/git-prompt.sh

    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then
    if [[ -f ~/.dir_colors ]] ; then
	eval $(dircolors -b ~/.dir_colors)
    elif [[ -f /etc/DIR_COLORS ]] ; then
        eval $(dircolors -b /etc/DIR_COLORS)
    fi
    fi
    PS1='\[\e[0;32m\]\u@\h \[\e[0m\]\@ \d \[\e[0;32m\]\w\[\e[0m\]$(__git_ps1 "\[\e[1m\] %s")\n\[\e[1m\]\$\[\e[0m\] '
    alias ls='ls --color=auto --human-readable'
    alias grep='grep --color=auto'
    alias diff='colordiff'
else
    PS1='\u@\h \@ \d \w$(__git_ps1 " %s")\n\$ '
    alias ls='ls --human-readable'
fi
# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

# Use Bash completion.
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
