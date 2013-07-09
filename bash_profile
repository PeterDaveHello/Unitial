
#don't save duplicates records and lines started with space in bash history
HISTCONTROL=ignoreboth

#set default charset
export LC_ALL=en_US.UTF-8

#set default editor
export EDITOR=vim

#tmux color issue
alias tmux='\tmux -2'

#ls
alias ls='\ls -GF'
alias l='ls -C'
alias ll='ls -l'
alias la='ls -A'
alias lal='ls -lA'

alias c='clear'

alias cd..='\cd ..'
alias cd...='\cd ../..'

#grep
alias grep='\grep --color=auto'
alias fgrep='\fgrep --color=auto'
alias egrep='\egrep --color=auto'

#network tool
alias p='ping'
alias n='nslookup'
alias d='dig'
alias t='mtr'

# network-related commands or tools which need auto completion
complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh
complete -W "$(echo $(grep '^sftp ' .bash_history | sort -u | sed 's/^sftp //'))" sftp
complete -W "$(echo $(grep '^ping ' .bash_history | sort -u | sed 's/^ping //'))" ping
complete -W "$(echo $(grep '^dig ' .bash_history | sort -u | sed 's/^dig //'))" dig
complete -W "$(echo $(grep '^telnet ' .bash_history | sort -u | sed 's/^telnet //'))" telnet

#git auto completion
if [ -e ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
