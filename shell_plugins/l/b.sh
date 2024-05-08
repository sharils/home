#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

b() {
  log=~/Library/Logs/Livebook.log
  case "$1" in
  f)
    shift
    log1="$(tail -n1 ~/Library/Logs/Livebook.log)"
    /Applications/Firefox.app/Contents/MacOS/firefox "${log1##* }"
    ;;
  l) shift && bat --language=log --style=plain "$log" "$@" ;;
  o) shift && open -b dev.livebook.Livebook "$@" ;;
  q) shift && osascript -e 'quit app "Livebook"' "$@" ;;
  esac
}

b "$@"
