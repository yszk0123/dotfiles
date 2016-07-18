sudo yum install -y golang
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH
ln -si ~/.go/src ~/src
go get github.com/motemen/ghq
git config --global ghq.root ~/src

