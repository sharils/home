#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cb() {
  case "$1" in
  c)
    cb r || return $?
    git cb --merged |
      sed 's/^.* //' | grep -Ev '^(?:main|master|develop)$' |
      xargs git cb --delete
    ;;

  r)
    shift
    upstream="${1:-origin/develop}"
    current_branch="$(git rev-parse --abbrev-ref HEAD)"
    git f
    git cb |
      sed 's/^.* //' | grep -Ev '^(?:main|master)$' |
      xargs -I{} -n1 sh -c "git -c advice.skippedCherryPicks=false r $upstream {} || exit 255"
    git cb |
      sed 's/^.* //' | grep -E '^(?:main|master)$' |
      xargs -I{} -n1 sh -c "git -c advice.skippedCherryPicks=false r origin/{} {} || exit 255"
    exit_code=$?
    git co "$current_branch"
    return $exit_code
    ;;

  *) git cb "$@" ;;
  esac
}

cb "$@"
