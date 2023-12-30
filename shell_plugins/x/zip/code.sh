#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

code() {
  # https://data.gov.tw/dataset/5948
  [ -f "${zip_code:=/tmp/x-zip-code-$(date +%Y).json}" ] ||
    curl 'https://quality.data.gov.tw//dq_download_json.php?nid=5948&md5_url=e1f6004ad33eb3ff3a824fb992a4b01a' >"$zip_code"
  administrative_division="$1" && shift
  townships_cities_districts="$1" && shift
  road="$(echo "$1" | tr '0123456789' '０１２３４５６７８９')" && shift
  jq <"$zip_code" "$(
    cat <<'JQ'
map(select(.["縣市名稱"] == $ARGS.positional[0])) |
map(select(.["鄉鎮市區"] == $ARGS.positional[1])) |
map(select(.["原始路名"] | contains($ARGS.positional[2]))) |
sort_by(.["郵遞區號"]) |
map([.["郵遞區號"], .["縣市名稱"], .["鄉鎮市區"], .["原始路名"], .["投遞範圍"]]) |
.[] | @tsv
JQ
  )" --raw-output --args "$administrative_division" "$townships_cities_districts" "$road"
}

code "$@"
