#!/usr/bin/env bash

[ -n "$SET_X" ] && set -x

k() {
  case "$1" in

  %) shift && "$SHARILS_HOME/shell_plugins/k/%.sh" "$@" ;;

  0d) "$SHARILS_HOME/shell_plugins/k/0d.sh" "$@" ;;

  0x) "$SHARILS_HOME/shell_plugins/k/0x.sh" "$@" ;;

  6.3) shift && "$SHARILS_HOME/shell_plugins/k/6.3.sh" "$@" ;;

  a4) shift && "$SHARILS_HOME/shell_plugins/k/a4.sh" "$@" ;;

  android) shift && "$SHARILS_HOME/shell_plugins/k/android.sh" "$@" ;;

  b) shift && "$SHARILS_HOME/shell_plugins/k/b.sh" "$@" ;;

  bind) shift && "$SHARILS_HOME/shell_plugins/k/bind.sh" "$@" ;;

  brew) shift && "$SHARILS_HOME/shell_plugins/k/brew.sh" "$@" ;;

  burnout) shift && "$SHARILS_HOME/shell_plugins/k/burnout.sh" "$@" ;;

  cie) shift && "$SHARILS_HOME/shell_plugins/k/cie.sh" "$@" ;;

  circadian) shift && "$SHARILS_HOME/shell_plugins/k/circadian.sh" "$@" ;;

  credit-card) shift && "$SHARILS_HOME/shell_plugins/k/credit-card.sh" "$@" ;;

  curl) shift && "$SHARILS_HOME/shell_plugins/k/curl.sh" "$@" ;;

  d) shift && "$SHARILS_HOME/shell_plugins/k/d.sh" "$@" ;;

  ddx) shift && "$SHARILS_HOME/shell_plugins/k/ddx.sh" "$@" ;;

  dr) shift && "$SHARILS_HOME/shell_plugins/k/dr.sh" "$@" ;;

  e) $EDITOR "$@" ~/.config/karabiner/karabiner.json ;;

  fib) shift && "$SHARILS_HOME/shell_plugins/k/fib.sh" "$@" ;;

  font) shift && "$SHARILS_HOME/shell_plugins/k/font.sh" "$@" ;;

  g) shift && "$SHARILS_HOME/shell_plugins/k/g.sh" "$@" ;;

  geneva) shift && "$SHARILS_HOME/shell_plugins/k/geneva.sh" "$@" ;;

  gh) shift && l 'https://docs.github.com/en/get-started/using-github/keyboard-shortcuts#site-wide-shortcuts' ;;

  ha) shift && "$SHARILS_HOME/shell_plugins/k/ha.sh" "$@" ;;

  heptagram) shift && "$SHARILS_HOME/shell_plugins/k/heptagram.sh" "$@" ;;

  http) shift && "$SHARILS_HOME/shell_plugins/k/http.sh" "$@" ;;

  id) shift && "$SHARILS_HOME/shell_plugins/k/id.sh" "$@" ;;

  id1) shift && "$SHARILS_HOME/shell_plugins/k/id1.sh" "$@" ;;

  med) shift && "$SHARILS_HOME/shell_plugins/k/med.sh" "$@" ;;

  manifesto) shift && "$SHARILS_HOME/shell_plugins/k/manifesto.sh" "$@" ;;

  messages) shift && "$SHARILS_HOME/shell_plugins/k/messages.sh" "$@" ;;

  n) shift && "$SHARILS_HOME/shell_plugins/k/n.sh" "$@" ;;

  napkin) shift && "$SHARILS_HOME/shell_plugins/k/napkin.sh" "$@" ;;

  nightingale) shift && "$SHARILS_HOME/shell_plugins/k/nightingale.sh" "$@" ;;

  o) shift && "$SHARILS_HOME/shell_plugins/k/o.sh" "$@" ;;

  pareto) shift && "$SHARILS_HOME/shell_plugins/k/pareto.sh" "$@" ;;

  port) "$SHARILS_HOME/shell_plugins/k/port.sh" "$@" ;;

  posix) echo '#%+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  prime) shift && "$SHARILS_HOME/shell_plugins/k/prime.sh" "$@" ;;

  printable) shift && "$SHARILS_HOME/shell_plugins/k/printable.sh" "$@" ;;

  quality) shift && "$SHARILS_HOME/shell_plugins/k/quality.sh" "$@" ;;

  # safe = posix & uri
  safe) echo '-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  stat) shift && stat -x ~/Sync/KeePass/keepass.kdbx ;;

  twba) shift && "$SHARILS_HOME/shell_plugins/k/twba.sh" "$@" ;;

  u) shift && "$SHARILS_HOME/shell_plugins/k/u.sh" "$@" ;;

  uri) echo "!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~" ;;

  vet) shift && "$SHARILS_HOME/shell_plugins/k/vet.sh" "$@" ;;

  week) shift && "$SHARILS_HOME/shell_plugins/k/week.sh" "$@" ;;

  yue) shift && "$SHARILS_HOME/shell_plugins/k/yue.sh" "$@" ;;

  zip)
    shift
    z t_init
    dir="$(z t && echo "$PWD")"
    cd "$dir" || return $?
    path="$(k b)"
    printf %s "$*" > "$path"
    zip -er "$path.zip" "$path"
    rm "$path"
    cd - || return $?
    printf %s "$dir/$path.zip" | pbcopy
    ;;

  esac
}
