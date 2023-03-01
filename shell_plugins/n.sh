#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  S) n start "$@" ;;

  agpl) n license AGPL-3.0 "$@" ;;

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

  d) npm docs "$@" ;;

  dg)
    for last in "$@"; do :; done
    z t "$(basename "${last%#*}")"
    n degit "$@"
    ;;

  esl)
    if [ $# -eq 0 ]; then
      n eslint --fix .
    else
      n eslint "$@"
    fi
    ;;

  gi) n gitignore "${@:-node}" ;;

  graphql-codegen) n y --package graphql --package @graphql-codegen/cli -- graphql-codegen "$@" ;;

  i)
    case "$1" in
    y) shift && npm init --yes "$@" ;;
    @capacitor/app | expo-app | next-app | node-cli | nx-workspace | react-app | react-native-app) n i y "$1" -- "${@:-"$1"}" && cd "$1" || return ;;
    *) npm install "$@" ;;
    esac
    ;;

  krampus)
    # Named after https://www.npmjs.com/package/krampus
    pid="$(lsof -ti "tcp:$*")"
    kill -TERM "$pid" || kill -KILL "$pid"
    ;;

  lpd) NPM_CONFIG_LEGACY_PEER_DEPS='1' "$@" ;;

  lv) NPM_CONFIG_LOGLEVEL='verbose' "$@" ;;

  mkcert)
    case "$1" in
    ca)
      [ ! -e ./ca.crt ] && [ ! -e ./ca.key ] &&
        n y mkcert create-ca --organization '# Test CA' --validity 1
      ;;
    cert)
      [ ! -e ./cert.crt ] && [ ! -e ./cert.key ] &&
        n y mkcert create-cert --validity 1 --domains "${N_MKCERT_DOMAINS:-localhost,127.0.0.1}"
      ;;
    clean)
      rm ca.crt ca.key cert.crt cert.key
      ;;
    refresh)
      n mkcert clean
      n mkcert
      ;;
    *)
      n mkcert ca
      n mkcert cert
      ;;
    esac
    ;;

  na)
    cmd="$1"
    shift
    n nx-workspace --name "$(basename "$PWD")" --preset next --appName "${cmd:-appName}" --style scss --nxCloud "$@"
    ;;

  p)
    cmd="$1"
    shift
    case "$cmd" in
    d) npm pkg delete "$@" ;;
    g) npm pkg get "$@" ;;
    s)
      cmd="$1"
      shift
      case "$cmd" in
      s)
        cmd="$1"
        shift
        n p s scripts."$cmd"="$*"
        ;;
      *) npm pkg set "$cmd" "$@" ;;
      esac
      ;;
    init) echo {} >.prettierrc.json ;;
    awk | eex | elm | groovy | nginx | packagejson | pegjs | pgsql | sh | sql | ssh-config | tsconfig) n y --package prettier --package "prettier-plugin-$cmd" -- prettier --parser "$cmd" "$@" ;;
    *) n y prettier --write "**/*.js" "**/*.jsx" "**/*.ts" "**/*.tsx" "$@" ;;
    esac
    ;;

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

  vercel) n y vercel --token="${VERCEL_TOKEN:?}" "$@" ;;

  y) npx --yes "$@" ;;

  yo) n y --package yo --package "generator-$1" -- yo "$@" ;;

  *)
    if script="$(npm pkg get "scripts.$cmd" 2>/dev/null)" &&
      [ "$script" != '{}' ]; then
      npm run "$cmd" -- "$@"
      return
    fi

    case "$cmd" in
    @ionic/cli | @neutralinojs/neu | baapan | backstopjs | browser-sync | bundle-phobia | chance-cli | codesandbox | composerize | cost-of-modules | covgen | csv2json | cypress | degit | depcruise | eslint | gitignore | jscodeshift | jscpd | knip | license | license-checker | lighthouse | mkcert | nanoid | newman | nginx-linter | npm-check | npm-check-updates | npm-merge-driver | nve | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | pwned | pythagora | qnm | qrcode-terminal | react-devtools | react-native | readme-md-generator | resume-cli | selenium-side-runner | trello-cli | trucker | twify | unimported | verdaccio | why-is-node-running | wait-on) n y "$cmd" "$@" ;;

    *) npm "$cmd" "$@" ;;
    esac
    ;;

  esac
}
