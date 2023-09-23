#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

fx() {
  if [ $# -ne 0 ]; then
    fx | grep --ignore-case --color=never "$1"
    return
  fi
  cmd="$HOME/git/github.com/sharils/~sinopac/$(d F).json"
  [ ! -f "$cmd" ] && curl 'https://mma.sinopac.com/ws/share/rate/ws_exchange.ashx' >"$cmd"
  jq '([first.TitleInfo|splits("<.*?>")]|map(select(.!=""))[0][5:]|sub(" "; "T")) as $date|first.SubInfo|sort_by(.DataValue4)|map([$date,.DataValue4,.DataValue2,.DataValue3]|@tsv)[]' -r <"$cmd" | column -t
}

fx "$@"
