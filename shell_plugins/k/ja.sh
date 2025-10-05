#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ja() {
  cat <<'EOF'
ka  ki  ku  ke  ko
sa  si  su  se  so
ta  ti  tu  te  to
na  ni  nu  ne  no
ha  hi  hu  he  ho
        fu
ma  mi  mu  me  mo
ya      yu      yo
ra  ri  ru  re  ro
wa              wo
EOF
}

ja "$@"
