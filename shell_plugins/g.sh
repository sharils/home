#!/usr/bin/env sh
# dep: z.plugins.bash

g() {
  if [ $# -eq 0 ]; then
    tig
    return
  elif [ -s "$1" ]; then
    tig "$@"
    return
  fi

  cmd=$1
  shift
  case $cmd in

  cgi) git config --file ~/git/github.com/sharils/home/gitignore.gitconfig "$@" ;;

  cl)
    case "$1" in
    -e) git config --local "$@" ;;
    t | *)
      if [ "$1" = 't' ]; then
        shift
        z t
      fi
      git clone "$@"
      for last in "$@"; do :; done
      last="$(basename "$last")"
      cd "${last%.*}" || return
      ;;
    esac
    ;;

  cma) git commit --message "Apply $*" ;;

  h) man git-"$*" ;;

  i)
    git init "$@"
    git commit --allow-empty --message "Initialize empty Git repository"
    ;;

  ia)
    g i "$@"
    git commit --all --untracked-files
    ;;

  mr)
    cmd="$1"
    shift
    case "$cmd" in
    c) glab mr create --assignee "${G_MR_ASSIGNEE:?}" --reviewer "${G_MR_REVIEWER:?}" --target-branch "${G_MR_TARGET_BRANCH:-develop}" "$@" ;;
    u) glab mr update "$@" ;;
    *) glab mr "$cmd" "$@" ;;
    esac
    ;;

  r) tig refs "$@" ;;

  s) tig status "$@" ;;

  y) git stash "$@" ;;

  yls) tig stash "$@" ;;

  *) git "$cmd" "$@" ;;

  esac
}

# _get_last_commit() {
#     filename="$(basename "$1")"
#     git log --pretty=format:'%H' -1 install
# }
#
# gcff() {
#     git commit --fixup "$(_get_last_commit "$1")"
# }
#
# gcsf() {
#     git commit --squash "$(_get_last_commit "$1")"
# }
