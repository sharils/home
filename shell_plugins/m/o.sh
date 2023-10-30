#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

o() {
  case "$1" in
  91) open -b com.apple.Music 'https://jazzfm91.streamb.live/SB00009' ;;
  247) open -b com.apple.Music 'https://stream.zeno.fm/s2888pqwzqzuv' ;;
  977) open -b com.apple.Music 'https://music.apple.com/tw/station/classical-fm-97-7/ra.1459554452?l=en' ;;
  a1) open -b com.apple.Music 'https://music.apple.com/tw/station/apple-music-1/ra.978194965?l=en-GB' ;;
  bbc) open -b com.apple.Music 'https://music.apple.com/tw/station/bbc-radio-3/ra.1461288674?l=en' ;;
  cap) open -b com.apple.Music 'https://playerservices.streamtheworld.com/pls/ClassicalStreamAAC.pls' ;;
  kamu) open -b com.apple.Music 'https://kamu.streamguys1.com/hd2-64' ;;
  kids) open -b com.apple.Music 'https://classicalkids.stream.publicradio.org/classicalkids.aac' ;;
  muzaiko) open -b com.apple.Music 'http://fluo.muzaiko.saluton.dk:8000/radio.mp3' ;;
  peace) open -b com.apple.Music 'https://peacefulpiano.stream.publicradio.org/peacefulpiano.aac' ;;
  rand) $BROWSER 'https://classicalmusiconly.com/community/tv/lucky/random' ;;
  vpr) open -b com.apple.Music 'https://www.vpr.net/apps/stream-playlists/vprclassicalaac.pls' ;;
  wwfm) open -b com.apple.Music 'https://wwmf.streamguys1.com/live' ;;
  esac
}

o "$@"
