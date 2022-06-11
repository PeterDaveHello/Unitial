
#append command history instead of overwrite
shopt -s histappend

#unalias all the alias(es) before set anything
unalias -a

#don't save duplicates records and lines started with space in bash history
HISTCONTROL=ignoreboth

#expand the history size
HISTFILESIZE=2000
HISTSIZE=1000

PROMPT_DIRTRIM=5

export PATH="$HOME/bin:$HOME/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

#set default charset and language
locale=en_US.UTF-8
export LANG=$locale
export LANGUAGE=$locale
export LC_ALL=$locale

#set default editor
export EDITOR=vim

#GPG passphrase input workaround
export GPG_TTY
PG_TTY=$(tty)

#tmux color issue
alias tmux='\tmux -2'

#uniq unicode issue
alias uniq='LC_ALL=C uniq'

# some setting which depends on OS
os=$(uname)
if [ "$os" = "FreeBSD" ] || [ "$os" = "Darwin" ]; then
  datetime='date +%m/%d@%H:%M:%S'
  alias ls='\ls -F'
  alias free='\freecolor -tm'
  export CLICOLOR='yes'
  export LSCOLORS='gxfxcxdxbxegedabagacad'
else
  datetime='date +%m/%d@%H:%M:%S'
  alias ls='\ls -F --color=auto'
  alias free='\free -h'
  export LS_COLORS='rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=36;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.iso=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.snap=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
fi

###alias###

#ls
alias l='ls -C'
alias ll='ls -lh'
alias la='ls -A'
alias lal='ls -lha'

#grep
alias g='\grep --color=auto'
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
alias ..='\cd ..'
alias ...='\cd ../..'
alias ....='\cd ../../..'
alias .....='\cd ../../../..'

#other alias
alias c='clear'
alias sudo='\sudo -E'
alias less='\less -R'
alias du='\du -h'
alias df='\df -hT'
alias wgetncc='wget --no-check-certificate'
alias last='\last | less'
alias tree='\tree -C'
alias optipng='\optipng -o7 -zm1-9 -preserve'

###alias###

if [ -e ~/.bash_history ]; then
  # network-related commands or tools which need auto completion
  complete -W "$(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //')" ssh
  complete -W "$(grep '^sftp ' ~/.bash_history | sort -u | sed 's/^sftp //')" sftp
  complete -W "$(grep '^ping ' ~/.bash_history | sort -u | sed 's/^ping //')" ping
  complete -W "$(grep '^dig ' ~/.bash_history | sort -u | sed 's/^dig //')" dig
  complete -W "$(grep '^telnet ' ~/.bash_history | sort -u | sed 's/^telnet //')" telnet
  complete -W "$(grep '^mosh ' ~/.bash_history | sort -u | sed 's/^mosh //')" mosh
  complete -W "$(grep '^xfreerdp ' ~/.bash_history | sort -u | sed 's/^xfreerdp //')" xfreerdp
fi

#git auto completion
if [ -e ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

function repeat() {
  local i=$1
  shift
  for n in $(seq "$i"); do
    $@
  done
}

function man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;36m' \
    man "$@"
}

function returncode() {
  returncode=$?
  if [ $returncode != 0 ]; then
    echo "[$($datetime) $returncode]"
  else
    echo ""
  fi
}

function enable-prompt-color() {
  if [[ ${EUID} == 0 ]]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;36m\] \w \$\[\033[00m\] \[\033[01;31m\]$(returncode)\[\033[0;37m\]'
  else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;36m\] \w \$\[\033[00m\] \[\033[01;31m\]$(returncode)\[\033[0;37m\]'
  fi
}

function disable-prompt-color() {
  if [[ ${EUID} == 0 ]]; then
    # show root@ when we don't have colors
    PS1='\u@\h \W \$ $(returncode)'
  else
    PS1='\u@\h \w \$ $(returncode)'
  fi
}

enable-prompt-color

# automatically enable bash-completion in interactive shells
if ! shopt -oq posix; then
  if [ -s "/usr/share/bash-completion/bash_completion" ]; then
    source "/usr/share/bash-completion/bash_completion"
  elif [ -s "/etc/bash_completion" ]; then
    source "/etc/bash_completion"
  elif [ -s "/usr/local/share/bash-completion/bash_completion" ]; then
    source "/usr/local/share/bash-completion/bash_completion"
  elif [ -s "/usr/local/etc/bash_completion" ]; then
    source "/usr/local/etc/bash_completion"
  fi
fi

if [ -r ~/.colorEcho ]; then
  source ~/.colorEcho
fi
