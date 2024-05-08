#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

set -x
eq() {
  # https://data.gov.tw/dataset/6068
  # https://opendata.cwa.gov.tw/dist/opendata-swagger.html#/%E5%9C%B0%E9%9C%87%E6%B5%B7%E5%98%AF/get_v1_rest_datastore_E_A0015_002
  json='/tmp/eq.json'
  curl "https://opendata.cwa.gov.tw/api/v1/rest/datastore/E-A0015-001?Authorization=rdec-key-123-45678-011121314&limit=1" >"$json"

  jq <"$json" "$(
    cat <<'JQ'
.records.Earthquake[0] |
.Intensity.ShakingArea |= (
  map(select(.EqStation == [])) |
  sort_by(.AreaIntensity) |
  reverse
)
JQ
  )" | bat --language json --style=plain
}

eq "$@"
