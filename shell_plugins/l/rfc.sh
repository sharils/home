#!/usr/bin/env sh

rfc() {
  if [ $# -eq 0 ]; then
    cat <<'EOF'
2119 RFC Key Words
2441 Working with Jon
2468 I Remember IANA
5424 The Syslog Protocol
6570 URI Template
9110 HTTP Semantics
9111 HTTP Caching
9112 HTTP/1.1
severity Syslog Message Severities
EOF
    return
  fi
  case "$1" in
  severity) set -- "5424#page-11" ;;
  esac
  lynx "https://www.rfc-editor.org/rfc/rfc$*"
}

rfc "$@"
