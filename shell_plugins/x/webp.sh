#!/usr/bin/env sh

webp() {
  cmd="$1"
  shift
  case "$cmd" in
  t)
    echo '==> 72B.webp <==' >&2
    x webp | tee 72B.webp
    ;;
  *) printf "\x52\x49\x46\x46\x40\x00\x00\x00\x57\x45\x42\x50\x56\x50\x38\x58\x0a\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x41\x4c\x50\x48\x02\x00\x00\x00\x00\x00\x56\x50\x38\x20\x18\x00\x00\x00\x30\x01\x00\x9d\x01\x2a\x01\x00\x01\x00\x02\x00\x34\x25\xa4\x00\x03\x70\x00\xfe\xfb\x94\x00\x00" ;;
  esac
}

webp "$@"