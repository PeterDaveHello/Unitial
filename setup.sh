#!/bin/sh

CAT="/bin/cat"
CHMOD="/bin/chmod"
MKDIR="/bin/mkdir"
RM="/bin/rm"

os=`uname`
if [ $os = "Linux" ] || [ $os = "GNU" ] || [ $os = "Darwin" ];then
    ECHO="/bin/echo"
    ${ECHO} -e "\n\e[1;36;40mYour operating system is $os\n\e[0m";
    ${ECHO} -e "\n\e[1;36;40mSuppose you have 'wget' to download files!\n\e[0m";
    download='wget -nv --no-check-certificate'
    download_o='wget -nv --no-check-certificate -O'
else
    ECHO="echo"
    ${ECHO} -e "\n\e[1;36;40mYour operating system is $os\n\e[0m";
    ${ECHO} -e "\n\e[1;36;40mSuppose you are using a BSD system and you have 'fetch' to download files!\n\e[0m";
    download='fetch'
    download_o='fetch -o'
fi

${ECHO} -e "\n\e[1;36;40mUnitial is started to initial your Unix-like working environment\n\nPlease wait...\n\n\e[0m";
path='https://raw.github.com/PeterDaveHello/Unitial/master/'

${ECHO} -e "\n\e[1;36;40mDownload and setup configs from server...\n\e[0m";
for files in gitconfig tcshrc bashrc bash_profile inputrc vimrc zshrc gitignore_global
do
    ${download} "$path""$files"
    ${CAT} "$files" >> ~/."$files"
    ${RM} "$files"
done

${ECHO} -e "\n\e[1;36;40mAdd some color setting which depends on your OS...\n\e[0m";
if [ $os = "Linux" ] || [ $os = "GNU" ];then
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F --color=auto'" >> ~/.bashrc
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F --color=auto'" >> ~/.zshrc
    ${ECHO} -e "\n#color setting\nalias ls '\ls -F --color=auto'" >> ~/.tcshrc
elif [ $os = "FreeBSD" ] || [ $os = "Darwin" ] || [ $os = "DragonFly" ] || [ $os = "OpenBSD" ];then
    ${ECHO} -e "\n#color setting\nalias ls='\ls -GF'" >> ~/.bashrc
    ${ECHO} -e "\n#color setting\nalias ls='\ls -GF'" >> ~/.zshrc
    ${ECHO} -e "\n#color setting\nalias ls '\ls -GF'" >> ~/.tcshrc
    ${ECHO} "export LSCOLORS=gxfxcxdxbxegedabagacad" >> ~/.bashrc
fi

if [ $os = "FreeBSD" ];then
    ${ECHO} -e "\n\e[1;36;40mAdd FreeBSD's package mirror setting...\n\e[0m";
    ${ECHO} -e "\n#package mirror setting\nexport PACKAGEROOT=http://ftp.tw.freebsd.org" >> ~/.bashrc
    ${ECHO} -e "\n#package mirror setting\nsetenv PACKAGEROOT http://ftp.tw.freebsd.org" >> ~/.tcshrc
fi

${ECHO} -e "\n\e[1;36;40mDownload VIM color scheme - Kolor from server...\n\e[0m";
${MKDIR} -p ~/.vim/colors/
${download_o} ~/.vim/colors/kolor.vim https://raw.github.com/zeis/vim-kolor/master/colors/kolor.vim
${ECHO} -e "\n\e[1;36;40mDownload git contrib - diff-highlight from server...\n\e[0m";
${MKDIR} -p ~/.git/contrib/
${download_o} ~/.git/contrib/diff-highlight https://github.com/git/git/raw/master/contrib/diff-highlight/diff-highlight
${CHMOD} +x ~/.git/contrib/diff-highlight
${ECHO} -e "\n\e[1;36;40mDownload git's auto completion configs from server...\n\e[0m";
git_auto_complete_path='https://raw.github.com/git/git/master/contrib/completion/git-completion.'
${download_o} ~/.git-completion.bash "$git_auto_complete_path"bash
${download_o} ~/.git-completion.tcsh "$git_auto_complete_path"tcsh

${ECHO} -e "\n\e[1;36;40mUnitial installation was finished!\n\nPlease terminate all other works and restart your shell or re-login.\n\e[0m";
