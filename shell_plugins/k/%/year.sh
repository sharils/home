#!/usr/bin/env sh

year() {
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
}

year "$@"
