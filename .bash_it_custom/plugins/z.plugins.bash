#!/usr/bin/env sh

temp=''
z() {
  cmd="$1"
  shift

  case "$cmd" in

  dl) cd ~/Downloads || return ;;

  t)
    if [ $# -ne 0 ]; then
      [ ! -d "$temp" ] && temp="$(mktemp -d "/tmp/$*-$USER-XXXXXX")"
      dir="$temp"
    fi
    cd "${dir:-/tmp}" || return
    ;;

  ~t) cd ~/tmp || return ;;

  *) __zoxide_z "$cmd" "$@" ;;

  esac
}
