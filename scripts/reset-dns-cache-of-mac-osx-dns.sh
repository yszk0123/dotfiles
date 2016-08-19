#!/bin/sh
# cf. https://support.apple.com/ja-jp/HT202516

# OS X v10.10.4+
sudo killall -HUP mDNSResponder

# OS X v10.10 ~ v10.10.3
# sudo discoveryutil mdnsflushcache

# OS X v10.9.5-
# sudo killall -HUP mDNSResponder

# OS X v10.6 ~ v10.6.8
# sudo dscacheutil -flushcache
