#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

five() {
  cat <<'EOF'
+ 15.6.  Server Error 5xx
     o 15.6.1.  500 Internal Server Error
     o 15.6.2.  501 Not Implemented
     o 15.6.3.  502 Bad Gateway
     o 15.6.4.  503 Service Unavailable
     o 15.6.5.  504 Gateway Timeout
     o 15.6.6.  505 HTTP Version Not Supported
EOF
}

five "$@"
