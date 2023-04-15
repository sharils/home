#!/usr/bin/env sh

w8() {
  cmd="$HOME/Sync/Libera PRO/${2:?}.txt"
  curl --compressed --location --silent --output "$cmd" "https://dl1.wenku8.com/down.php?type=big5&id=${1:?}"
  echo "$cmd" | pbcopy
  pbpaste
}

w8 "$@"
