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

  cma) g cm "Apply $*" ;;

  cs) git-crypt status "$@" ;;

  h) man git-"$*" ;;

  i)
    git init "$@"
    git commit --allow-empty --message "Initialize empty Git repository"
    if [ "$(git status --short)" != '' ]; then
      git add .
      git commit
    fi
    ;;

  mr)
    cmd="${1:-ls}"
    shift
    case "$cmd" in
    c) g mr create --assignee "${G_MR_ASSIGNEE:?}" --reviewer "${G_MR_REVIEWER:?}" --target-branch "${G_MR_TARGET_BRANCH:-develop}" "$@" ;;
    d) g mr diff "$@" ;;
    ls) g mr list "$@" ;;
    m)
      if ! expr "$*" : '^[[:space:][:digit:]][[:space:][:digit:]]*$' >/dev/null; then
        g mr merge "$@" --rebase --remove-source-branch --yes
        g f
        return
      fi
      for cmd in "$@"; do
        g mr merge "$cmd" --rebase --remove-source-branch --yes
      done
      g f
      ;;
    n) g mr note "$@" ;;
    u)
      if ! expr "$*" : '^[[:space:][:digit:]][[:space:][:digit:]]*$' >/dev/null; then
        g mr update "${@:---ready}"
        return
      fi
      for cmd in "$@"; do
        g mr u "$cmd" --ready
      done
      ;;
    r) g mr rebase "$@" ;;
    v) g mr view "$@" ;;
    *[!0-9]*) glab mr "$cmd" "$@" ;;
    *) g mr v "$cmd" "$@" ;;
    esac
    ;;

  r) tig refs "$@" ;;

  s) tig status "$@" ;;

  yls) tig stash "$@" ;;

  -*) grep "$cmd" "$@" ;;

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
