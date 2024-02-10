#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

zh() {
  # https://data.gov.tw/dataset/157677
  [ -f "${zh:=/tmp/x-cal-zh-$(date +%Y).csv}" ] ||
    curl --location 'https://opendata.cwa.gov.tw/fileapi/v1/opendataapi/A-A0087-001?Authorization=rdec-key-123-45678-011121314&format=CSV' >"$zh"
  case "$1" in

  lantern)
    shift
    yq @json "$zh" | jq --raw-output --arg TODAY "$(date +%F)" "$(
      cat <<'EOF'
          map(
            select(
               $ARGS.named.TODAY <= .["格里曆日期"] and
              .["農曆月"] == 1 and
              .["農曆日"] == 15
            )
          ) |
          map(.["格里曆日期"]) |
          .[]
EOF
    )" "$@" |
      column
    ;;

  lny)
    shift
    yq @json "$zh" | jq --raw-output "$(
      cat <<'EOF'
          map(
            select(
              .["農曆月"] == 1 and
              .["農曆日"] == 1
            )
          ) |
          map(.["格里曆日期"]) |
          .[]
EOF
    )" "$@" | while IFS= read -r line; do
      [ "$(date +%Y)" -le "$(date -jf%F -v-0d "$line" +%Y)" ] && date -jf%F -v-2d "$line" +%F
    done | column
    ;;
  *) yq @json "$zh" | jq --arg TODAY "$(date +%F)" "${@:-map(select(.[\"格里曆日期\"] == \$ARGS.named.TODAY))}" ;;
  esac
}

zh "$@"
