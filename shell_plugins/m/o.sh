#!/usr/bin/env sh

o() {
  case "$1" in
  91) open -b com.apple.Music 'https://jazzfm91.streamb.live/SB00009' ;;
  247) open -b com.apple.Music 'https://stream.zeno.fm/s2888pqwzqzuv' ;;
  esac
}

o "$@"
