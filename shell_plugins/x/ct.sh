#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# Default to 南投縣 for geographic center
ct() {
  [ -f /tmp/A-B0062-001.json ] || curl --location 'https://opendata.cwa.gov.tw/fileapi/v1/opendataapi/A-B0062-001?Authorization=rdec-key-123-45678-011121314&format=JSON' >/tmp/A-B0062-001.json

  # shellcheck disable=SC2016
  jq \
    --arg CountyName "${1:-南投縣}" \
    --arg Today "${2:-$(date +%F)}" \
    --arg Tomorrow "${2:-$(date -v+1d +%F)}" \
    "$(cat <<'JQ'
.cwaopendata.dataset.location[] |
select(."CountyName" == $ARGS.named.CountyName) |
.time |= map(
  select(
    .Date == $ARGS.named.Today or .Date == $ARGS.named.Tomorrow
  )
)
JQ
)" \
    /tmp/A-B0062-001.json |
    bat --language json --style=plain
}

ct "$@"
