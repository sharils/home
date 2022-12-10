#!/usr/bin/env sh

x() {
  cmd="$1"
  shift

  case "$cmd" in

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
    return $?
    ;;

  gpg) echo | gpg --clearsign >/dev/null ;;

  gif) printf "\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x80\x00\x00\xff\xff\xff\x00\x00\x00\x21\xf9\x04\x01\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02\x02\x44\x01\x00\x3b" ;;

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

  pdf) printf "\x25\x50\x44\x46\x2d\x31\x2e\x0a\x31\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x50\x61\x67\x65\x73\x20\x32\x20\x30\x20\x52\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x32\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x4b\x69\x64\x73\x5b\x33\x20\x30\x20\x52\x5d\x2f\x43\x6f\x75\x6e\x74\x20\x31\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x33\x20\x30\x20\x6f\x62\x6a\x3c\x3c\x2f\x50\x61\x72\x65\x6e\x74\x20\x32\x20\x30\x20\x52\x3e\x3e\x65\x6e\x64\x6f\x62\x6a\x0a\x74\x72\x61\x69\x6c\x65\x72\x20\x3c\x3c\x2f\x52\x6f\x6f\x74\x20\x31\x20\x30\x20\x52\x3e\x3e" ;;

  php) php -r "$*" ;;

  png) printf "\x89\x50\x4e\x47\x0d\x0a\x1a\x0a\x00\x00\x00\x0d\x49\x48\x44\x52\x00\x00\x00\x01\x00\x00\x00\x01\x08\x04\x00\x00\x00\xb5\x1c\x0c\x02\x00\x00\x00\x0b\x49\x44\x41\x54\x78\xda\x63\x64\x60\x00\x00\x00\x06\x00\x02\x30\x81\xd0\x2f\x00\x00\x00\x00\x49\x45\x4e\x44\xae\x42\x60\x82" ;;

  py) python3 -c "$*" ;;

  resetLaunchPad | showHidden)
    defaults write com.apple.dock "$cmd" -bool true
    killall Dock
    ;;

  screen) screen -xRRe^Gg "$@" ;;

  ssh) ssh -t "$@" screen -xRRe^Gg ;;

  ssh-copy-id) ssh-copy-id -o PreferredAuthentications=password -i "$HOME/.ssh/id_rsa.pub" "$@" ;;

  ssh-keygen)
    ssh-keygen -f ~/.ssh/id_ed25519 -t ed25519 -C "${@:?}"
    pbcopy <~/.ssh/id_ed25519.pub
    pbpaste
    mv ~/.ssh/id_ed25519.pub "$HOME/.ssh/$*.pub"
    ;;

  tel) open "tel:$*" ;;

  tree) find "${@:-/$HOME/Sync/Camera}" -print | sed 's;[^/]*/;|____;g;s;____|; |;g' ;;

  whois)
    # support whois -b example.com
    for name in "$@"; do :; done
    whois -c "${name##*.}" "$@"
    ;;

  esac
}
