#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ss() {
  # tw geo center
  lat='23.973874'
  lng='120.982024'

  tomorrow="$(date -v+1d +%F)"
  json="/tmp/api.sunrise-sunset.org.$tomorrow.json"
  [ -f "$json" ] ||
    curl --get --location 'https://api.sunrise-sunset.org/json' \
      --data 'formatted=0' \
      --data "date=$tomorrow" \
      --data "lat=$lat" \
      --data "lng=$lng" \
      >"$json"

  filter="$(
    cat <<'JQ'
      .results |
      to_entries |
      sort_by(.value) |
      map(
        if .key == "day_length" then .
        else .value |= $ARGS.named.date + "T" + (
          gsub("\\+00:00"; "Z") |
          fromdateiso8601 |
          strflocaltime("%T")
        )
        end
      ) |
      from_entries |
      .source |= "https://sunrise-sunset.org/api" |
      to_entries |
      map([.key, .value])[] |
      @tsv
JQ
  )"

  sunrise_sunset="$(jq <"$json" --raw-output --arg 'date' "$tomorrow" "$filter")"

  if [ $# -eq 0 ]; then
    echo "$sunrise_sunset" | column -t
    return $?
  fi
  echo "$sunrise_sunset" | grep "$1" | cut -f2
}

ss "$@"
