#!/bin/sh -x

CAT="/bin/cat"
MKDIR="/bin/mkdir"
RM="/bin/rm"

os=`uname`
if [ $os = "Linux" ]
then
    ECHO="/bin/echo"
    ${ECHO} -e "\n\e[1;36;40mYour operating system is GNU/Linux\n\e[0m";
    download='wget -nv --no-check-certificate'
    download_o='wget -nv --no-check-certificate -O'
else
    ECHO="echo"
    ${ECHO} -e "\n\e[1;36;40mYour operating system is NOT GNU/Linux, maybe a BSD system!?\n\e[0m";
    download='fetch'
    download_o='fetch -o'
fi

${ECHO} -e "\n\e[1;36;40mUnitial is started to initial your Unix-like working environment\n\nPlease wait...\n\n \e[0m";
path='https://raw.github.com/PeterDaveHello/Unitial/master/'

${ECHO} -e "\n\e[1;36;40mTry to download and setup configs from server...\n\e[0m";
for files in gitconfig tcshrc bash_profile inputrc vimrc zshrc
do
    ${download} "$path""$files"
    ${CAT} "$files" >> ~/."$files"
    ${RM} "$files"
done

${ECHO} -e "\n\e[1;36;40mAdd some color setting which depends on your OS...\n\e[0m";
if [ $os = "Linux" ]
then
    ${ECHO} "alias ls='\ls -GF --color=auto'" >> ~/.bash_profile
    ${ECHO} "alias ls '\ls -GF --color=auto'" >> ~/.tcshrc
else
    ${ECHO} "export LSCOLORS=gxfxcxdxbxegedabagacad" >> ~/.bash_profile
fi

${ECHO} -e "\n\e[1;36;40mTry to download VIM color scheme - Kolor from server...\n\e[0m";
${MKDIR} -p ~/.vim/colors/
${download_o} ~/.vim/colors/kolor.vim https://raw.github.com/zeis/vim-kolor/master/colors/kolor.vim
${ECHO} -e "\n\e[1;36;40mTry to download git's auto completion configs from server...\n\e[0m";
git_auto_complete_path='https://raw.github.com/git/git/master/contrib/completion/git-completion.'
${download_o} ~/.git-completion.bash "$git_auto_complete_path"bash
${download_o} ~/.git-completion.tcsh "$git_auto_complete_path"tcsh

${ECHO} -e "\n\e[1;36;40mUnitial is finished!\n\nPlease terminate all other works and restart your shell or re-login.\n \e[0m";
