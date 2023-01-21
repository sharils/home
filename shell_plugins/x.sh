#!/usr/bin/env sh

x() {
  cmd="$1"
  shift

  case "$cmd" in

  +) chmod -vv +x "$@" ;;

  -) chmod -vv -x "$@" ;;

  8601) x b 'https://en.wikipedia.org/wiki/ISO_8601' ;;

  b) "$BROWSER" "$@" ;;

  bc) bc --mathlib --expression="$*" ;;

  cal) cal -A4 -B4 ;;

  cr) /Applications/Chromium.app/Contents/MacOS/Chromium "$@" ;;

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

  erl) erl -noshell -eval "$*,init:stop()." ;;

  ex) elixir -e "$*" ;;

  ff) /Applications/Firefox.app/Contents/MacOS/firefox "$@" ;;

  fde) /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox "$@" ;;

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

  fzf) fzf --select-1 --height=~14 --layout=reverse "$@" ;;

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

  ip) ipconfig getifaddr "${@:-en0}" ;;

  js) node --print "$*" ;;

  log) log show --predicate 'eventMessage CONTAINS "unlockUIBecomesActive"' --last "${@:-30m}" ;;

  mh)
    cmd="$HOME/tmp/miraheze/$(d F)"
    x mp "$cmd"
    mv ~/Downloads/smilingpuffinwiki_xml_*.xml.gz "$cmd"
    ;;

  mp) mkdir -pv "$@" ;;

  o) xargs -o "$@" ;;

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

  py) python3 -c "${*:-import this}" ;;

  resetLaunchPad | showHidden)
    defaults write com.apple.dock "$cmd" -bool true
    killall Dock
    ;;

  rfc)
    case "$1" in
      5424) x rfc "$*#page-11" ;;
      *) l x "https://www.rfc-editor.org/rfc/rfc$*" ;;
    esac
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
    cp ~/.ssh/id_ed25519.pub "$HOME/.ssh/$*.pub"
    ;;

  tb) /Applications/Tor\ Browser.app/Contents/MacOS/firefox "$@" ;;

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

  zws) printf "\xe2\x80\x8b" | c ;;

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
