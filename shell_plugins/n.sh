#!/usr/bin/env sh

n() {
  case $1 in

  S) shift && n start "$@" ;;

  agpl) shift && n license AGPL-3.0 "$@" ;;

  a) shift && n android "$@" ;;

  b) shift && n build "$@" ;;

  bs) shift && n browser-sync "${@:-.}" --no-open ;;

  bsd) shift && n license BSD-3-Clause "$@" ;;

  cu) shift && n npm-check-updates "$@" ;;

  d) shift && "$SHARILS_HOME/shell_plugins/n/d.sh" "$@" ;;

  dg)
    shift
    for last in "$@"; do :; done
    z t "$(basename "${last%#*}")"
    n degit "$@"
    ;;

  eas) shift && n eas-cli "$@" ;;

  g) shift && npm --global "$@" ;;

  gi) shift && n gitignore "${@:-node}" ;;

  graphql-codegen) shift && n y --package graphql --package @graphql-codegen/cli -- graphql-codegen "$@" ;;

  i) shift && "$SHARILS_HOME/shell_plugins/n/i.sh" "$@" ;;

  krampus) shift && "$SHARILS_HOME/shell_plugins/n/krampus.sh" "$@" ;;

  l)
    shift
    [ $# -eq 0 ] && set -- --fix . "$@"
    n eslint "$@"
    ;;

  lpd) shift && NPM_CONFIG_LEGACY_PEER_DEPS='1' "$@" ;;

  lv) shift && NPM_CONFIG_LOGLEVEL='verbose' "$@" ;;

  mkcert) shift && "$SHARILS_HOME/shell_plugins/n/mkcert.sh" "$@" ;;

  p) shift && "$SHARILS_HOME/shell_plugins/n/p.sh" "$@" ;;

  pkill) shift && "$SHARILS_HOME/shell_plugins/n/pkill.sh" "$@" ;;

  qt) shift && n qrcode-terminal "$@" ;;

  r) shift && n run "$@" ;;

  serve) shift && "$SHARILS_HOME/shell_plugins/n/serve.sh" "$@" ;;

  tsc) shift && n y tsc --noEmit "$@" ;;

  vercel) shift && n y vercel --token="${VERCEL_TOKEN:?}" "$@" ;;

  w) shift && n web "$@" ;;

  y) shift && npx --yes "$@" ;;

  yo) shift && n y --package yo --package "generator-$1" -- yo "$@" ;;

  cnc | clear-npx-cache) shift && "$SHARILS_HOME/shell_plugins/n/clear-npx-cache.sh" "$@" ;;

  @ionic/cli | @neutralinojs/neu | @sandworm/audit | baapan | backstopjs | browser-sync | bundle-phobia | chance-cli | codesandbox | composerize | cost-of-modules | covgen | csv2json | cypress | degit | depcruise | eas-cli | eslint | expo | gitignore | jscodeshift | jscpd | knip | license | license-checker | lighthouse | nanoid | newman | nginx-linter | npm-check | npm-check-updates | npm-merge-driver | nve | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | pwned | pythagora | qnm | qrcode-terminal | react-devtools | react-native | readme-md-generator | resume-cli | selenium-side-runner | trello-cli | trucker | ts-node | twify | unimported | verdaccio | why-is-node-running | wait-on) n y "$@" ;;

  *)
    tmp="$(npm pkg get "scripts.$1" 2>/dev/null)"
    if [ -n "$tmp" ] && [ "$tmp" != '{}' ] ; then
      tmp="$1" && shift && set -- run "$tmp" -- "$@"
    fi
    npm "$@"
    ;;

  esac
}
