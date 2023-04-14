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

  case "$1" in
  '') lsd ;;
  -*) shift && lsd "$1" "$@" ;;
  F) shift && less +F "$@" ;;
  b) shift && l x "https://search.brave.com/search?q=$*" ;;
  cctld) shift && l x 'https://en.wikipedia.org/wiki/Template:CcTLD#bodyContent' ;;
  d) shift && l x "https://lite.duckduckgo.com/lite/?q=$*" ;;
  g) shift && l x "https://www.google.com/search?client=firefox-b-d&gbv=1&q=$*" ;;
  node)
    shift
    if [ $# -gt 0 ]; then
      set -- "$*.html"
    fi
    l x "https://nodejs.org/dist/latest-v18.x/docs/api/$*"
    ;;
  od) shift && l x "https://www.oxfordlearnersdictionaries.com/definition/english/$*_1" ;;
  pep) shift && l x "https://peps.python.org/pep-$(printf "%04d" "$*")/" ;;
  pl) shift && l x "https://lite.duckduckgo.com/lite/?q=site%3Avald-phoenix.github.io%20$*" ;;
  port) shift && l x 'https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Registered_ports' ;;
  rfc)
    shift
    if [ $# -eq 0 ]; then
      cat <<'EOF'
2119 RFC Key Words
2441 Working with Jon
2468 I Remember IANA
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
  s) shift && less "$@" ;;
  t) shift && l --tree "$@" ;;
  wk) shift && l x "https://en.wiktionary.org/wiki/$*#Esperanto" ;;
  wp) shift && l x "https://en.wikipedia.org/wiki/Special:Search?go=Go&ns0=1&search=$*" ;;
  wz) shift && l x "https://zh.wikipedia.org/wiki/$*" ;;
  x) shift && lynx "$@" ;;
  *)
    shift
    if [ -e "$1" ]; then
      lsd "$1" "$@"
    else
      l -"$1" "$@"
    fi
    ;;
  esac
}
