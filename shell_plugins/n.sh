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

  dg)
    shift
    for last in "$@"; do :; done
    z t "$(basename "${last%#*}")"
    n degit "$@"
    ;;

  eas) shift && n eas-cli "$@" ;;

  ef) cmd="${1:-.env}" && shift && NPM_CONFIG_ENV_FILE="$cmd" "$@" ;;

  g) shift && NPM_CONFIG_GLOBAL='1' npm "$@" ;;

  gi) shift && n gitignore "${@:-node}" ;;

  jq) shift && jq <package.json "$@" ;;

  lpd) shift && NPM_CONFIG_LEGACY_PEER_DEPS='1' "$@" ;;

  lv) shift && NPM_CONFIG_LOGLEVEL='verbose' "$@" ;;

  qt) shift && n qrcode-terminal "$@" ;;

  r) shift && n run "$@" ;;

  rg) shift && rg "$@" package.json ;;

  vercel) shift && n y vercel --token="${VERCEL_TOKEN:?}" "$@" ;;

  w) shift && n web "$@" ;;

  y) shift && npx --yes "$@" ;;

  cnc) shift && n clear-npx-cache "$@" ;;

  clear-npx-cache | d | e | i | graphql-codegen | krampus | l | mkcert | p | pkill | serve | tsc | yo) cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/n/$cmd.sh" "$@" ;;

  @ionic/cli | @mermaid-js/mermaid-cli | @neutralinojs/neu | @sandworm/audit | baapan | backstopjs | browser-sync | bundle-phobia | chance-cli | codesandbox | composerize | cost-of-modules | covgen | csv2json | cypress | degit | depcruise | eas-cli | eslint | expo | gitignore | jscodeshift | jscpd | knip | license | license-checker | lighthouse | nanoid | newman | nginx-linter | npm-check | npm-check-updates | npm-merge-driver | nve | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | pwned | pythagora | qnm | qrcode-terminal | react-devtools | react-native | readme-md-generator | resume-cli | selenium-side-runner | trello-cli | trucker | ts-node | ts-to-jsdoc | twify | unimported | verdaccio | web-ext | why-is-node-running | wait-on) n y "$@" ;;

  *)
    tmp="$(npm pkg get "scripts.$1" 2>/dev/null)"
    if [ -n "$tmp" ] && [ "$tmp" != '{}' ]; then
      tmp="$1" && shift && set -- run "$tmp" -- "$@"
    fi
    npm "$@"
    ;;

  esac
}
