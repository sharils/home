#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

two() {
  cat <<'EOF'
+ 15.3.  Successful 2xx
     o 15.3.1.  200 OK
     o 15.3.2.  201 Created
     o 15.3.3.  202 Accepted
     o 15.3.4.  203 Non-Authoritative Information
     o 15.3.5.  204 No Content
     o 15.3.6.  205 Reset Content
     o 15.3.7.  206 Partial Content
EOF
}

two "$@"
