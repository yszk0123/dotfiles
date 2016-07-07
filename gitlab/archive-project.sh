#!/bin/sh
# Note: set gitlab private token to GITLAB_PRIVATE_TOKEN (environment variable)
PROJECT_NAME="$1"
[ -z "$PROJECT_NAME" ] && echo PROJECT_NAME required && exit 1

curl -v -X POST -H "PRIVATE-TOKEN: $GITLAB_PRIVATE_TOKEN" -d name="$PROJECT_NAME" "https://gitlab.com/api/v3/projects"
