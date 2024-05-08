#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

tz() {
    cmd="$1"
    shift
    if [ "$cmd" = pdt ]; then
      cmd=PST8PDT
    elif [ "$cmd" = mdt ]; then
      cmd=MST7MDT
    elif [ "$cmd" = cdt ]; then
      cmd=CST6CDT
    elif [ "$cmd" = edt ]; then
      cmd=EST5EDT
    fi
    if [ -n "$cmd" ] && realpath -q "/usr/share/zoneinfo/$cmd" >/dev/null; then
      TZ="$cmd" "$@"
      return
    fi
    tz="$(cd /usr/share/zoneinfo && find ./* -type f -name '*[[:upper:]]*' ! -name +VERSION | sed 's#^./##')"
    if [ "$cmd" = 'date' ]; then
      # shellcheck disable=SC2016 # in sh -c
      tz="$(echo "$tz" | xargs -I{} sh -c 'printf "%s {}\n" "$(TZ={} date +%z)"')"
      echo "$tz" | grep '^-' | sort -r
      echo "$tz" | grep '^+' | sort
    else
      tz="$(echo "$tz" | sort)"
      echo "$tz" | grep /
      echo "$tz" | grep -v /
    fi
}

tz "$@"
