#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

train() {
  # 高鐵時刻表 https://data.gov.tw/dataset/96937
  [ -f "${hsr:=/tmp/x-train-hsr-$(date +%F).csv}" ] ||
    curl https://www.rb.gov.tw/public/files/artsinfo/1700038063-m0.csv >"hsr"

  # 台鐵時刻表 https://data.gov.tw/dataset/6138
  [ -f "${tra_set:=/tmp/x-train-tra_set-$(date +%F).json}" ] ||
    curl 'https://quality.data.gov.tw//dq_download_json.php?nid=6138&md5_url=70e79f17765f299745570acf2405279e' >"$tra_set"

  # 新舊版本鐵路時刻表車站代碼對照表
  [ -f "${tra_zip:=/tmp/x-train-tra_zip-$(date +%F).zip}" ] || {
    curl -L "$(jq --raw-output '.[]|select(.["資料集名稱"]=="新舊版本鐵路時刻表車站代碼對照表")["連結網址"]' <"$tra_set")" >"$tra_zip"
    ditto -h
  }

  # html for 鐵路時刻表JSON檔案
  [ -f "${tra_html:=/tmp/x-train-tra_html-$(date +%F).html}" ] ||
    curl -L "$(jq --raw-output '.[]|select(.["資料集名稱"]=="鐵路時刻表JSON檔案")["連結網址"]' <"$tra_set")" >"$tra_html"
}

train "$@"
