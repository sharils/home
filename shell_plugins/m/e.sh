#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  if [ $# -eq 0 ]; then
    $EDITOR mix.exs
    return
  fi
  case "$1" in
  R) shift && mix ecto.reset "$@" ;;
  c) shift && mix ecto.create "$@" ;;
  m)
    shift
    case "$1" in
    g) shift && mix ecto.gen.migration "$@" ;;
    ls) shift && mix ecto.migrations "$@" ;;
    *) mix ecto.migrate --log-migrations-sql --log-migrator-sql "$@" ;;
    esac
    ;;
  r)
    shift
    case "$1" in
    a) shift && set -- --all "$@" ;;
    esac
    mix ecto.rollback "$@"
    ;;
  u) mix run --eval 'Ecto.UUID.generate() |> IO.write()' | tr -d \\n | pbcopy && pbpaste ;;
  *)
    tmp="$(mktemp)"
    grep --line-number --with-filename "$1" mix.exs >"$tmp"
    vim -q "$tmp"
    ;;
  esac
}

e "$@"
