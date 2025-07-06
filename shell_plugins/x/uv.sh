#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

uv() {
  # https://data.gov.tw/dataset/6076
  [ -f "${uv:=/tmp/x-uv-$(date +%H)-$(($(date +%M) / 3)).json}" ] ||
    curl 'https://data.moenv.gov.tw/api/v2/uv_s_01?language=zh&api_key=221974dd-667c-4243-b308-61b60bc29986&limit=1000&sort=datacreationdate%20desc&format=JSON' >"$uv"

  filter="$(
    cat <<'EOF'
.records |
map(select(.unit == "中央氣象署" and .uvi != "-999")) |
first.datacreationdate as $datacreationdate |
map(select(.datacreationdate == $datacreationdate)) |
map([.datacreationdate, .wgs84_lat, .wgs84_lon, .county, .sitename, .uvi]) |
sort | reverse |
.[] | @tsv |
.
EOF
  )"
  jq --raw-output --arg sitename "$X_UV_SITENAME" "$filter" <"$uv" | column -t | uniq | grep "^\|.*$X_UV_SITENAME.*"

  echo
  echo 'https://www.cwa.gov.tw/V8/C/W/OBS_UVI.html'
}

uv "$@"
