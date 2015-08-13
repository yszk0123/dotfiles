if is_exists 'rbenv'; then
  function load_ruby() {
    unset -f rbenv
    unset -f ruby
    unset -f irb

    eval "$(rbenv init -)"

    if is_exists 'bundle'; then
      alias be='bundle exec'
      alias berc='bundle exec rails c'
      alias bers='bundle exec rails s'
      alias ber='bundle exec rspec'
      alias staging_be='RAILS_ENV=staging bundle exec'
    fi
  }

  rbenv() { load_ruby; rbenv "$@"; }
  ruby() { load_ruby; ruby "$@"; }
  irb() { load_ruby; irb "$@"; }
fi

# vim:set ft=zsh:
