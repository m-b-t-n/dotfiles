# dotfiles

## Pre-requirements

### Common

* Set user settings in `$HOME/gitconfig.user`. The sample is following;

```sh
$ cat ~/gitconfig.user
[user]
	email = mbtn_0xff@outlook.com
	name = m-b-t-n
```

* [Ricty](https://rictyfonts.github.io/)

* [Node.js](https://nodejs.org/en/)

### Windows

* [Git for Windows](https://git-scm.com/download/win)

### macOS

```sh
$ bash --version
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin18)
Copyright (C) 2007 Free Software Foundation, Inc.
```

Tips:
Following instructions are for using newly bash on macOS.  
Modify settings as the bash installed by homebrew.

```sh
$ brew install bash
$ INSTALLED_VERSION=5.1.8 ## ここはインストールしたときの ver. 番号を埋める
$ BASH_PATH="/usr/local/Cellar/bash/${INSTALLED_VERSION}/bin/bash"
$ sudo echo ${BASH_PATH} >> /etc/shell
$ sudo chsh -s ${BASH_PATH} ${USER}
$ sudo reboot
```

### Linux

* Under checking...

## How to setup

Run `setup.sh` on your `$HOME` directory.

```sh
$ bash dotfiles/setup.sh
```

## How to test setup.sh

Run `test_setup.sh` on your `$HOME` directory.

```sh
$ bash dotfiles/test_setup.sh
```

You can check the result by seeing `dotfiles/test_setup.sh.log`.

## Structures

```sh
├── README.md
├── bash
│   ├── bash_profile     # -> `~/.bash_profile`
│   ├── bashrc           # -> `~/.bashrc`
│   ├── linux
│   ├── macos
│   └── windows
├── env
│   └── environment_vars
├── git
│   ├── gitconfig        # -> `~/.gitconfig`
│   └── gitconfig.alias
├── plantuml
│   ├── bin
│   └── txt2plantuml.sh
├── ranger
│   ├── config           # -> `~/.config/ranger`
│   └── ranger.sh
├── setup.sh
├── test_setup.sh
├── tig
│   └── tigrc            # -> `~/.tigrc`
├── tmux
│   ├── linux
│   ├── macos
│   ├── tmux.conf
│   └── tmux.startup
├── vim
│   ├── cheatsheet.md
│   ├── coc
│   ├── dein
│   ├── gvimrc           # -> `~/.gvimrc`
│   ├── template
│   └── vimrc            # -> `~/.vimrc`
└── wezterm               # -> `~/.config/wezterm`
    ├── keys.lua
    └── wezterm.lua
```

