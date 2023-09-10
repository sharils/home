#!/usr/bin/env sh

e() {
  which exercism >/dev/null && case "$PWD" in
  "$(exercism workspace)"/*)
    case "$1" in
    ex) v -O README.md ./**/*.ex && return $? ;;

    rs) v -O README.md ./**/*.rs && return $? ;;

    h) exercism help "$@" && return $? ;;

    o)
      dir="$(dirname "$PWD")"
      base="https://exercism.org/tracks/${dir##*/}/exercises/${PWD##*/}"
      b f x b "$base" "$base/solutions"
      return $?
      ;;

    py) v -O README.md ./*.py && return $? ;;

    # c | d | p | t | debug | u | v | w
    configure | download | help | open | prepare | s | submit | troubleshoot | upgrade | version | workspace) exercism "$@" && return $? ;;
    esac
    ;;
  esac

  case "${1:-edit}" in

  e)
    shift
    [ "$1" = e ] && shift && set -- emoji "$@"
    e edit "${@:-base}"
    ;;

  g) shift && "$SHARILS_HOME/shell_plugins/e/g.sh" "$@" ;;

  l) shift && e log "$@" ;;

  wc) shift && "$SHARILS_HOME/shell_plugins/e/wc.sh" "$@" ;;

  edit | log | service) espanso "$@" ;;

  *) elixir "$@" ;;

  esac
}
