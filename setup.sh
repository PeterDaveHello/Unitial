#!/bin/sh -x

CAT="/bin/cat"
ECHO="/bin/echo"
MKDIR="/bin/mkdir"
RM="/bin/rm"

os=`uname`
if [ $os = "Linux" ]
then
    download='wget -nv'
    download_o='wget -nv -O'
else
    download='fetch'
    download_o='fetch -o'
fi

path='https://raw.github.com/PeterDaveHello/Unitial/master/'

for files in gitconfig tcshrc bash_profile inputrc vimrc
do
    ${download} "$path""$files"
    ${CAT} "$files" >> ~/."$files"
    ${RM} "$files"
done

if [ $os = "Linux" ]
then
    ${ECHO} "alias ls='\ls -GF --color=auto'" >> ~/.bash_profile
    ${ECHO} "alias ls '\ls -GF --color=auto'" >> ~/.tcshrc
else
    ${ECHO} "export LSCOLORS=gxfxcxdxbxegedabagacad" >> ~/.bash_profile
fi

${MKDIR} -p ~/.vim/colors/
${download_o} ~/.vim/colors/kolor.vim https://raw.github.com/zeis/vim-kolor/master/colors/kolor.vim
${download_o} ~/.git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash

${ECHO} -e "\n\e[1;36;40mUnitial is finished!\n\nPlease terminate all other works and restart your shell or re-login.\n \e[0m";
