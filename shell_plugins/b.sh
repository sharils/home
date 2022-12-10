#!/usr/bin/env sh

b() {
  if [ $# -eq 0 ] || [ -r "$1" ]; then
    bat "$@"
    return
  fi

  cmd="$1"
  shift

  case "$cmd" in
  h) brew help "$@" ;;
  i) brew install "$@" ;;
  ri) brew reinstall "$@" ;;
  out) brew outdated "$@" ;;
  c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | jsx | lua | md | mdx | mw | pegjs | php | py | rs | scss | sh | sql | story | t | ts | tsx | txt | wat | xhtml | yaml | yml | zep) bat --language "$cmd" "$@" ;;
  *) brew "$cmd" "$@" ;;
  esac
}
