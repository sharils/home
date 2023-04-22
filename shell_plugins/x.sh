#!/usr/bin/env sh

x() {
  case "$1" in
  +) shift && chmod -vv +x "$@" ;;
  -) shift && chmod -vv -x "$@" ;;
  8601) x b 'https://en.wikipedia.org/wiki/ISO_8601' ;;
  b) shift && "$BROWSER" "$@" ;;
  cal) cal -A4 -B4 ;;
  chunk) shift && fold -w "${@:-3}" | tr '\n' ' ' ;;
  cr) shift && /Applications/Chromium.app/Contents/MacOS/Chromium "$@" ;;
  diff) shift && diff --color --unified "$@" ;;
  dig) shift && dig "@$(dig +nssearch "$@")" "$@" ;;
  f) shift && /Applications/Firefox.app/Contents/MacOS/firefox "$@" ;;
  fde) shift && /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox "$@" ;;
  fzf) shift && fzf --select-1 --height=~14 --layout=reverse "$@" ;;
  gpg) echo | gpg --clearsign >/dev/null ;;
  hostnameise) tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g' ;;
  ip) shift && ipconfig getifaddr "${@:-en0}" ;;
  js) node --print "$*" ;;
  log) shift && log show --predicate 'eventMessage CONTAINS "unlockUIBecomesActive"' --last "${@:-1h}" ;;
  mp) shift && mkdir -pv "$@" && cd "$@" || return ;;
  o) shift && open "${@:-.}" ;;
  php) shift && php -r "$*" ;;
  screen) shift && screen -xRRe^Gg "$@" ;;
  shuf) tr ' ' '\n' | sort --random-sort | tr '\n' ' ' ;;
  ssh) shift && ssh -t "$@" screen -xRRe^Gg ;;
  ssh-copy-id) shift && ssh-copy-id -o PreferredAuthentications=password -i "$HOME/.ssh/id_ed25519.pub" "$@" ;;
  tb) shift && /Applications/Tor\ Browser.app/Contents/MacOS/firefox "$@" ;;
  tel) shift && open "tel:$*" ;;
  ts) shift && n y ts-node "$@" ;;
  zws) printf "\xe2\x80\x8b" | c ;;

  resetLaunchPad | showHidden) "$SHARILS_HOME/shell_plugins/x/resetLaunchPad.sh" "$@" ;;

  aud | cad | chf | cnh | cny | eur | gbp | hkd | jpy | mop | nzd | sek | sgd | thb | usd | zar)
    cmd="$1" && shift
    x fx "$cmd" | x bc "$(awk '{ print $3 }')" "$@"
    ;;

  ai | ap | bc | data | editorconfig | erl | ex | focus | fx | gif | html | ico | mh | pdf | png | py | rm | sh | sn | ssh-keygen | touch | tree | tz | venv | w8 | webp | whois)
    cmd="$1" && shift
    "$SHARILS_HOME/shell_plugins/x/$cmd.sh" "$@"
    ;;

  am | at | au | bg | br | by | cn | cz | de | dk | ee | et | fi | fr | gb | gr | hk | hr | hu | ie | il | is | it | jp | kr | kz | lt | nl | no | nz | pl | pt | ro | ru | se | si | sk | tr | tw | ua | us | yu | za | dech | frbe | frca | frch | itch | nlbe | ca | es | eu | en) "$SHARILS_HOME/shell_plugins/x/currency.sh" "$@" ;;

  *) (set -x && "$@") ;;
  esac
}
