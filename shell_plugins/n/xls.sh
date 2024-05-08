#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://github.com/AlaSQL/alasql/wiki#alasql-qa
# https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/respub/
xls() {
  : "${1:?csv html json tsv txt xls}"
  url='https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/respub/download/dict_idioms_2020_20230629.zip'
  name="$(basename "${url%%.zip}")"
  if [ $# -eq 1 ]; then
    [ -f "/tmp/$name.zip" ] || curl "$url" >"/tmp/$name.zip"
    [ -f "/tmp/$name.xls" ] || unzip "/tmp/$name.zip" -d /tmp
  fi
  xls="${2:-/tmp/$name.xls}"
  npx --yes alasql "SELECT * INTO $1('${xls%%.xls}.$1') FROM xls('$xls');"
}

xls "$@"
