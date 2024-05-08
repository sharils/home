#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

law() {
  if [ $# -eq 0 ]; then
    echo 'not implemented' >&2
    return
  fi

  # en https://data.gov.tw/dataset/18293
  # zh https://data.gov.tw/dataset/18289
  src='https://sendlaw.moj.gov.tw/PublicData/GetFile.ashx?DType=XML&AuData=CF'

  dest="/tmp/x-law-$(date +%Y-%m)"
  zip="$dest.zip"
  [ -f "$zip" ] || {
    curl --get --location "$src" >"$dest.zip"
    unzip "$zip" -d "$dest"
  }
  xml="$(ls "$dest/"*.xml)"

  case "$1" in
  刑 | 刑法) NAME='中華民國刑法' ;;
  勞基法) NAME='勞動基準法' ;;
  民) NAME='中華民國民法' ;;
  *) NAME="$1" ;;
  esac

  yq --output-format=json "$xml" | jq --arg NAME "$NAME" "$(
    cat <<'EOF'
.LAWS["法規"] |
map(
  select(
    .["法規名稱"] == $ARGS.named.NAME and
    .["廢止註記"] != "廢"
  )
)
EOF
  )" | bat --language json --style=plain
}

law "$@"
