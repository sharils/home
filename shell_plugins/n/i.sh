#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

i() {
  case "$1" in
  y) shift && npm init --yes "$@" ;;
  @capacitor/app | astro | expo-app | next-app | node-cli | nx-workspace | puck-app | react-app | react-native-app)
    app="$1" && shift
    npm init --yes "$app" -- "${@:-$app}"
    cd "${1:-$app}" || return
    ;;
  *)
    if [ -f package.json ]; then
      npm install "$@"
    else
      npm init "$@"
    fi
    ;;
  esac
}

i "$@"
