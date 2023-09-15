#!/usr/bin/env sh

http() {
  case "$1" in

  1)
    cat <<'EOF'
+ 15.2.  Informational 1xx
     o 15.2.1.  100 Continue
     o 15.2.2.  101 Switching Protocols
EOF
    ;;

  2)
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
    ;;

  3)
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
    ;;

  4)
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
    ;;

  5)
    cat <<'EOF'
+ 15.6.  Server Error 5xx
     o 15.6.1.  500 Internal Server Error
     o 15.6.2.  501 Not Implemented
     o 15.6.3.  502 Bad Gateway
     o 15.6.4.  503 Service Unavailable
     o 15.6.5.  504 Gateway Timeout
     o 15.6.6.  505 HTTP Version Not Supported
EOF
    ;;

  esac
}

http "$@"
