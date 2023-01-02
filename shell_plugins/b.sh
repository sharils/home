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
  l)
    case "$cmd" in
      l) cmd=lynx ;;
    esac
    BROWSER="$cmd" "$@"
    ;;
  c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | jsx | lua | md | mdx | mw | pegjs | php | py | rs | scss | sh | sql | story | ts | tsx | txt | wat | xhtml | yaml | yml | zep) bat --language "$cmd" "$@" ;;
  *) brew "$cmd" "$@" ;;
  esac
}
