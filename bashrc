
#unalias all the alias(es) before set anything
unalias -a

#don't save duplicates records and lines started with space in bash history
HISTCONTROL=ignoreboth

#expand the history size
HISTFILESIZE=2000
HISTSIZE=1000

export PATH="~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

#set default charset and language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#set default editor
export EDITOR=vim

#tmux color issue
alias tmux='\tmux -2'


###alias###

#ls
alias l='ls -C'
alias ll='ls -lh'
alias la='ls -A'
alias lal='ls -lha'

#grep
alias grep='\grep --color=auto'
alias fgrep='\fgrep --color=auto'
alias egrep='\egrep --color=auto'

#network tool
alias p='ping'
alias n='nslookup'
alias d='dig'
alias t='mtr'
alias ssh='ssh -v'

#cd
alias cd..='\cd ..'
alias cd...='\cd ../..'
alias ..="\cd .."
alias ...="\cd ../.."
alias ....="\cd ../../.."
alias .....="\cd ../../../.."

#other alias
alias c='clear'
alias sudo='\sudo -E'
alias du='\du -h'
alias df='\df -hT'
alias free='\free -h'
alias wgetncc='wget --no-check-certificate'

###alias###


if [ -e ~/.bash_history ]; then
# network-related commands or tools which need auto completion
    complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh
    complete -W "$(echo $(grep '^sftp ' ~/.bash_history | sort -u | sed 's/^sftp //'))" sftp
    complete -W "$(echo $(grep '^ping ' ~/.bash_history | sort -u | sed 's/^ping //'))" ping
    complete -W "$(echo $(grep '^dig ' ~/.bash_history | sort -u | sed 's/^dig //'))" dig
    complete -W "$(echo $(grep '^telnet ' ~/.bash_history | sort -u | sed 's/^telnet //'))" telnet
    complete -W "$(echo $(grep '^mosh ' ~/.bash_history | sort -u | sed 's/^mosh //'))" mosh
    complete -W "$(echo $(grep '^xfreerdp ' ~/.bash_history | sort -u | sed 's/^xfreerdp //'))" xfreerdp
fi

#git auto completion
if [ -e ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# bashrc ref to linuxmint 17.1's default /etc/bash.bashrc
use_color=false
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""

function returncode
{
    returncode=$?
    if [ $returncode != 0 ]; then
        echo "[$returncode]"
    else
        echo ""
    fi
}

[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then
        if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
    else
        eval $(dircolors)
        fi
    fi

    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] \[\033[0;31m\]$(returncode)\[\033[0;37m\]'
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] \[\033[0;31m\]$(returncode)\[\033[0;37m\]'
    fi
else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ $(returncode)'
    else
        PS1='\u@\h \w \$ $(returncode)'
    fi
fi
