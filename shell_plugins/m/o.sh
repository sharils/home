#!/usr/bin/env sh

o() {
  case "$1" in
  91) open -b com.apple.Music 'https://jazzfm91.streamb.live/SB00009' ;;
  247) open -b com.apple.Music 'https://stream.zeno.fm/s2888pqwzqzuv' ;;
  977) open -b com.apple.Music 'https://music.apple.com/tw/station/classical-fm-97-7/ra.1459554452?l=en' ;;
  bbc) open -b com.apple.Music 'https://music.apple.com/tw/station/bbc-radio-3/ra.1461288674?l=en' ;;
  cap) open -b com.apple.Music 'https://playerservices.streamtheworld.com/pls/ClassicalStreamAAC.pls' ;;
  kamu) open -b com.apple.Music 'https://kamu.streamguys1.com/hd2-64' ;;
  esac
}

o "$@"
