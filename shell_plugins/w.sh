#!/usr/bin/env sh

w() {
  case "$1" in

  c) shift && w rs cargo "$@" ;;

  d) shift && "$SHARILS_HOME/shell_plugins/w/d.sh" "$@" ;;

  eslint) shift && w js "npx eslint $*" ;;

  ex) shift && w m --pattern '**/*.ex' '**/*.exs' --run "${*:-mix test && mix format}" ;;

  js) shift && w m --pattern \
    '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' \
    '**/*.cjs' '**/*.cjsx' '**/*.cts' '**/*.ctsx' \
    '**/*.mjs' '**/*.mjsx' '**/*.mts' '**/*.mtsx' \
    --run "${*:-npm test}" ;;

  m)
    shift
    case "$1" in
    t)
      shift
      case "$1" in
      f) shift && set -- --failed "$@" ;;
      mf) shift && set -- --max-failures "${@:-1}" ;;
      esac
      w ex mix test "$@"
      ;;
    *) watchman-make "$@" ;;
    esac
    ;;

  py) shift && w m --pattern '**/*.py' --run "${*:-pytest}" ;;

  # -o OVERRIDE_INI, --override-ini=OVERRIDE_INI
  # -v, --verbose         Increase verbosity
  # -x, --exitfirst       Exit instantly on first error or failed test
  # --ff, --failed-first  Run all tests, but run the last failures first. This may
  pytest) shift && w py "pytest $*" ;;

  rs) shift && w m --pattern '**/*.rs' --run "${*:-cargo test}" ;;

  sh) shift && w m --pattern '**/*.sh' --run "$*" ;;

  tsc) shift && w js "npx tsc ${*:---noEmit}" ;;

  w) shift && watchman-wait --max-events 0 "$@" ;;

  *) "$@" | g uri | x fzf | xargs -o "$BROWSER" ;;

  esac
}
