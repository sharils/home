#!/usr/bin/env sh
# dep: z.plugins.bash

g() {
  if ! [ -t 0 ]; then
    cmd="$1"
    shift
    case "$cmd" in
    uri) grep --extended-regexp --only-matching "(?:file:///|https?://)[[:alnum:]-]+(?:\.[[:alnum:]-]+)*[^>]*|[[:alnum:]-]+(\.[[:alnum:]-]+)*\.(?:com|geek|gg|org)/[^ '>]+" ;;
    # g -n "$@" # Segmentation fault: 11
    *) grep "$@" ;;
    esac
    return
  fi
  if ! [ -t 1 ] && [ "$1" = 's' ]; then
    git status
    return
  fi
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

  L) tig reflog "$@" ;;

  cbc)
    g cbr || return $?
    g cb --merged |
      sed 's/^.* //' | grep -Ev '^(?:main|master|develop)$' |
      xargs git cb --delete
    ;;

  cgi) git config --file ~/git/github.com/sharils/home/gitignore.gitconfig "$@" ;;

  cbr)
    upstream="${1:-origin/develop}"
    current_branch="$(git rev-parse --abbrev-ref HEAD)"
    g f
    g cb |
      sed 's/^.* //' | grep -Ev '^(?:main|master)$' |
      xargs -I{} -n1 sh -c "git -c advice.skippedCherryPicks=false r $upstream {} || exit 255"
    g cb |
      sed 's/^.* //' | grep -E '^(?:main|master)$' |
      xargs -I{} -n1 sh -c "git -c advice.skippedCherryPicks=false r origin/{} {} || exit 255"
    exit_code=$?
    g co "$current_branch"
    return $exit_code
    ;;

  cl)
    case "$1" in
    -e) git config --local "$@" ;;
    t | *)
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

  cmx) g cm "Apply $*" ;;

  cs) git-crypt status "$@" ;;

  f) "$SHARILS_HOME/shell_plugins/g/f.sh" "$@" ;;

  i)
    git init "$@"
    [ -n "$G_I" ] && "$G_I"
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
    a) g mr approve "$@" ;;
    c) g mr create --assignee "${G_MR_ASSIGNEE:?}" --reviewer "${G_MR_REVIEWER:?}" --target-branch "${G_MR_TARGET_BRANCH:-develop}" "$@" ;;
    d) g mr diff "$@" ;;
    m)
      if expr "$*" : '^[[:space:][:digit:]][[:space:][:digit:]]*$' >/dev/null; then
        for cmd in "$@"; do
          g mr merge "$cmd" --rebase --remove-source-branch --yes
        done
      else
        until g mr merge "$@" --rebase --remove-source-branch --yes; do sleep 1; done
      fi
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

  r)
    if [ $# -eq 0 ]; then
      tig refs
    else
      git r "$@"
    fi
    ;;

  s) tig status "$@" ;;

  stripspace) git grep -I --files-with-matches ' \{1,\}$' | xargs sed -i '' 's/ \{1,\}$//' ;;

  v) grep "$@" /Users/minniebavaro/git/github.com/sharils/home/.vim/plugged/vim-fugitive/autoload/fugitive.vim ;;

  y) tig stash "$@" ;;

  w)
    cmd="$(git config remote.origin.url | tr ':' /)"
    cmd="${cmd%%.git}"
    w echo "https://${cmd##git@}"
    ;;

  -*) grep "$cmd" "$@" ;;

  *)
    if [ $# -eq 1 ] && [ -f "$1" ] && [ "$cmd" != a ] && [ "$cmd" != add ] &&
      [ "$cmd" != rm ]; then
      grep "$cmd" "$@"
    else
      git "$cmd" "$@"
    fi
    ;;

  esac
}
