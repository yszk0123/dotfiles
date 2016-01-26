if is_exists 'rbenv'; then
  function load_ruby() {
    unset -f rbenv
    unset -f ruby
    unset -f irb
    unset -f bundle

    eval "$(rbenv init -)"
  }

  rbenv() { load_ruby; rbenv "$@"; }
  ruby() { load_ruby; ruby "$@"; }
  irb() { load_ruby; irb "$@"; }
  bundle() { load_ruby; bundle "$@"; }

  alias be='bundle exec'
  alias berc='bundle exec rails c'
  alias bers='bundle exec rails s'
  alias ber='bundle exec rspec'
  alias staging_be='RAILS_ENV=staging bundle exec'
fi

# vim:set ft=zsh:
