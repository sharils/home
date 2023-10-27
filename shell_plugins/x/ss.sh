#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ss() {
  # tw geo center
  lat='23.973874'
  lng='120.982024'

  date="$(date +%F)"
  json="/tmp/api.sunrise-sunset.org.$date.json"
  [ -f "$json" ] ||
    curl --get --location 'https://api.sunrise-sunset.org/json' \
      --data 'formatted=0' \
      --data "date=$date" \
      --data "lat=$lat" \
      --data "lng=$lng" \
      >"$json"

  jq <"$json" -r --arg 'date' "$date" "$(
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
  )" | column -t
}

ss "$@"
