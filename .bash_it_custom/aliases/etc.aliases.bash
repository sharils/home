#!/usr/bin/env sh

alias b='bat'
alias l='less --quit-if-one-screen'

alias ex='elixir -e'
alias js='node -p'
alias phr='php -r'
alias py='python -c'

alias rand36='base64 < /dev/urandom | tr -d "+/[:upper:]" | head -c 6'
alias rand62='base64 < /dev/urandom | tr -d "+/" | head -c 5'
alias rand64='base64 < /dev/urandom | tr "+/" "-_" | head -c 5'
