#!/bin/sh

CAT="/bin/cat"
CHMOD="/bin/chmod"
MKDIR="/bin/mkdir"
RM="/bin/rm"
MV="/bin/mv"

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
    download='curl -#kO'
    download_o='curl -#ko'
fi

${ECHO} -e "\n\e[1;36;40mUnitial is started to initial your Unix-like working environment\n\nPlease wait...\n\n\e[0m";

${ECHO} -e "\n\e[1;36;40mDownload and setup configs from server...\n\e[0m";
for files in gitconfig tcshrc bashrc bash_profile inputrc vimrc zshrc gitignore_global tmux.conf w3mconfig xinputrc wgetrc
do
    ${download} "$github_base""$repo_path""$files"
    ${CAT} "$files" >> ~/."$files"
    ${RM} "$files"
done

${MKDIR} -p ~/.irssi/ ~/.git/contrib/ ~/.vim/colors/ ~/.vim/swp/ ~/.vim/bak/ ~/.vim/undo/ ~/.aria2/

${download_o} ~/.irssi/config "$github_base""$repo_path"irssi_config
${download_o} ~/.aria2/aria2.conf "$github_base""$repo_path"aria2.conf

${download_o} ~/.colorEcho "$github_base""PeterDaveHello/ColorEchoForShell/master/dist/ColorEcho.bash"

${download} "$github_base""$repo_path"gtab.list
${MKDIR} -p ~/.gcin/
${MV} gtab.list ~/.gcin/

${download} "$github_base""$repo_path"ssh_config
${MKDIR} -p -m 700 ~/.ssh/.tmp_session/
${CAT} ssh_config >> ~/.ssh/config
${RM} ssh_config

${ECHO} -e "\n\e[1;36;40mAdd some color setting which depends on your OS...\n\e[0m";
if [ $os = "FreeBSD" ] || [ $os = "Darwin" ];then
    ${ECHO} -e "\n#color setting\nalias ls='\ls -F'" >> ~/.zshrc
    ${ECHO} -e "\n#color setting\nalias ls '\ls -F'" >> ~/.tcshrc
else
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
${download_o} ~/.vim/colors/kolor.vim "$github_base"zeis/vim-kolor/master/colors/kolor.vim
${ECHO} -e "\n\e[1;36;40mDownload git contrib - diff-highlight from server...\n\e[0m";
${download_o} ~/.git/contrib/diff-highlight "$github_base"git/git/master/contrib/diff-highlight/diff-highlight
${CHMOD} +x ~/.git/contrib/diff-highlight
${ECHO} -e "\n\e[1;36;40mDownload git's auto completion configs from server...\n\e[0m";
git_auto_complete_path="$github_base"'git/git/master/contrib/completion/git-completion.'
${download_o} ~/.git-completion.bash "$git_auto_complete_path"bash
${download_o} ~/.git-completion.tcsh "$git_auto_complete_path"tcsh
${download_o} ~/.git-completion.zsh "$git_auto_complete_path"zsh

if [ $os = "FreeBSD" ] && [ -r /usr/local/share/certs/ca-root-nss.crt ];then
    ${ECHO} -e "\n\e[1;36;40mAdd ca-certificate path for FreeBSD's wget & aria2...\n\e[0m";
    ${ECHO} -e "\nca-certificate=/usr/local/share/certs/ca-root-nss.crt" >> ~/.wgetrc
    ${ECHO} -e "\nca-certificate=/usr/local/share/certs/ca-root-nss.crt" >> ~/.aria2/aria2.conf
fi

${ECHO} -e "\n\e[1;36;40mUnitial installation was finished!\n\nPlease terminate all other works and restart your shell or re-login.\n\e[0m";
