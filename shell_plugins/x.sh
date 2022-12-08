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

  hostnameise) tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g' ;;

  js) node --print "$*" ;;

  log) log show --predicate 'eventMessage CONTAINS "unlockUIBecomesActive"' --last "${@:-30m}" ;;

  m) mkdir -p "$@" ;;

  o) open "${@:-.}" ;;

  php) php -r "$*" ;;

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
