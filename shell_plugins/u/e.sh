#!/usr/bin/env sh

e() {
  vim -p \
    "$HOME/Library/Preferences/qutebrowser/autoconfig.yml" \
    "$HOME/.qutebrowser/bookmarks/urls" \
    "$HOME/.qutebrowser/quickmarks" \
    "$HOME/.qutebrowser/config.py" \
    "$HOME/.qutebrowser/greasemonkey"
}

e "$@"
