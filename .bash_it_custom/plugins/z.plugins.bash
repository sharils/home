#!/usr/bin/env sh

__z_t_tmp=''
z() {
  if [ $# -eq 0 ]; then
    cd - || return
  fi

  cmd="$1"
  shift

  case "$cmd" in

  dl) cd ~/Downloads || return ;;

  ssh) cd ~/.ssh || return ;;

  t)
    [ ! -d "$__z_t_tmp" ] && __z_t_tmp="$(mktemp -d "/tmp/$USER-$(date +%m%d)-XXXXXX")"
    if [ $# -eq 0 ]; then
      dir="$__z_t_tmp"
    elif [ $# -ne 0 ]; then
      dir="$__z_t_tmp/$*"
      mkdir -p "$dir"
    fi
    cd "$dir" || return
    ;;

  ~t) cd ~/tmp || return ;;

  *) __zoxide_z "$cmd" "$@" ;;

  esac
}
