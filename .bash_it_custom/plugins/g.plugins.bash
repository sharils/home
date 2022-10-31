#!/usr/bin/env sh

temp=''
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
    dir="$(mktemp -d "/tmp/$(basename "${last%.*}")-$USER-XXXXXX")"
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

  s) tig status ;;

  t)
    if [ $# -eq 0 ]; then
      cd /tmp || return
    else
      [ ! -d "$temp" ] && temp="$(mktemp -d "/tmp/$*-$USER-XXXXXX")"
      cd "$temp" || return
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
