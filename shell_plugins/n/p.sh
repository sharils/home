#!/usr/bin/env sh

p() {
  case "$1" in
  d) shift && npm pkg delete "$@" ;;

  g) shift && npm pkg get "$@" ;;

  s)
    shift
    case "$1" in
    s)
      shift
      cmd="$1" && shift
      p s scripts."$cmd"="$*"
      ;;
    *) npm pkg set "$@" ;;
    esac
    ;;
  init) echo {} >.prettierrc.json ;;

  awk | eex | elm | groovy | nginx | packagejson | pegjs | pgsql | sh | sql | ssh-config | tsconfig) n y --package prettier --package "prettier-plugin-$1" -- prettier --parser "$@" ;;

  *) npx --yes prettier --write "**/*.js" "**/*.jsx" "**/*.ts" "**/*.tsx" "$@" ;;
  esac
}

p "$@"
