#!/usr/bin/env sh
# dep: z.plugins.bash

g() {
  if ! [ -t 0 ]; then
    "$SHARILS_HOME/shell_plugins/g/STDIN.sh" "$@"
    return $?
  fi
  if ! [ -t 1 ] && [ "$1" = 's' ]; then
    git status
    return
  fi
  if [ $# -eq 1 ] && [ -f "$1" ] || [ $# -eq 0 ] || { echo "$1" | grep -E '^[0-9a-z]{7}$' >/dev/null; }; then
    tig "$@"
    return
  fi

  case "$1" in

  L) shift && tig reflog "$@" ;;

  a.) shift && g a . "$@" ;;

  cgi) shift && git config --file ~/git/github.com/sharils/home/gitignore.gitconfig "$@" ;;

  cl)
    shift
    case "$1" in
    e) git config --local "${@:---edit}" ;;
    t | *)
      if [ -f "$1" ]; then
        git cl "$@"
        return $?
      fi
      case "$1" in
      ~) shift && x mp "$HOME$(dirname "$(echo "$*" | sed 's#https:/#git#;s#[@:]#/#g;s#^#/#')")" ;;
      t) shift && z t ;;
      esac
      git clone "$@"
      for last in "$@"; do :; done
      last="$(basename "$last")"
      cd "${last%.*}" || return
      ;;
    esac
    ;;

  cs) shift && git-crypt status "$@" ;;

  czP) shift && g cz pop "$@" ;;

  s) shift && tig status "$@" ;;

  stripspace) shift && git grep -I --files-with-matches ' \{1,\}$' | xargs sed -i '' 's/ \{1,\}$//' ;;

  u~) shift && g u @~ ;;

  y) shift && tig stash "$@" ;;

  w)
    cmd="$(git config remote.origin.url | tr ':' /)"
    cmd="${cmd%%.git}"
    w echo "https://${cmd##git@}"
    ;;

  -*) shift && grep "$@" ;;

  cb | f | e | i | mr | pr | r) cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/g/$cmd.sh" "$@" ;;

  *)
    if [ $# -eq 1 ] && [ -f "$1" ] && [ "$1" != a ] && [ "$1" != add ] &&
      [ "$1" != rm ]; then
      grep "$@"
    else
      git "$@"
    fi
    ;;

  esac
}
