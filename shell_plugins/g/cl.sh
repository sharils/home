#!/usr/bin/env sh

cl() {
  case "$1" in
  -e) git config --local "$@" ;;
  t | *)
    case "$1" in
    ~) shift && x mp "$HOME$(dirname "$(echo "$*" | sed 's#https:/#git#;s#[@:]#/#g;s#^#/#')")" ;;
    t) shift && z t ;;
    esac
    git clone "$@"
    for last in "$@"; do :; done
    last="$(basename "$last")"
    cd "${last%.*}" || return
    ;;
  esac
}

cl "$@"
