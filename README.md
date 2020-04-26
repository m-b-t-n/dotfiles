# README

They are my dotfiles.  

## How to setup

Run `setup.sh` on your HOME directory.

```sh
$ bash dotfiles/setup.sh
```

## How to test setup.sh

Run `test_setup.sh`.

```sh
$ bash dotfiles/test_setup.sh
```

You can check the result by seeing `dotfiles/test_setup.sh.log`.

## Structures

* Basic idea is to share dotfiles among Windows, macOS, Linux

  - Entry point of each dotfiles is placed under "common/" dir.

  - In case of OS-unique settings, describe to "bashrc.local" of each subdirs.

```
├── README.md
├── common
│   ├── bashrc    # linked by setup.sh
│   ├── tigrc     # linked by setup.sh
│   ├── git
│   ├── gitconfig # linked by setup.sh
│   ├── gvimrc    # linked by setup.sh
│   ├── plantuml
│   ├── ranger
│   ├── tig
│   ├── tmux
│   ├── tmux.conf # linked by setup.sh
│   ├── vimrc     # linked by setup.sh
│   └── zazu
├── osx           # it means to macOS (OS X)
│   ├── bashrc.local
│   └── tmux
│       └── tmux.window.initial.macmini
├── setup.sh
├── test_setup.sh
├── ubuntu        # it means to Linux, but currently i use ONLY Ubuntu
│   ├── bashrc.local
│   └── tmux
│       └── tmux.window.initial
└── windows
    ├── bashrc.local
    ├── gitbash.profile
    └── gvimrc
```

