#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

gif() {
  cmd="$1"
  shift
  case "$cmd" in
  t)
    echo '==> 43B.gif <==' >&2
    gif | tee 43B.gif
    ;;
  *) printf "\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x80\x00\x00\xff\xff\xff\x00\x00\x00\x21\xf9\x04\x01\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02\x02\x44\x01\x00\x3b" ;;
  esac
}

gif "$@"
