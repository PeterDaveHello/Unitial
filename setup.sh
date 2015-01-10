#!/bin/sh

CAT="/bin/cat"
CHMOD="/bin/chmod"
MKDIR="/bin/mkdir"
RM="/bin/rm"

github_base='https://raw.githubusercontent.com/'
repo_path='PeterDaveHello/Unitial/master/'

os=`uname`
if [ $os = "FreeBSD" ];then
    ECHO="echo"
    ${ECHO} -e "\n\e[1;36;40mYour operating system is $os\n\e[0m";
    ${ECHO} -e "\n\e[1;36;40mSuppose you have 'fetch' to download files!\n\e[0m";
    download='fetch'
    download_o='fetch -o'
else
    ECHO="/bin/echo"
    ${ECHO} -e "\n\e[1;36;40mYour operating system is $os\n\e[0m";
    ${ECHO} -e "\n\e[1;36;40mSuppose you have 'curl' to download files!\n\e[0m";
    download='curl -kO'
    download_o='curl -ko'
fi

${ECHO} -e "\n\e[1;36;40mUnitial is started to initial your Unix-like working environment\n\nPlease wait...\n\n\e[0m";

${ECHO} -e "\n\e[1;36;40mDownload and setup configs from server...\n\e[0m";
for files in gitconfig tcshrc bashrc bash_profile inputrc vimrc zshrc gitignore_global tmux.conf
do
    ${download} "$github_base""$repo_path""$files"
    ${CAT} "$files" >> ~/."$files"
    ${RM} "$files"
done

${MKDIR} -p ~/.irssi/
${download_o} ~/.irssi/config "$github_base""$repo_path"irssi_config

${download} "$github_base""$repo_path"ssh_config
${MKDIR} -p -m 700 ~/.ssh/.tmp_session/
${CAT} ssh_config >> ~/.ssh/config
${RM} ssh_config

${ECHO} -e "\n\e[1;36;40mAdd some color setting which depends on your OS...\n\e[0m";
if [ $os = "FreeBSD" ] || [ $os = "Darwin" ];then
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F'" >> ~/.bashrc
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F'" >> ~/.zshrc
    ${ECHO} -e "\n#color setting\nalias ls '\ls -F'" >> ~/.tcshrc
    ${ECHO} "export LSCOLORS=gxfxcxdxbxegedabagacad" >> ~/.bashrc
    ${ECHO} "export CLICOLOR=yes" >> ~/.bashrc
else
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F --color=auto'" >> ~/.bashrc
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F --color=auto'" >> ~/.zshrc
    ${ECHO} -e "\n#color setting\nalias ls '\ls -F --color=auto'" >> ~/.tcshrc
    ${ECHO} 'export LS_COLORS="rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=36;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.iso=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"' >> ~/.bashrc
fi

if [ $os = "FreeBSD" ];then
    ${ECHO} -e "\n\e[1;36;40mAdd FreeBSD's package mirror setting...\n\e[0m";
    ${ECHO} -e "\n#package mirror setting\nexport PACKAGEROOT=http://ftp.tw.freebsd.org" >> ~/.bashrc
    ${ECHO} -e "\n#package mirror setting\nexport PACKAGEROOT=http://ftp.tw.freebsd.org" >> ~/.zshrc
    ${ECHO} -e "\n#package mirror setting\nsetenv PACKAGEROOT http://ftp.tw.freebsd.org" >> ~/.tcshrc
fi

${ECHO} -e "\n\e[1;36;40mDownload VIM color scheme - Kolor from server...\n\e[0m";
${MKDIR} -p ~/.vim/colors/
${download_o} ~/.vim/colors/kolor.vim "$github_base"zeis/vim-kolor/master/colors/kolor.vim
${ECHO} -e "\n\e[1;36;40mDownload git contrib - diff-highlight from server...\n\e[0m";
${MKDIR} -p ~/.git/contrib/
${download_o} ~/.git/contrib/diff-highlight "$github_base"git/git/master/contrib/diff-highlight/diff-highlight
${CHMOD} +x ~/.git/contrib/diff-highlight
${ECHO} -e "\n\e[1;36;40mDownload git's auto completion configs from server...\n\e[0m";
git_auto_complete_path="$github_base"'git/git/master/contrib/completion/git-completion.'
${download_o} ~/.git-completion.bash "$git_auto_complete_path"bash
${download_o} ~/.git-completion.tcsh "$git_auto_complete_path"tcsh
${download_o} ~/.git-completion.zsh "$git_auto_complete_path"zsh

if [ $os = "FreeBSD" ] && [ -r /usr/local/share/certs/ca-root-nss.crt ];then
    ${ECHO} -e "\n\e[1;36;40mAdd ca-certificate path for FreeBSD's wget...\n\e[0m";
    ${ECHO} -e "\nca-certificate=/usr/local/share/certs/ca-root-nss.crt" >> ~/.wgetrc
fi

if [ "$SHELL" = "/bin/bash" ] || [ "$SHELL" = "/usr/local/bin/bash" ] ; then
    . ~/.bashrc
fi

${ECHO} -e "\n\e[1;36;40mUnitial installation was finished!\n\nPlease terminate all other works and restart your shell or re-login.\n\e[0m";
