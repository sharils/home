#!/usr/bin/env sh

v() {
  if [ ! -t 0 ]; then
    tmp="$(mktemp)"
    cat >"$tmp"
    if grep --extended-regexp ':\d+:' "$tmp" >/dev/null; then
      set -- -q
      [ "$(wc -l <"$tmp")" -ge 2 ] && set -- +copen "$@"
      echo "$tmp" | xargs -o vim "$@"
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

  e) shift && "$SHARILS_HOME/shell_plugins/v/e.sh" "$@" ;;

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
  mj) vim manifest.json ;;
  mk) vim Makefile ;;
  rm) shift && "$SHARILS_HOME/shell_plugins/v/rm.sh" "$@" ;;
  tor) vim ~/Library/Application\ Support/TorBrowser-Data/Tor/torrc ;;

  v) shift && "$SHARILS_HOME/shell_plugins/v/v.sh" "$@" ;;

  applescript | c | css | csv | eex | erl | ex | exs | feature | gql | html | java | jq | js | json | jsx | lua | md | mdx | mmd | mw | nginx | pegjs | php | proto | py | rs | scss | sh | sql | story | t | ts | tsx | txt | wat | xhtml | yaml | yml | zep)
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
