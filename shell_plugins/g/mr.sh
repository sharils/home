#!/usr/bin/env sh

mr() {
  case "${1:-ls}" in
  a) shift && g mr approve "$@" ;;
  c) shift && g mr create --assignee "${G_MR_ASSIGNEE:?}" --reviewer "${G_MR_REVIEWER:?}" --target-branch "${G_MR_TARGET_BRANCH:-develop}" "$@" ;;
  d) shift && g mr diff "$@" ;;
  m)
    shift
    if expr "$*" : '^[[:space:][:digit:]][[:space:][:digit:]]*$' >/dev/null; then
      for cmd in "$@"; do
        g mr merge "$cmd" --rebase --remove-source-branch --yes
      done
    else
      until g mr merge "$@" --rebase --remove-source-branch --yes; do sleep 1; done
    fi
    g f
    ;;
  n) shift && g mr note "$@" ;;
  u)
    shift
    if ! expr "$*" : '^[[:space:][:digit:]][[:space:][:digit:]]*$' >/dev/null; then
      g mr update "${@:---ready}"
      return
    fi
    for cmd in "$@"; do
      g mr u "$cmd" --ready
    done
    ;;
  r) shift && g mr rebase "$@" ;;
  v) shift && g mr view "$@" ;;
  *[!0-9]*) glab mr "$@" ;;
  *) g mr v "$@" ;;
  esac
}

mr "$@"
