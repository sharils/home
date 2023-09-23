#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

mr() {
  case "${1:-ls}" in
  a) shift && mr approve "$@" ;;
  c) shift && mr create --assignee "${G_MR_ASSIGNEE:?}" --reviewer "${G_MR_REVIEWER:?}" --target-branch "${G_MR_TARGET_BRANCH:-develop}" "$@" ;;
  d) shift && mr diff "$@" ;;
  m)
    shift
    if expr "$*" : '^[[:space:][:digit:]][[:space:][:digit:]]*$' >/dev/null; then
      for cmd in "$@"; do
        mr merge "$cmd" --rebase --remove-source-branch --yes
      done
    else
      until mr merge "$@" --rebase --remove-source-branch --yes; do sleep 1; done
    fi
    git fetch --prune
    ;;
  n) shift && mr note "$@" ;;
  u)
    shift
    if ! expr "$*" : '^[[:space:][:digit:]][[:space:][:digit:]]*$' >/dev/null; then
      mr update "${@:---ready}"
      return
    fi
    for cmd in "$@"; do
      mr u "$cmd" --ready
    done
    ;;
  r) shift && mr rebase "$@" ;;
  v) shift && mr view "$@" ;;
  *[!0-9]*) glab mr "$@" ;;
  *) mr v "$@" ;;
  esac
}

mr "$@"
