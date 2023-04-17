#!/usr/bin/env sh

p() {
  case "$1" in
  d) shift && npm pkg delete "$@" ;;

  e)
    shift
    if [ $# -ge 1 ]; then
      quickfix="$(mktemp)"
      grep --line-number --with-filename "$1" package.json >"$quickfix"
      shift
      case "$(wc -l <"$quickfix" | tr -d '[:space:]')" in
      0) return 1 ;;
      1) ;; # noop
      *) set -- +copen "$@" ;;
      esac
      set -- -q "$quickfix" "$@"
    fi
    $EDITOR "${@:-package.json}"
    ;;

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
