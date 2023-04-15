#!/usr/bin/env sh

currency() {
  unset -v lang loc
  loc="$(locale -a)"
  lang="${lang:="$(echo "$loc" | grep --ignore-case "^.._$1$")"}"
  lang="${lang:="$(echo "$loc" | grep --ignore-case "^$(echo "$1" | sed 's/^\(..\)\(..\)$/\1_\2/')$")"}"
  lang="${lang:="$(echo "$loc" | grep "^${1}_..$")"}"
  lang="${lang:="$([ "$1" = 'en' ] && echo en_CA || echo '')"}"
  shift
  LC_ALL="$lang.UTF-8" "$@"
}

currency "$@"
