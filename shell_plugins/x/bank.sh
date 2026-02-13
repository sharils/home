#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_bank() {
  # https://data.gov.tw/dataset/6041
  [ -f "${codes:=/tmp/x-bank-codes-$(date +%F).}" ] ||
    curl 'https://stat.fsc.gov.tw/FSC_OAS3_RESTORE/api/CSV_EXPORT?TableID=B14&OUTPUT_FILE=Y' >"$codes"

  {
    grep --only-match '^[[:digit:]][[:digit:]][[:digit:]],,[^,]\+' "$codes" |
      sed 's/,,/ /'
    echo '700 中華郵政公司'
  } |
    grep "${*-銀行股份有限公司\|中華郵政公司}" |
    sort |
    LESS='--RAW-CONTROL-CHARS --ignore-case --no-init --quit-at-eof --quit-if-one-screen' less
}

x_bank "$@"
