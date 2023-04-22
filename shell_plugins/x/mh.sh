#!/usr/bin/env sh

mh() {
  dir="$HOME/git/github.com/sharils/~miraheze/$(date +%F)"
  mkdir -pv "$dir"
  mv -v ~/Downloads/smilingpuffinwiki_xml_*.xml.gz "$dir"
}

mh "$@"
