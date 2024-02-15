#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

roc() {
  printf 'Year %s is either Gregorian %s or ROC %s. (gc-11; roc+11)\n' "${*}" "$((${*} + 1911))" "$((${*} - 1911))"

  cat <<'EOF'
gc    roc
2000  89
2001  90
2002  91
2003  92
2004  93
2005  94
2006  95
2007  96
2008  97
2009  98
2010  99
EOF
}

roc "$@"
