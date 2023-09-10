#!/usr/bin/env sh

alias ..='z .'

__z_t_tmp=''
z() {
  case "${1:--}" in

  .)
    shift 2
    set -- "$(dirname "$PWD")"
    while [ "$1" != '/' ]; do
      set -- "$(dirname "$1")" "$@"
    done
    path="$(echo "$PWD" "$@" | tr ' ' \\n | fzf --tac)"
    [ -n "$path" ] && z "$path"
    ;;

  d) shift && cd "$HOME/Downloads" || return ;;

  e) shift && "$SHARILS_HOME/shell_plugins/z/e.sh" "$@" ;;

  e2) shift && z e e ;;

  g) shift && cd "$HOME/git" || return ;;

  gh) shift && "$SHARILS_HOME/shell_plugins/z/gh.sh" "$@" ;;

  gl) shift && cd "$HOM#/git/gitlab.com" || return ;;

  h) shift && cd "$SHARILS_HOME" || return ;;

  p) shift && cd "$(pbpaste)" || return $? ;;

  s) shift && "$SHARILS_HOME/shell_plugins/z/s.sh" "$@" ;;

  ssh) shift && cd "$HOME/.ssh" || return ;;

  t)
    shift
    z t_init
    if [ $# -eq 0 ]; then
      dir="$__z_t_tmp"
    elif [ $# -ne 0 ]; then
      dir="$__z_t_tmp/$*"
      mkdir -p "$dir"
    fi
    cd "$dir" || return
    ;;

  t_init) shift && [ ! -d "$__z_t_tmp" ] && __z_t_tmp="$(mktemp -d "/tmp/$USER-$(date +%m%d)-XXXXXX")" ;;

  v) shift && "$SHARILS_HOME/shell_plugins/z/v.sh" "$@" ;;

  ~t) shift && cd "$HOME/tmp" || return ;;

  *) __zoxide_z "$@" ;;

  esac
}
