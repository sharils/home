#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

three() {
  cat <<'EOF'
+ 15.4.  Redirection 3xx
     o 15.4.1.  300 Multiple Choices
     o 15.4.2.  301 Moved Permanently
     o 15.4.3.  302 Found
     o 15.4.4.  303 See Other
     o 15.4.5.  304 Not Modified
     o 15.4.6.  305 Use Proxy
     o 15.4.7.  306 (Unused)
     o 15.4.8.  307 Temporary Redirect
     o 15.4.9.  308 Permanent Redirect
EOF
}

three "$@"
