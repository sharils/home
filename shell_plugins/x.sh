#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x() {
  case "$1" in
  +) shift && chmod -vv +x "$@" ;;
  -) shift && chmod -vv -x "$@" ;;
  ./*) x rm "$@" ;;
  8601) x b 'https://en.wikipedia.org/wiki/ISO_8601' ;;
  b) shift && "$BROWSER" "$@" ;;
  chunk) shift && fold -w "${@:-3}" | tr '\n' ' ' ;;
  diff) shift && diff --color --unified "$@" ;;
  dig) shift && dig "@$(dig +nssearch "$@")" "$@" ;;
  fzf) shift && fzf --select-1 --height=~14 --layout=reverse "$@" ;;
  gpg) echo | gpg --clearsign >/dev/null ;;
  hostnameise) tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g' ;;
  ip) shift && ipconfig getifaddr "${@:-en0}" ;;
  js) shift && node --print "$*" ;;
  log) shift && log show --debug --info --predicate 'process == "loginwindow"' --style syslog --last "${@:-1h}" ;;
  mp) shift && mkdir -pv "$@" && cd "$@" || return ;;
  ncal) shift && ncal -wB1 -A6 ;;
  o) shift && "$SHARILS_HOME/shell_plugins/x/o.sh" "$@" ;;
  perm) shift && python -c 'import itertools,sys;[print(" ".join(p)) for p in itertools.permutations(sys.argv[1:])]' "$@" | sort | uniq ;;
  php) shift && php -r "$*" ;;
  screen) shift && screen -xRRe^Gg "$@" ;;
  ssh) shift && ssh -t "$@" screen -xRRe^Gg -T screen-256color ;;
  ssh-copy-id) shift && ssh-copy-id -o PreferredAuthentications=password -i "$HOME/.ssh/id_ed25519.pub" "$@" ;;
  tel) shift && open "tel:$*" ;;
  til) shift && "$SHARILS_HOME/shell_plugins/x/til.sh" "$@" ;;
  ts) shift && n y ts-node "$@" ;;
  unzip) shift && unzip "$1" -d "${1%%.*}" && cd "${1%%.*}" && ls ;;
  zws) printf "\xe2\x80\x8b" | c ;;

  ShowHidden) "$SHARILS_HOME/shell_plugins/x/showHidden.sh" "$@" ;;

  ResetLaunchPad)
    rm -rf "/private$(getconf DARWIN_USER_DIR)com.apple.dock.launchpad"
    killall Dock
    ;;

  aud | cad | chf | cnh | cny | eur | gbp | hkd | jpy | mop | nzd | sek | sgd | thb | usd | zar)
    cmd="$1" && shift
    x fx "$cmd" | x bc "$(awk '{ print $3 }')" '*' "${@:-1}"
    ;;

  $ | DS_Store | 217 | ai | ap | aq | bak | bank | batt | bc | bmi | cal | cat-weight | cert | cm | county-sunrise | cycle | data | download.sh | draculadaily | editorconfig | english-words | eq | erl | ex | fer | focus | fong | fx | getnf | gif | hbt | hospital | hrm | html | ico | iconv | id | jq | kibble | lab | law | mac | members | mh | ml | paisa | pdf | petfood | ping | pmdr | png | pvpi | py | rm | salary | scrcpy | sh | shutdown | smolsite | sn | sqlite | ssh-keygen | ss | su | title | tld | touch | traceroute | tree | tz | uri | uv | vcf | venv | webp | weight | whois | wthr | vimv | zip)
    cmd="$1" && shift
    "$SHARILS_HOME/shell_plugins/x/$cmd.sh" "$@"
    ;;

  am | at | au | bg | br | by | cn | cz | de | dk | ee | et | fi | fr | gb | gr | hk | hr | hu | ie | il | is | it | jp | kr | kz | lt | nl | no | nz | pl | pt | ro | ru | se | si | sk | tr | tw | ua | us | yu | za | dech | frbe | frca | frch | itch | nlbe | ca | es | eu | en) "$SHARILS_HOME/shell_plugins/x/currency.sh" "$@" ;;

  *)
    if [ -f "$1" ]; then
      x rm "$@"
      return $?
    fi
    (set -x && SET_X=1 "$@")
    ;;
  esac
}
