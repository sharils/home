#!/usr/bin/env sh

e() {
  which exercism >/dev/null && case "$PWD" in
  "$(exercism workspace)"/*)
    case "$1" in
    ex) v -O README.md ./**/*.ex && return $? ;;

    h) shift && set -- help "$@" ;;

    o)
      dir="$(dirname "$PWD")"
      base="https://exercism.org/tracks/${dir##*/}/exercises/${PWD##*/}"
      b f x b "$base" "$base/solutions"
      return $?
      ;;

    py) v -O README.md ./*.py && return $? ;;
    esac
    exercism "$@"
    return $?
    ;;
  esac

  case "${1:-edit}" in

  e)
    shift
    [ "$1" = e ] && shift && set -- emoji "$@"
    e edit "${@:-base}"
    ;;

  h) shift && e --eval "require IEx.Helpers; IEx.Helpers.h($*)" | l md ;;

  l) shift && e log "$@" ;;

  s)
    shift
    case "$1" in
    R) shift && set -- register "$@" ;;
    r) shift && set -- restart "$@" ;;
    s) shift && set -- start "$@" ;;
    esac
    e service "${@:-status}"
    ;;

  edit | log | service) espanso "$@" ;;

  *) elixir "$@" ;;

  esac
}
