#!/usr/bin/env bash

k() {
  cmd=$1
  shift

  case $cmd in

  d) keepassxc-cli diceware --words "${@:-12}" | tr -d \\n ;;

  g)
    # alias kpxcg=$'keepassxc-cli generate --lower --numeric --special --upper
    # --every-group --length 40 --exclude \$\'"\\" #$%&+,/:;<=>?@[\]^``{|}"\''
    keepassxc-cli generate --lower --numeric --special --upper --every-group \
      --length "${@:-40}" --exclude ' "#$%&+,/:;<=>?@[\]^`{|}' | tr -d \\n
    ;;

  esac
}
