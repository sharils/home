#!/usr/bin/env sh

v() {
  if [ ! -t 0 ]; then
    tmp="$(mktemp)"
    cat >"$tmp"
    if grep --extended-regexp ':\d+:' "$tmp" >/dev/null; then
      set -- -q "$tmp"
      [ "$(wc -l < "$tmp")" -ge 2 ] && set -- +copen "$@"
      vim "$@"
    else
      xargs -o vim "$@" <"$tmp"
    fi
    return
  elif [ $# -ge 1 ]; then
    :
  elif [ -f Session.vim ]; then
    set -- -S Session.vim
  else
    set -- +Obsession
  fi

  case "$1" in

  di) vim .dockerignore ;;
  dk) vim Dockerfile ;;
  hosts) EDITOR=vim sudo --edit /etc/hosts "$@" ;;
  i)
    shift
    case "${1:-html}" in
    c) shift && set -- css ;;
    h) shift && set -- html ;;
    j) shift && set -- jsx ;;
    t) shift && set -- tsx ;;
    esac
    vim "index.$1"
    ;;
  mk) vim Makefile ;;
  ns) vim server.js ;;
  rm) vim README.md ;;
  s) vim server.js ;;
  tor) vim ~/Library/Application\ Support/TorBrowser-Data/Tor/torrc ;;

  applescript | c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | jsx | lua | md | mdx | mw | nginx | pegjs | php | py | rs | scss | sh | sql | story | t | ts | tsx | txt | wat | xhtml | yaml | yml | zep)
    if [ -f "$1" ]; then
      vim "$1"
      return
    fi
    [ "$1" != 't' ] && set -- "$1.$1"
    z t_init
    vim "$(z t && echo "$PWD")/$1"
    ;;

  *) vim "$@" ;;

  esac
}
