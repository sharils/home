#!/usr/bin/env sh

b() {
  if [ ! -t 0 ]; then
    col -bx | bat --language "${@:-man}"
    return
  fi

  if echo "$1" | g url >/dev/null; then
    browsh "$@"
    return
  fi

  for arg in "$@"; do
    if [ -f "$arg" ]; then
      bat "$@"
      return
    fi
  done

  cmd="$1"
  shift

  case "$cmd" in
  i) brew install "$@" ;;
  ri) brew reinstall "$@" ;;
  out) brew outdated "$@" ;;
  v) brew abv "$@" ;;
  f | l | n | o | t | u | x)
    case "$cmd" in
      c) cmd=/Applications/Chromium.app/Contents/MacOS/Chromium ;;
      f) cmd=/Applications/Firefox.app/Contents/MacOS/firefox ;;
      l) cmd=lynx ;;
      n) cmd=none ;;
      o) cmd=open ;;
      u) cmd=qutebrowser ;;
      t) cmd=/Applications/Tor\ Browser.app/Contents/MacOS/firefox ;;
      x) cmd=/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox ;;
    esac
    BROWSER="$cmd" "$@"
    ;;
  c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | jsx | lua | md | mdx | mw | pegjs | php | py | rs | scss | sh | sql | story | ts | tsx | txt | wat | xhtml | yaml | yml | zep) bat --language "$cmd" "$@" ;;
  *) brew "$cmd" "$@" ;;
  esac
}
