# Usage

`$ sh ~/dotfiles/update.sh`

# Shell

## zsh

`$ chsh -s <path/to/zsh>`

## Environment variable

Set following environment variables for convenience.

| Environment variable        | Purpose |
| --------------------------- | ---------- |
| `GITLAB_PRIVATE_TOKEN`      | To call GitLab API |
| `HOMEBREW_GITHUB_API_TOKEN` | To avoid "GitHub API rate limit exceeded" |

For Openstack driver (ConoHa API)

| Environment variable        | Purpose |
| --------------------------- | ---------- |
| `OS_USERNAME`               | user name |
| `OS_TENANT_ID`              | tenant id |
| `OS_PASSWORD`               | password |
| `OS_AUTH_URL`               | https://identity.tyo1.conoha.io/v2.0 |
| `OS_REGION_NAME`            | tyo1 |

`direnv` is a handy tool to set environment variables.
