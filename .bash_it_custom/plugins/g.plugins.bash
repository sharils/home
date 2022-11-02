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

  clt)
    for last in "$@"; do :; done
    z t "$(basename "${last%.*}")"
    git clone "$@" "$PWD"
    ;;

  cma) git commit --message "Apply $*" ;;

  f) git flow "$@" ;;

  h) man git-"$*" ;;

  i)
    git init "$@"
    git commit --allow-empty --message "Initialize empty Git repository"
    ;;

  ia)
    g i "$@"
    git commit --all --untracked-files
    ;;

  r) tig refs "$@" ;;

  s) tig status "$@" ;;

  v) vim ~/git/github.com/sharils/home/.gitconfig ;;

  y) git stash "$@" ;;

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
