#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

zh() {
  # https://data.gov.tw/dataset/157677
  [ -f "${zh:=/tmp/x-cal-zh-$(date +%Y).csv}" ] ||
    curl --location 'https://opendata.cwa.gov.tw/fileapi/v1/opendataapi/A-A0087-001?Authorization=rdec-key-123-45678-011121314&format=CSV' >"$zh"
  case "$1" in

  1)
    shift
    yq @json "$zh" | jq --raw-output --arg YEAR "$(date +%Y)" "$(
      cat <<'EOF'
          map(select(.["日期"] != null)) |
          map(
            select(
              $ARGS.named.YEAR <= (.["日期"] | strptime("%Y-%m-%d") | strftime("%Y")) and
              .["農曆日"] == 1
            )
          ) |
          map(.["日期"]) |
          .[]
EOF
    )" "$@" |
      tr '\n' ' ' |
      fold -w$((12 * 11))
    ;;

  dbf)
    shift
    yq @json "$zh" | jq --raw-output --arg YEAR "$(date +%Y)" "$(
      cat <<'EOF'
          map(select(.["日期"] != null)) |
          map(
            select(
               $ARGS.named.YEAR <= (.["日期"] | strptime("%Y-%m-%d") | strftime("%Y")) and
              .["農曆月"] == 5 and
              .["農曆日"] == 5
            )
          ) |
          map(.["日期"]) |
          .[]
EOF
    )" "$@" |
      column
    ;;

  q)
    shift
    yq @json "$zh" | jq --raw-output --arg YEAR "$(date +%Y)" "$(
      cat <<'EOF'
          map(select(.["日期"] != null)) |
          map(
            select(
              $ARGS.named.YEAR <= (.["日期"] | strptime("%Y-%m-%d") | strftime("%Y")) and
              ([.["農曆月"]] | inside([2, 5, 8, 11])) and
              .["農曆日"] == 1
            )
          ) |
          map(.["日期"]) |
          .[]
EOF
    )" "$@" |
      tr '\n' ' ' |
      fold -w$((4 * 11))
    ;;

  lantern)
    shift
    yq @json "$zh" | jq --raw-output --arg YEAR "$(date +%Y)" "$(
      cat <<'EOF'
          map(select(.["日期"] != null)) |
          map(
            select(
               $ARGS.named.YEAR <= (.["日期"] | strptime("%Y-%m-%d") | strftime("%Y")) and
              .["農曆月"] == 1 and
              .["農曆日"] == 15
            )
          ) |
          map(.["日期"]) |
          .[]
EOF
    )" "$@" |
      column
    ;;

  lny)
    shift

    yq @json "$zh" | jq --raw-output --arg YEAR "$(date +%Y)" "$(
      cat <<'EOF'
          map(select(.["日期"] != null)) |
          map(
            select(
               $ARGS.named.YEAR <= (.["日期"] | strptime("%Y-%m-%d") | strftime("%Y")) and
              .["農曆月"] == 1 and
              .["農曆日"] == 1
            )
          ) |
          map(.["日期"]) |
          .[]
EOF
    )" "$@" | while IFS= read -r line; do
      date -jf%F -v-2d "$line" +%F
    done | column
    ;;

  maf)
    shift
    yq @json "$zh" | jq --raw-output --arg YEAR "$(date +%Y)" "$(
      cat <<'EOF'
          map(select(.["日期"] != null)) |
          map(
            select(
               $ARGS.named.YEAR <= (.["日期"] | strptime("%Y-%m-%d") | strftime("%Y")) and
              .["農曆月"] == 8 and
              .["農曆日"] == 15
            )
          ) |
          map(.["日期"]) |
          .[]
EOF
    )" "$@" |
      column
    ;;

  *) yq @json "$zh" | jq --arg TODAY "$(date +%F)" "${@:-map(select(.[\"日期\"] == \$ARGS.named.TODAY))}" ;;

  esac
}

zh "$@"
