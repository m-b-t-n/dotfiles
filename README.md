# README

(English below)

わたしの dotfiles です。

## 事前条件

### 共通

* `$HOME/gitconfig.user` にユーザ設定を記述します。下記はサンプルです

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

```
$ bash --version
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin18)
Copyright (C) 2007 Free Software Foundation, Inc.
```

### Linux

* 確認中

## セットアップ

* `$HOME` ディレクトリ以下で下記を実行してください。

```sh
$ bash dotfiles/setup.sh
```

## 事前チェック

* `$HOME` ディレクトリ以下で下記を実行してください。

```sh
$ bash dotfiles/test_setup.sh
```

`dotfiles/test_setup.sh.log` を参照することで結果を確認できます。

## 構成図

* Windows, macOS, Linux 間でなるべく共通化することを目指しています

  - エントリーポイントとなる dotfiles 群は `common/` ディレクトリ配下に存在します

  - OS 固有の設定を記述する際は，それぞれの OS 毎のサブディレクトリ配下に分割して書き，`common` 側から読み込みます

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

---

# README

They are my dotfiles.  

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

* Basic idea is to share dotfiles among Windows, macOS, Linux

  - Entry point of each dotfiles is placed under `common/` dir.

  - In case of addition OS-unique settings, place dotfiles to each subdirs and include by `common/` side.

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

