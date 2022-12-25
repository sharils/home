#!/usr/bin/env sh

x() {
  cmd="$1"
  shift

  case "$cmd" in

  +) chmod -vv +x "$@" ;;

  -) chmod -vv -x "$@" ;;

  0x)
    cat <<'TEXT'
==> ASCII <<=
  0 00 nul    1 01 soh    2 02 stx    3 03 etx    4 04 eot    5 05 enq    6 06 ack    7 07 bel
  8 08 bs     9 09 ht    10 0a nl    11 0b vt    12 0c np    13 0d cr    14 0e so    15 0f si
 16 10 dle   17 11 dc1   18 12 dc2   19 13 dc3   20 14 dc4   21 15 nak   22 16 syn   23 17 etb
 24 18 can   25 19 em    26 1a sub   27 1b esc   28 1c fs    29 1d gs    30 1e rs    31 1f us
 32 20 sp    33 21  !    34 22  "    35 23  #    36 24  $    37 25  %    38 26  &    39 27  '
 40 28  (    41 29  )    42 2a  *    43 2b  +    44 2c  ,    45 2d  -    46 2e  .    47 2f  /
 48 30  0    49 31  1    50 32  2    51 33  3    52 34  4    53 35  5    54 36  6    55 37  7
 56 38  8    57 39  9    58 3a  :    59 3b  ;    60 3c  <    61 3d  =    62 3e  >    63 3f  ?
 64 40  @    65 41  A    66 42  B    67 43  C    68 44  D    69 45  E    70 46  F    71 47  G
 72 48  H    73 49  I    74 4a  J    75 4b  K    76 4c  L    77 4c  M    78 4d  N    79 4e  O
 80 50  P    81 51  Q    82 52  R    83 53  S    84 54  T    85 55  U    86 56  V    87 57  W
 88 58  X    89 59  Y    90 5a  Z    91 5b  [    92 5c  \    93 5d  ]    94 5e  ^    95 5f  _
 96 60  `    97 61  a    98 62  b    99 63  c   100 64  d   101 65  e   102 66  f   103 67  g
104 68  h   105 69  i   106 6a  j   107 6b  k   108 6c  l   109 6d  m   110 6e  n   111 6f  o
112 70  p   113 71  q   114 72  r   115 73  s   116 74  t   117 75  u   118 76  v   119 77  w
120 78  x   121 79  y   122 7a  z   123 7b  {   124 7c  |   125 7d  }   126 7e  ~   127 7f del

==> PRINTABLE <<=
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

==> URI <<=
!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~

==> POSIX <<=
#%+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~

==> POSIX URI <<=
-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~
TEXT
    ;;

  5424) open 'https://www.rfc-editor.org/rfc/rfc5424.html#page-11' ;;

  8601) open 'https://en.wikipedia.org/wiki/ISO_8601' ;;

  args) xargs -I_ -n1 "$@" ;;

  bc) bc --mathlib --expression="$*" ;;

  cal) cal -A4 -B4 ;;

  data)
    cmd="${1:-image/gif}"
    shift
    printf "data:%s;base64,%s" "$cmd" "$(base64 "$@")"
    ;;

  diff) diff --color --unified "$@" ;;

  editorconfig)
    cat <<'EOF' >.editorconfig
root = true

[*]
charset = utf-8
end_of_line = lf
trim_trailing_whitespace = true
insert_final_newline = true
; indent_style = space
; indent_size = 2
EOF
    ;;

  erl)
    if [ $# -eq 0 ]; then
      erl -man erl
    else
      erl -noshell -eval "$*,init:stop()."
    fi
    ;;

  ex) elixir -e "$*" ;;

  focus_mode)
    now="$(date +%H%m)"
    [ "$now" -lt '1330' ] || [ '1930' -lt "$now" ]
    ;;

  fx)
    if [ $# -ne 0 ]; then
      x fx | grep --ignore-case --color=never "$1"
      return
    fi
    cmd="$HOME/tmp/sinopac/$(d F).json"
    [ ! -f "$cmd" ] && curl 'https://mma.sinopac.com/ws/share/rate/ws_exchange.ashx' >"$cmd"
    jq '([first.TitleInfo|splits("<.*?>")]|map(select(.!=""))[0][5:]|sub(" "; "T")) as $date|first.SubInfo|sort_by(.DataValue4)|map([$date,.DataValue4,.DataValue2,.DataValue3]|@tsv)[]' -r <"$cmd" | column -t
    ;;

  gpg) echo | gpg --clearsign >/dev/null ;;

  gif)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo >&2 '==> 43B.gif <=='
      x gif | tee 43B.gif
      ;;
    *) printf "\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x80\x00\x00\xff\xff\xff\x00\x00\x00\x21\xf9\x04\x01\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02\x02\x44\x01\x00\x3b" ;;
    esac
    ;;

  hostnameise) tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g' ;;

  html)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo >&2 '==> index.html <=='
      x html | tee index.html
      ;;
    *) echo '<!doctype html><html><head><meta charset="utf-8" /><meta http-equiv="Content-type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1" /><title>Hello HTML</title></head><body><h1>Hello HTML</h1></body></html>' ;;
    esac
    ;;

  js) node --print "$*" ;;

  log) log show --predicate 'eventMessage CONTAINS "unlockUIBecomesActive"' --last "${@:-30m}" ;;

  m) mkdir -p "$@" ;;

  o) open "${@:-.}" ;;

  pdf)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo >&2 '==> 130B.pdf <=='
      x pdf | tee 130B.pdf
      ;;
    *) printf "\x25\x50\x44\x46\x2d\x31\x2e\x0a\x31\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x50\x61\x67\x65\x73\x20\x32\x20\x30\x20\x52\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x32\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x4b\x69\x64\x73\x5b\x33\x20\x30\x20\x52\x5d\x2f\x43\x6f\x75\x6e\x74\x20\x31\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x33\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x50\x61\x72\x65\x6e\x74\x20\x32\x20\x30\x20\x52\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x74\x72\x61\x69\x6c\x65\x72\x20\x3c\x3c\x2f\x52\x6f\x6f\x74\x20\x31\x20\x30\x20\x52\x3e\x3e" ;;
    esac
    ;;

  php) php -r "$*" ;;

  png)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo >&2 '==> 68B.png <=='
      x png | tee 68B.png
      ;;
    *) printf "\x89\x50\x4e\x47\x0d\x0a\x1a\x0a\x00\x00\x00\x0d\x49\x48\x44\x52\x00\x00\x00\x01\x00\x00\x00\x01\x08\x04\x00\x00\x00\xb5\x1c\x0c\x02\x00\x00\x00\x0b\x49\x44\x41\x54\x78\xda\x63\x64\x60\x00\x00\x00\x06\x00\x02\x30\x81\xd0\x2f\x00\x00\x00\x00\x49\x45\x4e\x44\xae\x42\x60\x82" ;;
    esac
    ;;

  py) python3 -c "$*" ;;

  re) man "$@" re_format ;;

  resetLaunchPad | showHidden)
    defaults write com.apple.dock "$cmd" -bool true
    killall Dock
    ;;

  rm)
    args=$(printf '%s\n' "$@")
    printf '%s\n' "$args" | while read -r arg; do
      osascript - "$(realpath "$arg")" <<APPLESCRIPT
on run argv
  set posix_files to {}

  repeat with arg in argv
    set end of posix_files to the POSIX file arg
  end repeat

  tell application "Finder" to move posix_files to trash
end run
APPLESCRIPT
    done
    ;;

  screen) screen -xRRe^Gg "$@" ;;

  sh)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      cmd="${*:-sh}"
      echo >&2 "==> $cmd <=="
      x sh | tee "$cmd"
      x + "$cmd"
      ;;
    *)
      cat <<'EOF'
#!/usr/bin/env sh
set -o errexit -o nounset -o xtrace

echo 'Hello sh!'
EOF
      ;;
    esac
    ;;

  ssh) ssh -t "$@" screen -xRRe^Gg ;;

  ssh-copy-id) ssh-copy-id -o PreferredAuthentications=password -i "$HOME/.ssh/id_ed25519.pub" "$@" ;;

  ssh-keygen)
    ssh-keygen -f ~/.ssh/id_ed25519 -t ed25519 -C "${@:?}"
    pbcopy <~/.ssh/id_ed25519.pub
    pbpaste
    mv ~/.ssh/id_ed25519.pub "$HOME/.ssh/$*.pub"
    ;;

  tel) open "tel:$*" ;;

  tree) (
    cmd="${*:-$HOME/Sync/Camera}"
    cd "$cmd" && find . -print | sed "s#[^/]*/#|____#g;s#____|# |#g;1s#.*#$cmd#"
  ) ;;

  tz)
    cmd="$1"
    shift
    if [ "$cmd" = pdt ]; then
      cmd=PST8PDT
    elif [ "$cmd" = mdt ]; then
      cmd=MST7MDT
    elif [ "$cmd" = cdt ]; then
      cmd=CST6CDT
    elif [ "$cmd" = edt ]; then
      cmd=EST5EDT
    fi
    if [ -n "$cmd" ] && realpath -q "/usr/share/zoneinfo/$cmd" >/dev/null; then
      TZ="$cmd" "$@"
      return
    fi
    tz="$(cd /usr/share/zoneinfo && find ./* -type f -name '*[[:upper:]]*' ! -name +VERSION | sed 's#^./##')"
    if [ "$cmd" = 'date' ]; then
      # shellcheck disable=SC2016 # in sh -c
      tz="$(echo "$tz" | xargs -I{} sh -c 'printf "%s {}\n" "$(TZ={} date +%z)"')"
      echo "$tz" | grep '^-' | sort -r
      echo "$tz" | grep '^+' | sort
    else
      tz="$(echo "$tz" | sort)"
      echo "$tz" | grep /
      echo "$tz" | grep -v /
    fi
    ;;

  webp)
    cmd="$1"
    shift
    case "$cmd" in
    t)
      echo >&2 '==> 72B.webp <=='
      x webp | tee 72B.webp
      ;;
    *) printf "\x52\x49\x46\x46\x40\x00\x00\x00\x57\x45\x42\x50\x56\x50\x38\x58\x0a\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x41\x4c\x50\x48\x02\x00\x00\x00\x00\x00\x56\x50\x38\x20\x18\x00\x00\x00\x30\x01\x00\x9d\x01\x2a\x01\x00\x01\x00\x02\x00\x34\x25\xa4\x00\x03\x70\x00\xfe\xfb\x94\x00\x00" ;;
    esac
    ;;

  whois)
    # support whois -b example.com
    for name in "$@"; do :; done
    whois -c "${name##*.}" "$@"
    ;;

  x) (
    set -x
    "$@"
  ) ;;

  aud | cad | chf | cnh | cny | eur | gbp | hkd | jpy | mop | nzd | sek | sgd | thb | usd | zar)
    x fx "$cmd" | x bc "$(awk '{ print $3 }')" "$@"
    ;;

  am | at | au | bg | br | by | cn | cz | de | dk | ee | et | fi | fr | gb | gr | hk | hr | hu | ie | il | is | it | jp | kr | kz | lt | nl | no | nz | pl | pt | ro | ru | se | si | sk | tr | tw | ua | us | yu | za | dech | frbe | frca | frch | itch | nlbe | ca | es | eu | en)
    unset -v lang loc
    loc="$(locale -a)"
    lang="${lang:="$(echo "$loc" | grep --ignore-case "^.._$cmd$")"}"
    lang="${lang:="$(echo "$loc" | grep --ignore-case "^$(echo "$cmd" | sed 's/^\(..\)\(..\)$/\1_\2/')$")"}"
    lang="${lang:="$(echo "$loc" | grep "^${cmd}_..$")"}"
    lang="${lang:="$([ "$cmd" = 'en' ] && echo en_CA || echo '')"}"
    LC_ALL="$lang.UTF-8" "$@"
    ;;

  esac
}
