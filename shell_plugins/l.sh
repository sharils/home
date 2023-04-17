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
  -*) shift && lsd "$@" ;;
  F) shift && less +F "$@" ;;
  b) shift && l x "https://search.brave.com/search?q=$*" ;;
  d) shift && l x "https://lite.duckduckgo.com/lite/?q=$*" ;;
  g) shift && l x "https://www.google.com/search?client=firefox-b-d&gbv=1&q=$*" ;;
  node) shift && "$SHARILS_HOME/shell_plugins/l/node.sh" "$@" ;;
  od) shift && l x "https://www.oxfordlearnersdictionaries.com/definition/english/$*_1" ;;
  pep) shift && l x "https://peps.python.org/pep-$(printf "%04d" "$*")/" ;;
  pl) shift && l x "https://lite.duckduckgo.com/lite/?q=site%3Avald-phoenix.github.io%20$*" ;;
  port) shift && l x 'https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Registered_ports' ;;
  rfc) shift && "$SHARILS_HOME/shell_plugins/l/rfc.sh" "$@" ;;
  s) shift && less "$@" ;;
  t) shift && l --tree "$@" ;;
  tld) shift && l x 'https://en.wikipedia.org/wiki/Template:CcTLD#bodyContent' ;;
  trpl) shift && l x "file://$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/share/doc/rust/html/book/index.html" "$@" ;;
  wk) shift && l x "https://en.wiktionary.org/wiki/$*#Esperanto" ;;
  wp) shift && l x "https://en.wikipedia.org/wiki/Special:Search?go=Go&ns0=1&search=$*" ;;
  wz) shift && l x "https://zh.wikipedia.org/wiki/$*" ;;
  x) shift && lynx "$@" ;;
  *)
    if [ $# -eq 0 ]; then
      lsd
    elif [ -e "$1" ]; then
      lsd "$@"
    else
      cmd="$1" && shift
      l -"$cmd" "$@"
    fi
    ;;
  esac
}
