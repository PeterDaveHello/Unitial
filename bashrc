
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

# some setting which depends on OS
os=`uname`
if [ $os = "FreeBSD" ] || [ $os = "Darwin" ];then
    alias ls='\ls -F'
    export CLICOLOR='yes'
    export LSCOLORS='gxfxcxdxbxegedabagacad'
else
    alias ls='\ls -F --color=auto'
    export LS_COLORS='rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=36;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.iso=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
fi

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
use_color=true #'cause this detection not work on FreeBSD(10.1), force enable for a short time
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

[[ -z ${match_lhs}    ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;36m\] \w \$\[\033[00m\] \[\033[01;31m\]$(returncode)\[\033[0;37m\]'
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;36m\] \w \$\[\033[00m\] \[\033[01;31m\]$(returncode)\[\033[0;37m\]'
    fi
else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ $(returncode)'
    else
        PS1='\u@\h \w \$ $(returncode)'
    fi
fi

# automatically enable bash-completion in interactive shells
if ! shopt -oq posix; then
    if [ -s "/usr/share/bash-completion/bash_completion" ]; then
        source "/usr/share/bash-completion/bash_completion"
    elif [ -s "/etc/bash_completion" ]; then
        source "/etc/bash_completion "
    elif [ -s "/usr/local/share/bash-completion/bash_completion" ]; then
        source "/usr/local/share/bash-completion/bash_completion"
    fi
fi
