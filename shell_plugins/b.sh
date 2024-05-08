#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

b() {
  if [ ! -t 0 ]; then
    col -bx | bat --language "${@:-man}"
    return
  fi

  for arg in "$@"; do
    if [ -f "$arg" ]; then
      bat "$@"
      return
    fi
  done

  if echo "$1" | g uri >/dev/null; then
    browsh "$@"
    return
  fi

  case "$1" in
  b) shift && "$SHARILS_HOME/shell_plugins/b/b.sh" "$@" ;;
  cr) shift && BROWSER=/Applications/Chromium.app/Contents/MacOS/Chromium "$@" ;;
  e) shift && "$SHARILS_HOME/shell_plugins/b/e.sh" "$@" ;;
  f)
    shift
    BROWSER=/Applications/Firefox.app/Contents/MacOS/firefox
    case "$1" in
    sc) $BROWSER "about:certificate?cert=$(
      openssl s_client -connect example.com:443 2>/dev/null </dev/null |
        sed -n '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' |
        sed '/^-/d' |
        tr -d \\n |
        jq --raw-input --raw-output @uri
    )" ;;
    *) BROWSER=$BROWSER "$@" ;;
    esac
    ;;
  fde) shift && BROWSER=/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox "$@" ;;
  i)
    shift
    case "$1" in
    c) shift && set -- --cask "$@" ;;
    esac
    brew install "$@"
    ;;
  l) shift && "$SHARILS_HOME/shell_plugins/b/l.sh" "$@" ;;
  n) shift && BROWSER=none "$@" ;;
  o) shift && BROWSER=open "$@" ;;
  out) shift && brew outdated "$@" ;;
  ri) shift && brew reinstall "$@" ;;
  s) shift && brew -S "$@" ;;
  tb) shift && BROWSER=/Applications/Tor\ Browser.app/Contents/MacOS/firefox "$@" ;;
  u) shift && brew upgrade "$@" ;;
  v) shift && brew abv "$@" ;;
  x) shift && BROWSER=/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox "$@" ;;
  c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | jsx | lua | md | mdx | mw | pegjs | php | py | rs | scss | sh | sql | story | ts | tsx | txt | wat | xhtml | yaml | yml | zep) bat --language "$@" ;;
  *) brew "$@" ;;
  esac
}
