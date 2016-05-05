#!/bin/sh
pyenv versions
pyenv virtualenv <installed-python-version> <new-env-name>
pyenv global <registered-env-name>
pyenv local <registered-env-name>
