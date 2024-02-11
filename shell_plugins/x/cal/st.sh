#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

st() {
  case "$1" in
  *) set -- ^ "$@" ;;
  esac
  # https://data.gov.tw/dataset/157677
  [ -f "${st:=/tmp/x-cal-st-$(date +%Y).csv}" ] ||
    curl --location 'https://opendata.cwa.gov.tw/fileapi/v1/opendataapi/A-A0087-003?Authorization=rdec-key-123-45678-011121314&format=CSV' >"$st"
  yq @json "$st" | jq --raw-output --arg TODAY "$(date +%F)" "$(
    cat <<'JQ'
      map(select(.["節氣"] | type == "string")) |
      map(select($ARGS.named.TODAY <= .["格里曆日期"])) |
      map([.["格里曆日期"], .["節氣時分"], .["節氣"]])[] |
      @tsv
JQ
  )" |
    while IFS= read -r line; do
      d="$(echo "$line" | cut -f1)"
      echo "$line $(date -jf%F "$d" +%a)"
    done |
    column -t |
    grep "$@"
}

st "$@"
