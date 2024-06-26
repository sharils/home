#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

w() {
  if [ $# -eq 0 ]; then
    whoami
    return
  fi

  case "$1" in

  8) shift && "$SHARILS_HOME/shell_plugins/w/8.sh" "$@" ;;

  c) shift && w rs cargo "$@" ;;

  clear)
    shift
    watchman watch-del "$PWD"
    watchman watch-project "$PWD"
    ;;

  d) shift && "$SHARILS_HOME/shell_plugins/w/d.sh" "$@" ;;

  eslint) shift && w js "npx eslint $*" ;;

  ex) shift && w m --pattern '**/*.ex' '**/*.exs' '**/*.heex' --run "${*:-mix test && mix format}" ;;

  js) shift && "$SHARILS_HOME/shell_plugins/w/js.sh" "$@" ;;

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

  py) shift && "$SHARILS_HOME/shell_plugins/w/py.sh" "$@" ;;

  pytest) shift && "$SHARILS_HOME/shell_plugins/w/pytest.sh" "$@" ;;

  rs) shift && w m --pattern '**/*.rs' --run "${*:-cargo test}" ;;

  sh) shift && w m --pattern '**/*.sh' --run "$*" ;;

  tsc) shift && w js "npx tsc ${*:---noEmit}" ;;

  w) shift && watchman-wait --max-events 0 "$@" ;;

  *) "$@" | g uri | x fzf | xargs -o "$BROWSER" ;;

  esac
}
