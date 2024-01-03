#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

alias ...='z .'

__z_t_tmp=''
z() {
  case "${1:--}" in

  .)
    shift 2
    tmp="$(mktemp)"
    path="$(dirname "$PWD")"
    while [ "$path" != '/' ]; do
      echo "$path" >>"$tmp"
      path="$(dirname "$path")"
    done
    pwd >>"$tmp"
    cat "$tmp"
    path="$(fzf <"$tmp")"
    [ -n "$path" ] && z "$path"
    ;;

  -) cd - || return $? ;;

  d) shift && cd "$HOME/Downloads" || return ;;

  e) shift && cd "$("$SHARILS_HOME/shell_plugins/z/e.sh" "$@")" || return $? ;;

  e2) shift && z e e ;;

  g) shift && cd "$HOME/git" || return ;;

  gh) shift && cd "$("$SHARILS_HOME/shell_plugins/z/gh.sh" "$@")" || return $? ;;

  gl) shift && cd "$HOM#/git/gitlab.com" || return ;;

  h) shift && cd "$("$SHARILS_HOME/shell_plugins/z/h.sh" "$@")" || return ;;

  p) shift && cd "$(pbpaste)" || return $? ;;

  s) shift && cd "$("$SHARILS_HOME/shell_plugins/z/s.sh" "$@")" || return $? ;;

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

  v) shift && cd "$("$SHARILS_HOME/shell_plugins/z/v.sh" "$@")" || return $? ;;

  ~t) shift && cd "$HOME/tmp" || return ;;

  *) __zoxide_z "$@" ;;

  esac
}
