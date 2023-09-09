#!/usr/bin/env sh

alias ..='z .'

__z_t_tmp=''
z() {
  _z_cmd="${1:--}"
  shift
  case "$_z_cmd" in

  .)
    shift
    set -- "$(dirname "$PWD")"
    while [ "$1" != '/' ]; do
      set -- "$(dirname "$1")" "$@"
    done
    path="$(echo "$PWD" "$@" | tr ' ' \\n | fzf --tac)"
    [ -n "$path" ] && z "$path"
    ;;

  d) cd "$HOME/Downloads" || return ;;

  e) shift && "$SHARILS_HOME/shell_plugins/z/e.sh" "$@" ;;

  e2) z e e ;;

  g) cd ~/git || return ;;

  gh) shift && "$SHARILS_HOME/shell_plugins/z/gh.sh" "$@" ;;

  gl) cd "$HOM#/git/gitlab.com" || return ;;

  h) cd "$SHARILS_HOME" || return ;;

  p) cd "$(pbpaste)" || return $? ;;

  s) shift && "$SHARILS_HOME/shell_plugins/z/s.sh" "$@" ;;

  ssh) cd ~/.ssh || return ;;

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

  v) shift && "$SHARILS_HOME/shell_plugins/z/v.sh" "$@" ;;

  ~t) cd ~/tmp || return ;;

  *) __zoxide_z "$_z_cmd" "$@" ;;

  esac
  unset -v _z_cmd
}
