#!/usr/bin/env sh

random="$(awk 'BEGIN { srand(); print int(rand()*32768) }' /dev/null)"

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
    dir="/tmp/$(basename "${last%.*}")-$random"
    git clone "$@" "$dir"
    cd "$dir" || return
    ;;

  cma) git commit --message "Apply $*" ;;

  dl) cd ~/Downloads || return ;;

  h) man git-"$*" ;;

  i)
    git init
    git commit --allow-empty --message "Initialize empty Git repository"
    ;;

  ia)
    g i
    git commit --all --untracked-files
    ;;

  r) tig refs ;;

  rs) git reset "$@" ;;

  s) tig status ;;

  t)
    if [ $# -eq 0 ]; then
      cd /tmp || return
    else
      mkdir -p "/tmp/$*-$USER-$random"
      cd "/tmp/$*-$USER-$random" || return
    fi
    ;;

  v) vim ~/git/github.com/sharils/home/.gitconfig ;;

  ~t) cd ~/tmp || return ;;

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
