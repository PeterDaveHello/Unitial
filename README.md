This is a beta verion
=====================
no dangerous and harm, but it's not complete!

Unitial
=======
Automatic initialize environment for Unix-like operating system!


Introduction
============
I hope to make a script to initialize the environment for friendly use in Unix-like OS,

Currently, I can only aim(and test) at FreeBSD and most Linux distros.
(Originally, I do this for myself only, but I think I can share it to other people, so I upload it to github!)

If you are interesting in the very small project, welcome to fork and feedback, or join it!

Any question and suggestion, please let me know, thanks.


How to use it?
==============
First :
`curl -kO https://raw.github.com/PeterDaveHello/Unitial/master/setup.sh`

Second :
`chmod +x setup.sh`

Third :
`./setup.sh`

PS : If you are using FreeBSD, please use "fetch" instead of "curl -kO", in case that you don't have curl to use

And all works will be done in seconds.

If you know how to use git and already installed it, you can also clone this repo, but there is no need.

I hope it can be used very easy! And if you got git on your machine, maybe you already initialized it by yourself:)

This is design for whom? and for what?
======================================
Originally, this is used for myself only, I hate to configure in a new environment everytime!

I think that maybe I can share it to someone else, so I did some modify and upload on github! 


What's in it?
=============
Bash/tcsh/csh/zsh Shell :
auto completion, useful alias, keymap issue for many users, because BASH is my major shell and I seldom use zsh, bash's feature will be more than others.

Vim :
useful setting, status bar and comfortable color scheme

Git :
useful alias and setting, auto completion, diff-highlight

SSH :
useful setting

Notes
=====
Currently, I only test on "lastest" FreeBSD and most Linux distros, if it's not work, please tell me to fix.

Author
======
Peter Dave Hello
hsu [at] peterdavehello [dot] org
