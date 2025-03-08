#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

salary() {
  # https://data.gov.tw/dataset/6281
  src='https://apiservice.mol.gov.tw/OdService/download/A17000000J-020050-84m'
  dest="/tmp/x-salary.json"

  [ -f "$dest" ] || curl "$src" >"$dest"

  printf "%s年%s月%s日\n" "$(($(date +%Y) - 1911))" "$(date +%m)" "$(date +%d)"

  jq <"$dest" \
    --raw-output \
    --arg LAST_YEAR "$(($(date +%Y) - 1911 - 1))年1月1日" \
    --arg THIS_YEAR "$(($(date +%Y) - 1911))年1月1日" \
    --arg NEXT_YEAR "$(($(date +%Y) - 1911 + 1))年1月1日" "$(
      cat <<'EOF'
      map(select(
        .["實施日期（民國）"] == $ARGS.named.LAST_YEAR or
        .["實施日期（民國）"] == $ARGS.named.THIS_YEAR or
        .["實施日期（民國）"] == $ARGS.named.NEXT_YEAR
      )) |
      map(to_entries)[] |
      map([.key, .value])[] |
      @tsv
EOF
    )"
}

salary "$@"
