#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

law() {
  if [ $# -eq 0 ]; then
    echo 'not implemented' >&2
    return
  fi

  # https://data.gov.tw/dataset/18289
  src='https://sendlaw.moj.gov.tw/PublicData/GetFile.ashx?DType=XML&AuData=CF'

  dest="/tmp/x-law-$(date +%Y-%m)"
  zip="$dest.zip"
  [ -f "$zip" ] || {
    curl --get --location "$src" >"$dest.zip"
    unzip "$zip" -d "$dest"
  }
  xml="$(ls /tmp/x-law-2023-11/*.xml)"

  # yq --output-format=json "$xml" | jq '.LAWS["法規"]|map()' | bat --language json --style=plain
  yq --output-format=json "$xml" | jq --arg NAME "$1" "$(cat <<'EOF'
.LAWS["法規"] |
map(
  select(
    .["法規名稱"] |
    contains($ARGS.named.NAME)
  )
)
EOF
)" | bat --language json --style=plain
}

law "$@"
