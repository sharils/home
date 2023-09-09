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

  cbc)
    g cbr || return $?
    g cb --merged |
      sed 's/^.* //' | grep -Ev '^(?:main|master|develop)$' |
      xargs git cb --delete
    ;;

  cbr) shift && "$SHARILS_HOME/shell_plugins/g/cbr.sh" "$@" ;;

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

  cmx) shift && g cm "Execute $*" ;;

  cs) shift && git-crypt status "$@" ;;

  czP) shift && g cz pop "$@" ;;

  f) shift && "$SHARILS_HOME/shell_plugins/g/f.sh" "$@" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/g/e.sh" "$@" ;;

  i) shift && "$SHARILS_HOME/shell_plugins/g/i.sh" "$@" ;;

  mr) shift && "$SHARILS_HOME/shell_plugins/g/mr.sh" "$@" ;;

  pr) shift && "$SHARILS_HOME/shell_plugins/g/pr.sh" "$@" ;;

  r) shift && "$SHARILS_HOME/shell_plugins/g/r.sh" "$@" ;;

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
