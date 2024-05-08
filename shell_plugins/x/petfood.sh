#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

petfood() {
  # https://data.gov.tw/dataset/93696
  [ -f "${petfood:=/tmp/x-petfood-$(date +%F).json}" ] ||
    curl 'https://data.moa.gov.tw/Service/OpenData/TransService.aspx?UnitId=wxV177kLhEE3&IsTransData=1' >"$petfood"

  jq <"$petfood"
}

petfood "$@"
