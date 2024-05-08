#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

fer() {
  # https://data.gov.tw/dataset/10817
  src='https://quality.data.gov.tw//dq_download_json.php?nid=10817&md5_url=cf9bb6fd0bca5570ba4015b00eed7ddf'
  dest="/tmp/x-fer-$(date +%Y-%m).json"

  [ -f "$dest" ] || curl "$src" >"$dest"

  jq <"$dest" --raw-output "$(
    cat <<'EOF'
last |
[.["期間"], "Bank Sell", "Bank Buy"],
["10", .["10天-賣出匯率"], .["10天-買入匯率"]],
["30", .["30天-賣出匯率"], .["30天-買入匯率"]],
["60", .["60天-賣出匯率"], .["60天-買入匯率"]],
["90", .["90天-賣出匯率"], .["90天-買入匯率"]],
["120", .["120天-賣出匯率"], .["120天-買入匯率"]],
["150", .["150天-賣出匯率"], .["150天-買入匯率"]],
["180", .["180天-賣出匯率"], .["180天-買入匯率"]] |
@tsv
EOF
  )" | column -t
}

fer "$@"
