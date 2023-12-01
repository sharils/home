#!/usr/bin/env bash

[ -n "$SET_X" ] && set -x

k() {
  case "$1" in

  %) shift && "$SHARILS_HOME/shell_plugins/k/%.sh" "$@" ;;

  0d) "$SHARILS_HOME/shell_plugins/k/0d.sh" "$@" ;;

  0x) "$SHARILS_HOME/shell_plugins/k/0x.sh" "$@" ;;

  b) shift && "$SHARILS_HOME/shell_plugins/k/b.sh" "$@" ;;

  bind) shift && "$SHARILS_HOME/shell_plugins/k/bind.sh" "$@" ;;

  credit-card) shift && "$SHARILS_HOME/shell_plugins/k/credit-card.sh" "$@" ;;

  curl) shift && "$SHARILS_HOME/shell_plugins/k/curl.sh" "$@" ;;

  d) shift && "$SHARILS_HOME/shell_plugins/k/d.sh" "$@" ;;

  e) $EDITOR "$@" ~/.config/karabiner/karabiner.json ;;

  g) shift && "$SHARILS_HOME/shell_plugins/k/g.sh" "$@" ;;

  gh) shift && l 'https://docs.github.com/en/get-started/using-github/keyboard-shortcuts#site-wide-shortcuts' ;;

  http) shift && "$SHARILS_HOME/shell_plugins/k/http.sh" "$@" ;;

  id) shift && "$SHARILS_HOME/shell_plugins/k/id.sh" "$@" ;;

  n) shift && "$SHARILS_HOME/shell_plugins/k/n.sh" "$@" ;;

  port) "$SHARILS_HOME/shell_plugins/k/port.sh" "$@" ;;

  posix) echo '#%+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  printable) shift && "$SHARILS_HOME/shell_plugins/k/printable.sh" "$@" ;;

  # safe = posix & uri
  safe) echo '-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  stat) shift && stat -x ~/Sync/KeePass/keepass.kdbx ;;

  u) shift && sed -n '3527,3842p' /Applications/qutebrowser.app/Contents/Resources/qutebrowser/config/configdata.yml | grep "$*" ;;

  uri) echo "!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~" ;;

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
