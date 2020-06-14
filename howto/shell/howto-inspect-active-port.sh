#!/bin/bash -E
# cf. [macでLISTENとして使用しているポートを調べる方法 - Qiita](http://qiita.com/yokozawa/items/dbcb3b31f9308e4dcefc)
sudo lsof -i -P | grep "LISTEN"
