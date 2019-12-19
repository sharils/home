#!/usr/bin/env bash

alias dsf='diff-so-fancy | less'

alias ascii='ascii-x'
alias rfc4648='rfc4648-5'
alias sshconfig='less ~/.ssh/config'

alias ex='elixir -e'
alias js='node -e'
alias phr='php -r'
alias py='python -c'

alias rand36=$'base64 < /dev/urandom | tr -d \'+/[:upper:]\' | head -c 6'
alias rand62=$'base64 < /dev/urandom | tr -d \'+/\' | head -c 5'
alias rand64=$'base64 < /dev/urandom | tr \'+/\' \'-_\' | head -c 5'
