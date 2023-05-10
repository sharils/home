#!/usr/bin/env sh

i() {
  set -x
  case "$1" in
  y) shift && npm init --yes "$@" ;;
  @capacitor/app | expo-app | next-app | node-cli | nx-workspace | react-app | react-native-app)
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
