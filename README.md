# はじめに

Xcode，HomebrewとAnsibleを導入する
ref: [HomebrewとAnsibleでMacの開発環境構築を自動化する | mawatari.jp](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)

```sh
$ sudo xcodebuild -license
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew update
$ brew install ansible
```

# 使い方

```sh
$ cd ~
$ ./dotfiles/update.sh
```

# Shell

## Install zsh

```sh
$ chsh -s <path/to/zsh>
```

## zaw

```sh
$ pushd $ZDOTDIR && git clone https://github.com/zsh-users/zaw.git && popd
```

In .zshrc

```sh
$ source $ZDOTDIR/zaw/zaw.zsh
```

## Install oh-my-zsh

via curl

```sh
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

via wget

```sh
$ sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

## oh-my-zsh plugins

### zsh-syntax-highlighting

Clone the repository

```sh
$ git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

In .zshrc

```zsh
plugins+=(zsh-syntax-highlighting)
```

### zsh-completions

Clone the repository

```sh
$ git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
```

In .zshrc

```zsh
plugins+=(zsh-completions)
autoload -U compinit && compinit
```

# Vim関係

## NeoBundle

```sh
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

## Macの場合

[MacVim-KaoriYa](https://github.com/splhack/macvim-kaoriya)をインストール

# Ruby関係

## Macの場合

基本brewでインストール

```sh
$ brew install ruby
$ PATH=/usr/local/Cellar/ruby/<ruby version>/bin:$PATH
```

## Gem

```sh
$ gem update --system
$ gem install bundler
```

# Tex関係

## Macの場合

[MacTeX](https://www.tug.org/mactex/)をインストール
Vim用に[vim-latex](https://github.com/vim-latex/vim-latex)も導入

# ctags関係

cf. [dotfiles/.ctags at master · claytron/dotfiles](https://github.com/claytron/dotfiles/blob/master/.ctags)
