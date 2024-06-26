#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://pm25.lass-net.org/
aq() {
  if [ $# -eq 0 ]; then
    set -- w "$@"
  fi

  case "$1" in
  json)
    : "${X_AQ:?}"
    airbox="/tmp/x-aq-airbox-$(date -jf%s $(($(date +%s) / 368 * 368)) +%FT%T).json"
    [ -f "$airbox" ] || curl -s https://pm25.lass-net.org/data/last-all-airbox.json.gz | gunzip >"$airbox"

    descriptions='/tmp/x-aq-descriptions.json'
    [ -f "$descriptions" ] || curl "$(jq --raw-output '.descriptions.URL' <"$airbox")" >"$descriptions"

    filter="$(
      cat <<'JQ'
      .feeds |= (
        map(select(.device_id == $ARGS.named.device_id)) |
        map(to_entries) |
        map(
          map(
            .key as $key |
            .key |= ($descriptions[0][$key] // .)
          )
        ) |
        map(from_entries)
      )
JQ
    )"
    jq <"$airbox" --raw-output --arg device_id "$X_AQ" --slurpfile descriptions "$descriptions" "$filter"
    ;;

  w)
    shift
    op="${1:-lt}"
    printf 'https://v5.airmap.g0v.tw/#/map\n'
    printf 'https://pm25.lass-net.org/grafana/d/airbox_dashboard_v3/airdata?orgId=2&var-source=AirBox&var-device_id=%s&refresh=1m\n' "$X_AQ" >&2

    while :; do
      json="$(aq json | jq --raw-output "$(
        cat <<'EOF'
        .feeds[0] | [
          (.["PM1 (ug/m3)"] | round),
          (.["PM2.5 (ug/m3)"] | round),
          (.["PM10 (ug/m3)"] | round),
          .timestamp
        ] |
        @tsv
EOF
      )")"
      pm1="$(echo "$json" | cut -f1)"
      pm25="$(echo "$json" | cut -f2)"
      pm10="$(echo "$json" | cut -f3)"
      timestamp="$(echo "$json" | cut -f4 | sed 's/Z$/+0000/')"
      pm="$(printf "%s %s %s %s\n" "$pm1" "$pm25" "$pm10" "$(date -jf%FT%T%z "$timestamp" +%T)" | tee /dev/stderr)"
      sh -c "[ $pm25 -$op 20 ]" && printf 'display notification "%s" with title "%s"' "$pm" 'x airbox w' | osascript
      sleep 300
    done
    ;;
  esac
}

aq "$@"
