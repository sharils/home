#!/usr/bin/env sh

d() {
  cmd="${1:-i}"
  shift

  case $cmd in

  -1) (set -x && date -ujf%s -v-1S 0 "${@:-+%+%t%G-W%V}") ;;
  0) date -ujf%s 0 "${@:-+%FT%T}" ;;
  a) direnv allow ;;
  e) direnv edit . && chmod 600 .envrc ;;
  I) d i "$@" | tr -d '[:punct:]' ;;
  i) date -Iseconds "$@" | sed "s/:00$//" ;;
  U) d I -u ;;
  u) d i -u ;;
  s) date -u +%s ;;
  v) date -jf %F -v"${1:-+0d}" "${2:-"$(date +%F)"}" +%F ;;

  %)
    cmd="${1:-all}"
    shift
    case "$cmd" in
    all)
      for cmd in datetime date time year month week day hour minute second timezone literal extension; do
        d % "$cmd"
      done
      ;;

    date)
      cat <<SH
date:
  %D: %m/%d/%y, $(date +%D)
  %F: %Y-%m-%d, $(date +%F)
  %v: %e-%b-%y, $(date +%v)
  %x: national, $(date +%x)
  %Ex: POSIX, $(date +%Ex)
SH
      ;;

    datetime)
      cat <<SH
datetime:
  %+: national, $(date +%+)
  %c: national, $(date +%c)
  %Ec: POSIX, $(date +%Ec)
SH
      ;;

    day)
      cat <<SH
day:
  %A: national, $(date +%A)
  %a: national, $(date +%a)
  %d: 01-31, $(date +%d)
  %e: 1-31, $(date +%e)
  %j: 001-366, $(date +%j)
  %u: 1-7, Mon-Sun, $(date +%u)
  %w: 0-6, Sun-Sat, $(date +%w)
  %Od: POSIX, $(date +%Od)
  %Oe: POSIX, $(date +%Oe)
  %Ou: POSIX, $(date +%Ou)
  %Ow: POSIX, $(date +%Ow)
SH
      ;;

    extension)
      cat <<SH
extension:
  %-*: GNU, no padding
  %_*: GNU, space padding
  %0*: GNU, zero padding
SH
      ;;

    hour)
      cat <<SH
hour:
  %H: 00-23, $(date +%H)
  %I: 00-12, $(date +%I)
  %k: 0-23, $(date +%k)
  %l: 1-12, $(date +%l)
  %p: national, $(date +%p)
  %OH: POSIX, $(date +%OH)
  %OI: POSIX, $(date +%OI)
SH
      ;;

    literal)
      cat <<SH
literal:
  %%: %
  %n: \n
  %t: \t
SH
      ;;

    minute)
      cat <<SH
minute:
  %M: 00-59, $(date +%M)
  %OM: POSIX, $(date +%OM)
SH
      ;;

    month)
      cat <<SH
month:
  %B: national, $(date +%B)
  %b: national, $(date +%b)
  %h: %b, $(date +%h)
  %m: 01-12, $(date +%m)
  %Om: POSIX, $(date +%Om)
SH
      ;;

    second)
      cat <<SH
second:
  %S: 00-60, $(date +%S)
  %s: 0-67768036191676799, $(date +%s)
  %OS: POSIX, $(date +%OS)
SH
      ;;

    time)
      cat <<SH
time:
  %R: %H:%M, $(date +%R)
  %T: %H:%M:%S, $(date +%T)
  %X: national, $(date +%X)
  %r: %I:%M:%S %p, $(date +%r)
  %EX: POSIX, $(date +%EX)
SH
      ;;

    timezone)
      cat <<SH
timezone:
  %Z: $(date +%Z)
  %z: $(date +%z)
SH
      ;;

    week)
      cat <<SH
week:
  %U: 00-53, $(date +%U), Sun-Sat
  %V: 01-53, $(date +%V), ISO
  %W: 00-53, $(date +%W), Mon-Sun
  %OU: POSIX, $(date +%OU)
  %OV: POSIX, $(date +%OV)
  %OW: POSIX, $(date +%OW)
SH
      ;;

    year)
      cat <<SH
year:
  %C: 19-99, $(date +%C)
  %G: 1900-9999, $(date +%G), ISO
  %Y: 1900-9999, $(date +%Y)
  %g: 00-99, $(date +%g), ISO
  %y: 00-99, $(date +%y)
  %EC: POSIX, $(date +%EC)
  %EY: POSIX, $(date +%EY)
  %Ey: POSIX, $(date +%Ey)
  %Oy: POSIX, $(date +%Oy)
SH
      ;;

    *) man strftime ;;

    esac
    ;;

  *) date "$@" ;;

  esac
}
