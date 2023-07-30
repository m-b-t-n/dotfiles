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

After that, set your global user/email settings of Git into `dotfiles/env/git/user`.
The sample is following;

```sh
$ cat ~/dotfiles/env/git/user
[user]
        email = mbtn_0xff@outlook.com
        name = m-b-t-n
```

## How to test setup.sh

Run `test_setup.sh` on your `$HOME` directory.

```sh
$ bash dotfiles/test_setup.sh
```

You can check the result by seeing `dotfiles/test_setup.sh.log`.

## Requirements

### Common

* [PlemolJP fonts](https://github.com/yuru7/PlemolJP)
  - Especially **PlemolJP35**, others are not required

* [Node.js](https://nodejs.org/en/)

### OS-specific

<details>
<summary>For Windows</summary>

* Install [Git for Windows](https://git-scm.com/download/win)

* If you have been used WSL/WSL2, see below Linux section

</details>

<details>
<summary>For macOS</summary>

* Install [Homebrew](https://brew.sh/)
  ```sh
  ### Below is the **DEAD COPY** of official installation
  $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

* Install newly bash (v5+)
  ```sh
  ### Install newly bash
  $ brew install bash

  ### Check the version of bash
  ### The sample is following at 2023/06/09
  $ bash --version
  GNU bash, version 5.2.15(1)-release (x86_64-apple-darwin21.6.0)
  Copyright (C) 2022 Free Software Foundation, Inc.
  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

  This is free software; you are free to change and redistribute it.
  There is NO WARRANTY, to the extent permitted by law.
  ```

* Change default shell from zsh to bash
  ```sh
  ### Change default shell
  $ BASH_PATH="$(brew --prefix)/bin/bash"
  $ sudo echo "${BASH_PATH}" >> /etc/shells
  $ sudo chsh -s "${BASH_PATH}" $(whoami)
  $ sudo reboot
  ```

</details>

<details>
<summary>For Linux</summary>

* I think there is no need to do because most distro have been selected bash for default shell

* If not, you need to change default shell to bash, refer to macOS section

</details>

## Structures

:information_source: Some elements have been omitted.

```sh
$ tree -L 3 dotfiles/
├── README.md
├── bash
│   ├── bash_profile           # -> ~/.bash_profile
│   ├── bashrc                 # -> ~/.bashrc
│   ├── linux/
│   ├── macos/
│   └── windows/
├── broot/                      # -> ~/.config/broot/
├── editorconfig
│   └── editorconfig           # -> ~/.editorconfig
├── env
│   ├── environment_vars       # Need to create by your own
│   └── git
│       └── user               # Need to create by your own
├── gh
│   └── config.yml             # -> ~/.config/gh/config.yml
├── git                         # -> ~/.config/git/
│   ├── alias
│   └── config
├── plantuml
│   ├── bin/
│   └── txt2plantuml.sh
├── ranger
│   ├── config/                # -> ~/.config/ranger/
│   └── ranger.sh
├── setup.sh
├── test_setup.sh
├── tig
│   └── tigrc                  # -> ~/.tigrc
├── tmux/
├── vim
│   ├── cheatsheet.md
│   ├── coc
│   │   └── coc-settings.json # -> ~/.vim/coc-settings.json
│   ├── dein/
│   ├── gvimrc                 # -> ~/.gvimrc
│   ├── template/
│   └── vimrc                  # -> ~/.vimrc
└── wezterm                     # -> ~/.config/wezterm/
    ├── keys.lua
    └── wezterm.lua

```
