#!/usr/bin/env sh

x() {
  cmd="$1"
  shift

  case "$cmd" in

  erl)
    if [ $# -eq 0 ]; then
      erl -man erl
    else
      erl -noshell -eval "$*,init:stop()."
    fi
    ;;

  ex) elixir -e "$*" ;;

  gpg) echo | gpg --clearsign >/dev/null ;;

  js) node --print "$*" ;;

  krampus)
    # Named after https://www.npmjs.com/package/krampus
    pid="$(lsof -ti "$*")"
    kill -TERM "$pid" || kill -KILL "$pid"
    ;;

  m)
    mkdir "$@"
    ;;

  php) php -r "$*" ;;

  py) python3 -c "$*" ;;

  tel)
    open "tel:$*"
    ;;

  tree)
    find . -print | sed 's;[^/]*/;|____;g;s;____|; |;g'
    ;;

  whois)
    for name in "$@"; do :; done
    whois -c "${name##*.}" "$@"
    ;;

  esac
}

# rfc54241() {
#   cat <<'TXT'
#
#           Numerical             Facility
#              Code
#
#               0             kernel messages
#               1             user-level messages
#               2             mail system
#               3             system daemons
#               4             security/authorization messages
#               5             messages generated internally by syslogd
#               6             line printer subsystem
#               7             network news subsystem
#               8             UUCP subsystem
#               9             clock daemon
#              10             security/authorization messages
#              11             FTP daemon
#              12             NTP subsystem
#              13             log audit
#              14             log alert
#              15             clock daemon (note 2)
#              16             local use 0  (local0)
#              17             local use 1  (local1)
#              18             local use 2  (local2)
#              19             local use 3  (local3)
#              20             local use 4  (local4)
#              21             local use 5  (local5)
#              22             local use 6  (local6)
#              23             local use 7  (local7)
#
#               Table 1.  Syslog Message Facilities
#
# TXT
# }

# rfc54242() {
#   cat <<'TXT'
#
#            Numerical         Severity
#              Code
#
#               0       Emergency: system is unusable
#               1       Alert: action must be taken immediately
#               2       Critical: critical conditions
#               3       Error: error conditions
#               4       Warning: warning conditions
#               5       Notice: normal but significant condition
#               6       Informational: informational messages
#               7       Debug: debug-level messages
#
#               Table 2. Syslog Message Severities
#
# TXT
# }
