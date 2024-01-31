#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_cal() {
  if [ $# -eq 0 ]; then
    cal -B1 -A4
    return
  fi

  # https://data.gov.tw/dataset/14718
  nid='14718'
  case "$1" in
  2023) md5_url='ed0be53097a9da90ee037896396142c2' ;;
  2024) md5_url='2c1c090b51f0b61d9283d79a160f211d' ;;

  st)
    shift
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
      column -t
    return $?
    ;;

  tw)
    {
      x_cal 2023
      x_cal 2024
    } | jq --raw-output \
      "map(select((now|localtime|strftime(\"%F %a\")) <= .[0])) | map(@csv)[]" |
      tr -d '"' | tr , ' '
    return $?
    ;;

  zh)
    shift
    # https://data.gov.tw/dataset/157677
    [ -f "${zh:=/tmp/x-cal-zh-$(date +%Y).csv}" ] ||
      curl --location 'https://opendata.cwa.gov.tw/fileapi/v1/opendataapi/A-A0087-001?Authorization=rdec-key-123-45678-011121314&format=CSV' >"$zh"
    case "$1" in
    lantern) shift && set -- 'map(select(.["農曆月"] == 1 and .["農曆日"] == 15)) | map(.["格里曆日期"])' "$@" ;;
    esac
    yq @json "$zh" | jq --arg TODAY "$(date +%F)" "${@:-map(select(.[\"格里曆日期\"] == \$ARGS.named.TODAY))}"
    return $?
    ;;
  esac

  tmp="/tmp/${md5_url}_export.json"
  [ ! -f "$tmp" ] && curl -s "https://quality.data.gov.tw/dq_download_json.php?nid=$nid&md5_url=$md5_url" >"$tmp"
  jq --arg labourDay "${1}0501" "$(
    cat <<'JQ'
      .[(map(.["西元日期"] == $ARGS.named.labourDay)|index(true))]["是否放假"] |= "2" |
      .[(map(.["西元日期"] == $ARGS.named.labourDay)|index(true))]["備註"] |= "勞動節" |
      map(
        select(
          (.["是否放假"] == "2" and .["備註"] != "") or
          (.["是否放假"] == "0" and (.["星期"] == "六" or .["星期"] == "日"))
        )
      ) |
      map([(.["西元日期"]|strptime("%Y%m%d")|strftime("%F %a")), .["備註"]])
JQ
  )" <"$tmp"
}

x_cal "$@"
