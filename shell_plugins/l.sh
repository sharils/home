#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    LESS="$LESS --quit-if-one-screen" b "${@:-man}" --style=plain
    return
  fi

  if [ $# -eq 1 ] && [ -f "$1" ]; then
    LESS="$LESS --quit-if-one-screen" b "$@" --style=plain
    return
  fi

  if echo "$1" | g uri >/dev/null; then
    lynx "$@"
    return
  fi

  cmd="$1"
  shift
  case "$cmd" in
  '') lsd ;;
  -*) lsd "$cmd" "$@" ;;
  F) less +F "$@" ;;
  b) l x "https://search.brave.com/search?q=$*" ;;
  dg) l x "https://lite.duckduckgo.com/lite/?q=$*" ;;
  g) l x "https://www.google.com/search?client=firefox-b-d&gbv=1&q=$*" ;;
  pl) l x "https://lite.duckduckgo.com/lite/?q=site%3Avald-phoenix.github.io%20$*" ;;
  od) l x "https://www.oxfordlearnersdictionaries.com/definition/english/$*_1" ;;
  pep) l x "https://peps.python.org/pep-$(printf "%04d" "$*")/" ;;
  rfc)
    if [ $# -eq 0 ]; then
      cat <<'EOF'
2119 RFC Key Words
5424 The Syslog Protocol
6570 URI Template
9110 HTTP Semantics
9111 HTTP Caching
9112 HTTP/1.1
severity Syslog Message Severities
EOF
      return
    fi
    case "$1" in
    severity) set -- "5424#page-11" ;;
    esac
    l x "https://www.rfc-editor.org/rfc/rfc$*"
    ;;
  s) less "$@" ;;
  t) l --tree "$@" ;;
  wk) l x "https://en.wiktionary.org/wiki/$*#Esperanto" ;;
  wp) l x "https://en.wikipedia.org/wiki/Special:Search?go=Go&ns0=1&search=$*" ;;
  wz) l x "https://zh.wikipedia.org/wiki/$*" ;;
  x) lynx "$@" ;;
  *)
    if [ -e "$cmd" ]; then
      lsd "$cmd" "$@"
    else
      l -"$cmd" "$@"
    fi
    ;;
  esac
}
