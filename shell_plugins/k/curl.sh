#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

curl() {
  cat <<'EOF'
%%                          A normal %.
\n                          Newline.
\r                          Carriage return.
\t                          Tab space.
%header{name}               Output HTTP headers from the most recent request
%{content_type}             The Content-Type of the requested document, if there was any.
%{errormsg}                 The error message. (Added in 7.75.0)
%{exitcode}                 The numerical exitcode of the transfer. (Added in 7.75.0)
%{filename_effective}       The ultimate filename that curl writes out to.  This is only meaningful if curl is told to write to a file with the -O, --remote-name or -o, --output option. It's most useful in combination with the -J, --remote-header-name option.
%{ftp_entry_path}           The initial path curl ended up in when logging on to the remote FTP server.
%{header_json}              A JSON object with all HTTP response headers from the recent transfer. Values are provided as arrays, since in the case of multiple headers there can be multiple values.  The header names provided in lowercase, listed in order of appearance over the wire. Except for duplicated headers. They are grouped on the first occurrence of that header, each value is presented in the JSON array.
%{http_code}                The numerical response code that was found in the last retrieved HTTP(S) or FTP(s) transfer.
%{http_connect}             The numerical code that was found in the last response (from a proxy) to a curl CONNECT request.
%{http_version}             The http version that was effectively used.  (Added in 7.50.0)
%{json}                     A JSON object with all available keys.
%{local_ip}                 The IP address of the local end of the most recently done connection - can be either IPv4 or IPv6.
%{local_port}               The local port number of the most recently done connection.
%{method}                   The http method used in the most recent HTTP request. (Added in 7.72.0)
%{num_connects}             Number of new connects made in the recent transfer.
%{num_headers}              The number of response headers in the most recent request (restarted at each redirect). Note that the status line IS NOT a header. (Added in 7.73.0)
%{num_redirects}            Number of redirects that were followed in the request.
%{onerror}                  The rest of the output is only shown if the transfer returned a non-zero error (Added in 7.75.0)
%{proxy_ssl_verify_result}  The result of the HTTPS proxy's SSL peer certificate verification that was requested. 0 means the verification was successful. (Added in 7.52.0)
%{redirect_url}             When an HTTP request was made without -L, --location to follow redirects (or when --max- redirs is met), this variable will show the actual URL a redirect would have gone to.
%{referer}                  The Referer: header, if there was any. (Added in 7.76.0)
%{remote_ip}                The remote IP address of the most recently done connection - can be either IPv4 or IPv6.
%{remote_port}              The remote port number of the most recently done connection.
%{response_code}            The numerical response code that was found in the last transfer (formerly known as "http_code").
%{scheme}                   The URL scheme (sometimes called protocol) that was effectively used. (Added in 7.52.0)
%{size_download}            The total amount of bytes that were downloaded.  This is the size of the body/data that was transferred, excluding headers.
%{size_header}              The total amount of bytes of the downloaded headers.
%{size_request}             The total amount of bytes that were sent in the HTTP request.
%{size_upload}              The total amount of bytes that were uploaded.  This is the size of the body/data that was transferred, excluding headers.
%{speed_download}           The average download speed that curl measured for the complete download. Bytes per second.
%{speed_upload}             The average upload speed that curl measured for the complete upload. Bytes per second.
%{ssl_verify_result}        The result of the SSL peer certificate verification that was requested. 0 means the verification was successful.
%{stderr}                   From this point on, the -w, --write-out output will be written to standard error. (Added in 7.63.0)
%{stdout}                   From this point on, the -w, --write-out output will be written to standard output.  This is the default, but can be used to switch back after switching to stderr.  (Added in 7.63.0)
%{time_appconnect}          The time, in seconds, it took from the start until the SSL/SSH/etc connect/handshake to the remote host was completed.
%{time_connect}             The time, in seconds, it took from the start until the TCP connect to the remote host (or proxy) was completed.
%{time_namelookup}          The time, in seconds, it took from the start until the name resolving was completed.
%{time_pretransfer}         The time, in seconds, it took from the start until the file transfer was just about to begin.  This includes all pre-transfer commands and negotiations that are specific to the particular protocol(s) involved.
%{time_redirect}            The time, in seconds, it took for all redirection steps including name lookup, connect, pretransfer and transfer before the final transaction was started. time_redirect shows the complete execution time for multiple redirections.
%{time_starttransfer}       The time, in seconds, it took from the start until the first byte was just about to be transferred. This includes time_pretransfer and also the time the server needed to calculate the result.
%{time_total}               The total time, in seconds, that the full operation lasted.
%{url}                      The URL that was fetched. (Added in 7.75.0)
%{urlnum}                   The URL index number of this transfer, 0-indexed.  De-globbed URLs share the same index number as the origin globbed URL. (Added in 7.75.0)
%{url_effective}            The URL that was fetched last. This is most meaningful if you have told curl to follow location: headers.
EOF
}

curl "$@"
