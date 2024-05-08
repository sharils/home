#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://superuser.com/a/395738
members() {
  dscl . -list /Users | while IFS= read -r user; do
    printf %s "$user"
    dsmemberutil checkmembership -U "$user" -G "$*"
  done | grep 'is a member' | cut -d ' ' -f 1

}

members "$@"
