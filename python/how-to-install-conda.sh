#!/bin/sh
# cf. [データサイエンティストを目指す人のpython環境構築 2016](http://qiita.com/y__sama/items/5b62d31cb7e6ed50f02c)
pyenv install anaconda2-2.5.0
pyenv global anaconda2-2.5.0
pyenv local anaconda2-2.5.0
conda install -c https://conda.binstar.org/menpo opencv
conda install numpy

# Check the versions of python and cv2
# $ python --version
# $ python
# >>> import cv2
# >>> cv2.__version__
