# Shell

## Install zsh

    chsh -s <path/to/zsh>

## Install oh-my-zsh

via curl

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

via wget

    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

## oh-my-zsh plugins

### zsh-syntax-highlighting

Clone the repository

    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

In .zshrc

    plugins+=(zsh-syntax-highlighting)

### zsh-completions 

Clone the repository

    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

In .zshrc

    plugins+=(zsh-completions)
    autoload -U compinit && compinit

# Vim関係

## NeoBundle

    $ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

## Macの場合

[MacVim-KaoriYa](https://github.com/splhack/macvim-kaoriya)をインストール

# Ruby関係

## Macの場合

基本brewでインストール
brew install ruby
PATH=/usr/local/Cellar/ruby/<ruby version>/bin:$PATH

## Gem

gem update --system
gem install bundler

# Tex関係

## Macの場合

[MacTeX](https://www.tug.org/mactex/)をインストール
Vim用に[vim-latex](https://github.com/vim-latex/vim-latex)も導入
