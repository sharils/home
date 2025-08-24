#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

mh() {
  dir="$HOME/git/github.com/sharils/~backup/miraheze/$(date +%F)"
  mkdir -pv "$dir"
  mv -v ~/Downloads/smilingpuffinwiki_xml_*.xml.gz "$dir"
}

mh "$@"
