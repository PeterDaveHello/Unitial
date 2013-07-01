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

#ssh auto complete
complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh

#git auto completion
if [ -e ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
