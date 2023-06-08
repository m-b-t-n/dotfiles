# dotfiles

## How to setup

Clone this repository into your `$HOME` directory.

```sh
$ cd $HOME
$ git clone git@github.com:m-b-t-n/dotfiles.git -b master
```

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

* [Homebrew](https://brew.sh/)
  ```sh
  ### Below is the **DEAD COPY** of official installation
  $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

* Change default shell from zsh to bash
  ```sh
  ### Install newly bash
  $ brew install bash

  ### Check where is bash installed
  $ brew config | grep -i prefix
  HOMEBREW_PREFIX: /usr/local # <= will need for below steps

  ### Change default shell
  $ BASH_PATH="/usr/local/bin/bash"
  $ sudo echo ${BASH_PATH} >> /etc/shells
  $ sudo chsh -s ${BASH_PATH} $(whoami)
  $ sudo reboot
  ```

### Linux

* Under checking...

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

