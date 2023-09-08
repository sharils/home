#!/usr/bin/env sh

w8() {
  dir="$HOME/Sync/Libera PRO"
  file="$dir/${2:?}.txt"
  curl --compressed --location --silent --output "$file" "https://dl1.wenku8.com/down.php?type=big5&id=${1:?}"
  echo "mv '$file' '$dir/next' # or"
  echo "vim '$file'" | pbcopy
  echo "$(pbpaste) # copied to clipboard"
}

w8 "$@"
