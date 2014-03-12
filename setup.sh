#!/bin/sh

CAT="/bin/cat"
CHMOD="/bin/chmod"
MKDIR="/bin/mkdir"
RM="/bin/rm"

repo_path='https://raw.github.com/PeterDaveHello/Unitial/master/'

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
for files in gitconfig tcshrc bashrc bash_profile inputrc vimrc zshrc gitignore_global
do
    ${download} "$repo_path""$files"
    ${CAT} "$files" >> ~/."$files"
    ${RM} "$files"
done

${download} "$repo_path"ssh_config
${MKDIR} -p ~/.ssh/
${CAT} ssh_config >> ~/.ssh/config
${RM} ssh_config

${ECHO} -e "\n\e[1;36;40mAdd some color setting which depends on your OS...\n\e[0m";
if [ $os = "FreeBSD" ] || [ $os = "Darwin" ];then
    ${ECHO} -e "\n#color setting\nalias ls='\ls -GF'" >> ~/.bashrc
    ${ECHO} -e "\n#color setting\nalias ls='\ls -GF'" >> ~/.zshrc
    ${ECHO} -e "\n#color setting\nalias ls '\ls -GF'" >> ~/.tcshrc
    ${ECHO} "export LSCOLORS=gxfxcxdxbxegedabagacad" >> ~/.bashrc
else
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F --color=auto'" >> ~/.bashrc
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F --color=auto'" >> ~/.zshrc
    ${ECHO} -e "\n#color setting\nalias ls '\ls -F --color=auto'" >> ~/.tcshrc
fi

if [ $os = "FreeBSD" ];then
    ${ECHO} -e "\n\e[1;36;40mAdd FreeBSD's package mirror setting...\n\e[0m";
    ${ECHO} -e "\n#package mirror setting\nexport PACKAGEROOT=http://ftp.tw.freebsd.org" >> ~/.bashrc
    ${ECHO} -e "\n#package mirror setting\nexport PACKAGEROOT=http://ftp.tw.freebsd.org" >> ~/.zshrc
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
${download_o} ~/.git-completion.zsh "$git_auto_complete_path"zsh

if [ $os = "FreeBSD" ] && [ -r /usr/local/share/certs/ca-root-nss.crt ];then
    ${ECHO} -e "\n\e[1;36;40mAdd ca-certificate path for FreeBSD's wget...\n\e[0m";
    ${ECHO} -e "\nca-certificate=/usr/local/share/certs/ca-root-nss.crt" >> ~/.wgetrc
fi

${ECHO} -e "\n\e[1;36;40mUnitial installation was finished!\n\nPlease terminate all other works and restart your shell or re-login.\n\e[0m";
