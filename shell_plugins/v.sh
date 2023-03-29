#!/usr/bin/env sh

v() {
  if [ ! -t 0 ]; then
    tmp="$(mktemp)"
    cat >"$tmp"
    if grep --extended-regexp ':\d+:' "$tmp" >/dev/null; then
      echo "$tmp" | xargs -o vim +copen -q
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

  cmd=$1
  shift

  case "$cmd" in

  R) vim README.md ;;
  dc) vim docker-compose.yml ;;
  di) vim .dockerignore ;;
  dk) vim Dockerfile ;;
  hosts) EDITOR=vim sudo --edit /etc/hosts "$@" ;;
  i)
    cmd="${1:-html}"
    shift
    case "$cmd" in
    c) cmd=css ;;
    h) cmd=html ;;
    j) cmd=jsx ;;
    t) cmd=tsx ;;
    esac
    vim "index.$cmd"
    ;;
  mk) vim Makefile ;;
  ns) vim server.js ;;
  pj) vim package.json ;;
  tor) vim ~/Library/Application\ Support/TorBrowser-Data/Tor/torrc ;;

  applescript | c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | jsx | lua | md | mdx | mw | nginx | pegjs | php | py | rs | scss | sh | sql | story | t | ts | tsx | txt | wat | xhtml | yaml | yml | zep)
    if [ -f "$cmd" ]; then
      vim "$cmd"
      return
    fi
    [ "$cmd" != 't' ] && cmd="$cmd.$cmd"
    z t_init
    vim "$(z t && echo "$PWD")/$cmd"
    ;;

  *) vim "$cmd" "$@" ;;

  esac
}
