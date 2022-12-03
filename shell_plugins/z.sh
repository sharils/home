#!/usr/bin/env sh

__z_t_tmp=''
z() {
  _z_cmd="${1:--}"
  shift
  case "$_z_cmd" in

  ...) cd ../.. ;;

  ....) cd ../../.. ;;

  d) cd ~/Downloads || return ;;

  g) cd ~/git || return ;;

  gh) cd ~/git/github.com || return ;;

  s) cd ~/Sync || return ;;

  sc) cd ~/Sync/Camera || return ;;

  ssh) cd ~/.ssh || return ;;

  st) cd ~/Sync/todo || return ;;

  t)
    z t_init
    if [ $# -eq 0 ]; then
      dir="$__z_t_tmp"
    elif [ $# -ne 0 ]; then
      dir="$__z_t_tmp/$*"
      mkdir -p "$dir"
    fi
    cd "$dir" || return
    ;;

  t_init) [ ! -d "$__z_t_tmp" ] && __z_t_tmp="$(mktemp -d "/tmp/$USER-$(date +%m%d)-XXXXXX")" ;;

  ~t) cd ~/tmp || return ;;

  *) __zoxide_z "$_z_cmd" "$@" ;;

  esac
  unset -v _z_cmd
}
