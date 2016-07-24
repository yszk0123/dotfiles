#!/bin/sh
docker volume ls -f dangling=true | tail -n +2 | awk '{ print $2; }' | xargs docker volume rm
