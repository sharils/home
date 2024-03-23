#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

hospital() {
  # https://data.gov.tw/dataset/39283
  [ -f "${hospitall1:=/tmp/x-hospital-l1-$(date +%F).csv}" ] ||
    curl 'https://info.nhi.gov.tw/api/iode0000s01/Dataset?rId=A21030000I-D21004-009' >"$hospitall1"
  yq @json "$hospitall1" | jq

  # https://data.gov.tw/dataset/39282
  [ -f "${hospitall2:=/tmp/x-hospital-l2-$(date +%F).csv}" ] ||
    curl ' https://info.nhi.gov.tw/api/iode0000s01/Dataset?rId=A21030000I-D21003-003 ' >"$hospitall2"
  yq @json "$hospitall2" | jq

  # https://data.gov.tw/dataset/39281
  [ -f "${hospitall3:=/tmp/x-hospital-l3-$(date +%F).csv}" ] ||
    curl 'https://info.nhi.gov.tw/api/iode0000s01/Dataset?rId=A21030000I-D21002-005' >"$hospitall3"
  yq @json "$hospitall3" | jq

  # https://data.gov.tw/dataset/39280
  [ -f "${hospitall4:=/tmp/x-hospital-l4-$(date +%F).csv}" ] ||
    curl 'https://info.nhi.gov.tw/api/iode0000s01/Dataset?rId=A21030000I-D21001-003' >"$hospitall4"
  yq @json "$hospitall4" | jq
}

hospital "$@"
