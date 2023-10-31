#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://pm25.lass-net.org/
airbox() {
  json="/tmp/last-all-airbox-$(date -jf%s $(($(date +%s) / 300 * 300)) +%FT%T).json"
  [ -f "$json" ] || curl https://pm25.lass-net.org/data/last-all-airbox.json.gz | gunzip >"$json"
  filter="$(
    cat <<'JQ'
      .feeds |= map(select(.SiteName == $ARGS.named.SiteName))
JQ
  )"
  jq <"$json" --raw-output --arg SiteName "$X_AIRBOX" "$filter"
}

airbox "$@"
