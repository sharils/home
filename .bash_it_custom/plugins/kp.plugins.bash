#!/usr/bin/env bash

kp() {
  cmd=$1
  shift

  case $cmd in

  g)
    # alias kpxcg=$'keepassxc-cli generate --lower --numeric --special --upper --every-group --length 40 --exclude \$\'"\\" #$%&+,/:;<=>?@[\]^``{|}"\''
    keepassxc-cli generate --lower --numeric --special --upper --every-group --length 40 --exclude ' "#$%&+,/:;<=>?@[\]^`{|}'
    ;;

  w)
    keepassxc-cli diceware --words 12

  esac
}
