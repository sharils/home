#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://pm25.lass-net.org/
airbox() {
  airbox="/tmp/x-airbox-airbox-$(date -jf%s $(($(date +%s) / 300 * 300)) +%FT%T).json"
  [ -f "$airbox" ] || curl https://pm25.lass-net.org/data/last-all-airbox.json.gz | gunzip >"$airbox"

  descriptions='/tmp/x-airbox-descriptions.json'
  [ -f "$descriptions" ] || curl "$(jq --raw-output '.descriptions.URL' <"$airbox")" >"$descriptions"

  filter="$(
    cat <<'JQ'
    .feeds |= (
      map(
        select(.SiteName == $ARGS.named.SiteName)
      ) |
      map(
        to_entries |
        map(
          .key as $key |
          .key |= ($descriptions[0][$key] // .)
        ) |
        from_entries
      )
    )
JQ
  )"
  jq <"$airbox" --raw-output --arg SiteName "$X_AIRBOX" --slurpfile descriptions "$descriptions" "$filter"
}

airbox "$@"
