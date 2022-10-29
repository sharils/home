#!/usr/bin/env sh

random="$(awk 'BEGIN { srand(); print int(rand()*32768) }' /dev/null)"

g() {
  if [ $# -eq 0 ]; then
    tig
    return
  fi

  case $1 in
  clt)
    shift
    for last in "$@"; do :; done
    dir="/tmp/$(basename "${last%.*}")-$random"
    echo "$dir"
    git clone "$@" "$dir"
    cd "$dir" || exit
    ;;
  cma)
    git commit --message "Apply $*"
    ;;
  i)
    git init
    git commit --allow-empty --message "Initialize empty Git repository"
    ;;
  ia)
    g i
    git add .
    git commit
    ;;
  r)
    tig refs
    ;;
  s)
    tig status
    ;;
  *)
    git "$@"
    ;;
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
