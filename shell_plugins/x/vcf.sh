#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

vcf() {
  printf %b "$(sed 's/CHARSET=UTF-8;ENCODING=QUOTED-PRINTABLE://g' <"$1" | sed 's/=/\\x/g' | grep '^N:\|^N;\|^TEL')"
}

vcf "$@"
