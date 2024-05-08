#!/usr/bin/env sh

export HOMEBREW_NO_ANALYTICS=1
[ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -x "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
