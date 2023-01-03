# Unitial

Automatic initialize environment for Unix-like operating system!

## Introduction

A set of scripts and configs to initialize the environment for Unix-like OS,

Not fully tested but should work on FreeBSD, most of Linux distros and macOS.

Feel free to fork, send pull request and feedback, but do not erase author info please.

Questions and suggestions are welcome.

## Requirements

For FreeBSD, there is no additional requirements, please use the built-in `fetch` command.

On other unix environment, please prepare `curl` or `wget`, so that the install script can download other files properly.

## Installation

Install by this one line command if you have `curl`:

```sh
curl -Lo- https://github.com/PeterDaveHello/Unitial/raw/master/setup.sh | bash
```

If you don't have `curl` but your have `wget`:

```sh
wget  -O- https://github.com/PeterDaveHello/Unitial/raw/master/setup.sh | bash
```

If you are using FreeBSD without both `wget` and `curl`, try:

```sh
fetch -o- https://github.com/PeterDaveHello/Unitial/raw/master/setup.sh | bash
```

(You can replace the url with a shorter one: https://git.io/Unitial)

All the works will be done in seconds.

If you know how to use git and already installed it, you can also clone this repo, but there is no need.

## What's in it?

Bash/tcsh/csh/zsh Shell:
auto completion, useful alias, keymap issue for many users, because BASH is my major shell and I seldom use zsh, bash's feature will be more than others.

Vim:
useful setting, status bar and comfortable color scheme

Git:
useful alias and setting, gitignore(global), auto completion, diff-highlight

SSH:
useful setting, including optimization for X11 forwarding, TCPKeepalicve, compression, and multiplexing!

irssi:
connection info for oftc and freenode, channel config example

tmux:
Useful status bar including avg load, color adjustment

others:

- aria2c
- wget
- curl
- tig
- w3m
- php_cs
- markdownlint
- editorconfig
