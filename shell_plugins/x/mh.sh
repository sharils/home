#!/usr/bin/env sh

mh() {
  dir="$HOME/git/github.com/sharils/~miraheze/$(d F)"
  x mp "$dir"
  mv -v ~/Downloads/smilingpuffinwiki_xml_*.xml.gz "$dir"
}

mh "$@"
