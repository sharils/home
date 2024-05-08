#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

four() {
  cat <<'EOF'
+ 15.5.  Client Error 4xx
     o 15.5.1.  400 Bad Request
     o 15.5.2.  401 Unauthorized
     o 15.5.3.  402 Payment Required
     o 15.5.4.  403 Forbidden
     o 15.5.5.  404 Not Found
     o 15.5.6.  405 Method Not Allowed
     o 15.5.7.  406 Not Acceptable
     o 15.5.8.  407 Proxy Authentication Required
     o 15.5.9.  408 Request Timeout
     o 15.5.10. 409 Conflict
     o 15.5.11. 410 Gone
     o 15.5.12. 411 Length Required
     o 15.5.13. 412 Precondition Failed
     o 15.5.14. 413 Content Too Large
     o 15.5.15. 414 URI Too Long
     o 15.5.16. 415 Unsupported Media Type
     o 15.5.17. 416 Range Not Satisfiable
     o 15.5.18. 417 Expectation Failed
     o 15.5.19. 418 (Unused)
     o 15.5.20. 421 Misdirected Request
     o 15.5.21. 422 Unprocessable Content
     o 15.5.22. 426 Upgrade Required
EOF
}

four "$@"
