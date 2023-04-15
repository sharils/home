#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  S) n start "$@" ;;

  agpl) n license AGPL-3.0 "$@" ;;

  a) n android "$@" ;;

  b) n build "$@" ;;

  bs) n browser-sync "${@:-.}" --no-open ;;

  bsd) n license BSD-3-Clause "$@" ;;

  cnc | clear-npx-cache)
    find "$(npm config get cache)/_npx" -depth 2 -name 'package.json' | while IFS= read -r package; do
      if [ "$(jq -r '.dependencies | keys | first' <"$package")" = "${1:?}" ]; then
        (set -x && rm -fr "${package%/package.json}")
        return
      fi
    done
    ;;

  cu) n npm-check-updates "$@" ;;

  d)
    if [ $# -eq 0 ]; then
      npm run dev
      return
    fi
    npm docs "$@"
    ;;

  dg)
    for last in "$@"; do :; done
    z t "$(basename "${last%#*}")"
    n degit "$@"
    ;;

  eas) n eas-cli "$@" ;;

  g) npm --global "$@" ;;

  gi) n gitignore "${@:-node}" ;;

  graphql-codegen) n y --package graphql --package @graphql-codegen/cli -- graphql-codegen "$@" ;;

  i) "$SHARILS_HOME/shell_plugins/n/i.sh" "$@" ;;

  krampus)
    # Named after https://www.npmjs.com/package/krampus
    pid="$(lsof -ti "tcp:$*")"
    kill -TERM "$pid" || kill -KILL "$pid"
    ;;

  l)
    if [ $# -eq 0 ]; then
      set -- --fix . "$@"
    fi
    n eslint "$@"
    ;;

  lpd) NPM_CONFIG_LEGACY_PEER_DEPS='1' "$@" ;;

  lv) NPM_CONFIG_LOGLEVEL='verbose' "$@" ;;

  mkcert) "$SHARILS_HOME/shell_plugins/n/mkcert.sh" "$@" ;;

  p) "$SHARILS_HOME/shell_plugins/n/p.sh" "$@" ;;

  pkill)
    if [ $# -eq 0 ]; then
      rm -fr ./node_modules
    else
      n y npkill "$@"
    fi
    ;;

  qt) n qrcode-terminal "$@" ;;

  r) n run "$@" ;;

  serve)
    [ -f cert.crt ] && [ -f cert.key ] && set -- --ssl-cert cert.crt --ssl-key cert.key
    n y serve "$@"
    ;;

  tsc) n y tsc --noEmit "$@" ;;

  vercel) n y vercel --token="${VERCEL_TOKEN:?}" "$@" ;;

  w) n web "$@" ;;

  y) npx --yes "$@" ;;

  yo) n y --package yo --package "generator-$1" -- yo "$@" ;;

  *)
    if script="$(npm pkg get "scripts.$cmd" 2>/dev/null)" &&
      [ "$script" != '{}' ]; then
      npm run "$cmd" -- "$@"
      return
    fi

    case "$cmd" in
    @ionic/cli | @neutralinojs/neu | @sandworm/audit | baapan | backstopjs | browser-sync | bundle-phobia | chance-cli | codesandbox | composerize | cost-of-modules | covgen | csv2json | cypress | degit | depcruise | eas-cli | eslint | expo | gitignore | jscodeshift | jscpd | knip | license | license-checker | lighthouse | mkcert | nanoid | newman | nginx-linter | npm-check | npm-check-updates | npm-merge-driver | nve | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | pwned | pythagora | qnm | qrcode-terminal | react-devtools | react-native | readme-md-generator | resume-cli | selenium-side-runner | trello-cli | trucker | ts-node | twify | unimported | verdaccio | why-is-node-running | wait-on) n y "$cmd" "$@" ;;

    *) npm "$cmd" "$@" ;;
    esac
    ;;

  esac
}
