#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

w8() {
  dir="$HOME/Sync/Libera PRO"
  if [ $# -eq 0 ]; then
    ls "$dir"
    return $?
  fi
  file="$dir/${2:?}.txt"
  curl --compressed --location --silent --output "$file" "https://dl1.wenku8.com/down.php?type=big5&id=${1:?}"
  echo "mv '$file' '$dir/next' # or"
  echo "vim '$file'" | pbcopy
  echo "$(pbpaste) # copied to clipboard"
}

w8 "$@"
