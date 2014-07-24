
#unalias all the alias(es) before set anything
unalias -a

#don't save duplicates records and lines started with space in bash history
HISTCONTROL=ignoreboth

#expand the history size
HISTFILESIZE=2000
HISTSIZE=1000

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
alias df='\df -h'
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
