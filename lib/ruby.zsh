export PATH="$HOME/.rbenv/bin:$PATH"
if is_exists 'rbenv'; then
  eval "$(rbenv init -)"
fi
if is_exists 'bundle'; then
  alias be='bundle exec'
  alias berc='bundle exec rails c'
  alias bers='bundle exec rails s'
  alias ber='bundle exec rspec'
  alias staging_be='RAILS_ENV=staging bundle exec'
fi

# vim:set ft=zsh:
