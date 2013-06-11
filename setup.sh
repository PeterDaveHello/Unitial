#!/bin/sh -x

os=`uname`
if [ $os = "FreeBSD" ]
then
download='fetch'
download_o='fetch -o'
else
download='wget -nv'
download_o='wget -nv -O'
fi

path='https://raw.github.com/PeterDaveHello/Unitial/master/'

for files in gitconfig tcshrc bash_profile inputrc vimrc
do
    ${download} "$path""$files"
    cat "$files" >> ~/."$files"
    \rm "$files"
done

mkdir -p ~/.vim/colors/
${download_o} ~/.vim/colors/kolor.vim https://raw.github.com/zeis/vim-kolor/master/colors/kolor.vim 
${download_o} ~/.git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
