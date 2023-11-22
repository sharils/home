#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

salary() {
  src='https://apiservice.mol.gov.tw/OdService/download/A17000000J-020050-84m'
  dest="/tmp/x-salary.json"

  [ -f "$dest" ] || curl "$src" >"$dest"

  jq --raw-output <"$dest" 'last | to_entries | map([.key, .value])[] | @tsv'
}

salary "$@"
