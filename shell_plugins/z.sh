#!/usr/bin/env sh

alias ..='z ..'

__z_t_tmp=''
z() {
  _z_cmd="${1:--}"
  shift
  case "$_z_cmd" in

  ...) cd ../.. ;;

  ....) cd ../../.. ;;

  d) cd ~/Downloads || return ;;

  e)
    case "$1" in
    e) set -- /elixir ;;
    p) set -- /python ;;
    esac
    cd "$HOME/Exercism$*" || return
    ;;

  e2) z e e ;;

  g) cd ~/git || return ;;

  gh)
    case "$1" in
    r) set -- /remotelytw ;;
    s) set -- /sharils ;;
    esac
    cd "$HOME/git/github.com$*" || return
    ;;

  gl) cd ~/git/gitlab.com || return ;;

  h) cd "$SHARILS_HOME" || return ;;

  s)
    case "$1" in
    c) set -- /Camera ;;
    k) set -- /KeePass ;;
    l) set -- /Libera\ PRO ;;
    esac
    cd "$HOME/Sync$*" || return
    ;;

  ssh) cd ~/.ssh || return ;;

  st) cd "$TODO_DIR" || return ;;

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
