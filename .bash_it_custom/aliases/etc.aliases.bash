#!/usr/bin/env bash

alias dsf='diff-so-fancy | less'

alias ascii='ascii-x'
alias rfc4648='rfc4648-5'
alias sshconfig='less ~/.ssh/config'

alias ex='elixir -e'
alias js='node -e'
alias phr='php -r'
alias py='python -c'

alias rbase36=$'base64 < /dev/random | tr -d \'+/[:upper:]\' | head -c 6'
alias rbase62=$'base64 < /dev/random | tr -d \'+/\' | head -c 5'
alias rbase64=$'base64 < /dev/random | tr \'+/\' \'-_\' | head -c 5'
