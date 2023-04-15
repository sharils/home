#!/usr/bin/env sh

x() {
  cmd="$1"
  shift

  case "$cmd" in

  +) chmod -vv +x "$@" ;;

  -) chmod -vv -x "$@" ;;

  8601) x b 'https://en.wikipedia.org/wiki/ISO_8601' ;;

  ai) "$SHARILS_HOME/shell_plugins/x/ai.sh" "$@" ;;

  ap) "$SHARILS_HOME/shell_plugins/x/ap.sh" "$@" ;;

  b) "$BROWSER" "$@" ;;

  bc) "$SHARILS_HOME/shell_plugins/x/bc.sh" "$@" ;;

  cal) cal -A4 -B4 ;;

  chunk) fold -w "${@:-3}" | tr '\n' ' ' ;;

  cr) /Applications/Chromium.app/Contents/MacOS/Chromium "$@" ;;

  data) "$SHARILS_HOME/shell_plugins/x/data.sh" "$@" ;;

  diff) diff --color --unified "$@" ;;

  editorconfig) "$SHARILS_HOME/shell_plugins/x/editorconfig.sh" "$@" ;;

  erl) "$SHARILS_HOME/shell_plugins/x/erl.sh" "$@" ;;

  ex) "$SHARILS_HOME/shell_plugins/x/ex.sh" "$@" ;;

  f) /Applications/Firefox.app/Contents/MacOS/firefox "$@" ;;

  fde) /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox "$@" ;;

  focus)
    now="$(date +%H%m)"
    [ "$now" -lt '1900' ] || [ '1930' -lt "$now" ]
    ;;

  fx) "$SHARILS_HOME/shell_plugins/x/fx.sh" "$@" ;;

  fzf) fzf --select-1 --height=~14 --layout=reverse "$@" ;;

  gpg) echo | gpg --clearsign >/dev/null ;;

  gif) "$SHARILS_HOME/shell_plugins/x/gif.sh" "$@" ;;

  hostnameise) tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g' ;;

  html) "$SHARILS_HOME/shell_plugins/x/html.sh" "$@" ;;

  ico) "$SHARILS_HOME/shell_plugins/x/ico.sh" "$@" ;;

  ip) ipconfig getifaddr "${@:-en0}" ;;

  js) node --print "$*" ;;

  log) log show --predicate 'eventMessage CONTAINS "unlockUIBecomesActive"' --last "${@:-1h}" ;;

  mh)
    dir="$HOME/git/github.com/sharils/~miraheze/$(d F)"
    x mp "$dir"
    mv -v ~/Downloads/smilingpuffinwiki_xml_*.xml.gz "$dir"
    ;;

  mp) mkdir -pv "$@" && cd "$@" || return ;;

  o) open "${@:-.}" ;;

  pdf) "$SHARILS_HOME/shell_plugins/x/pdf.sh" "$@" ;;

  php) php -r "$*" ;;

  png) "$SHARILS_HOME/shell_plugins/x/png.sh" "$@" ;;

  py)
    if [ $# -eq 0 ]; then
      python3
    else
      python3 -c "$*"
    fi
    ;;

  resetLaunchPad | showHidden)
    defaults write com.apple.dock "$cmd" -bool true
    killall Dock
    ;;

  rm) "$SHARILS_HOME/shell_plugins/x/rm.sh" "$@" ;;

  screen) screen -xRRe^Gg "$@" ;;

  sh) "$SHARILS_HOME/shell_plugins/x/sh.sh" "$@" ;;

  shuf) tr ' ' '\n' | sort --random-sort | tr '\n' ' ' ;;

  sn) "$SHARILS_HOME/shell_plugins/x/sn.sh" "$@" ;;

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

  touch)
    x mp "$(dirname "$*")"
    touch "$*"
    ;;

  tree) (
    cmd="${*:-$HOME/Sync/Camera}"
    cd "$cmd" && find . -print | sed "s#[^/]*/#|____#g;s#____|# |#g;1s#.*#$cmd#"
  ) ;;

  ts) n y ts-node "$@" ;;

  tz) "$SHARILS_HOME/shell_plugins/x/tz.sh" "$@" ;;

  venv) "$SHARILS_HOME/shell_plugins/x/venv.sh" "$@" ;;

  w8)
    cmd="$HOME/Sync/Libera PRO/${2:?}.txt"
    curl --compressed --location --silent --output "$cmd" "https://dl1.wenku8.com/down.php?type=big5&id=${1:?}"
    echo "$cmd" | pbcopy
    pbpaste
    ;;

  webp) "$SHARILS_HOME/shell_plugins/x/webp.sh" "$@" ;;

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

  *) echo not implemented >&2 ;;

  esac
}
