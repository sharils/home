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

  3)
    y="$(date +%Y)"
    m="$(date +%m)"
    cal $((m - 1)) "$y"
    cal "$m" "$y"
    cal $((m + 1)) "$y"
    return $?
    ;;

  # https://data.gov.tw/dataset/14718
  2026) md5_url='4902bf5e03126b9c77aa192d6f5bffe2' ;;

  indigenous)
    shift
    # https://data.gov.tw/dataset/164651
    [ -f "${indigenous:=/tmp/x-cal-indigenous-$(date +%Y).json}" ] ||
      curl --insecure https://data.cip.gov.tw/API/v1/dump/datastore/A53000000A-112055-001 >"$indigenous"

    jq --raw-output "$(
      cat <<'EOF'
        first.result.records |
        map(
          [
            (.["民國年"] | tonumber + 1911),
            (
              .["舉辦期間"] |
              split("[-~]"; "") |
              map(
                strptime("%m/%d") |
                strftime("%m-%d")
              )
            ),
            .["民族"], .["祭儀名稱"]
          ]
        ) |
        map(flatten) |
        sort[] |
        @tsv
EOF
    )" <"$indigenous" |
      column -t |
      grep "${1:-^}"
    return $?
    ;;

  st)
    shift && "$SHARILS_HOME/shell_plugins/x/cal/st.sh" "$@"
    return $?
    ;;

  tw)
    # https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=D0020095
    # https://www.laws.taipei.gov.tw/Law/LawSearch/LawArticleContent?sysNumber=A040160021016200
    {
      x_cal 2026
    } | jq --raw-output \
      "map(select((now|localtime|strftime(\"%F %a\")) <= .[0])) | map(@csv)[]" |
      tr -d '"' | tr , ' '

    return $?
    ;;

  zh)
    shift
    "$SHARILS_HOME/shell_plugins/x/cal/zh.sh" "$@"
    return $?
    ;;

  -y)
    cal "$@"
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
