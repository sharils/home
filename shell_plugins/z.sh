#!/usr/bin/env sh

__z_t_tmp=''
z() {
  cmd="${1:--}"
  shift
  case "$cmd" in

  ...) cd ../.. ;;

  ....) cd ../../.. ;;

  d) cd ~/Downloads || return ;;

  s) cd ~/Sync || return ;;

  sc) cd ~/Sync/Camera || return ;;

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
