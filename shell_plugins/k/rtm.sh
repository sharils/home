#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

rtm() {
  cat <<'EOF'
^  Due Date
!  Priority
#  List and Tags
@  Location
~  Start Date
*  Repeat
=  Time Estimate
// Note

https://www.rememberthemilk.com/help/answer/basics-smartadd-howdoiuse
EOF
}

rtm "$@"
