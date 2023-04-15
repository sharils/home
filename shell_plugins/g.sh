#!/usr/bin/env sh
# dep: z.plugins.bash

g() {
  if ! [ -t 0 ]; then
    "$SHARILS_HOME/shell_plugins/g/STDIN.sh" "$@"
    return $?
  fi
  if ! [ -t 1 ] && [ "$1" = 's' ]; then
    git status
    return
  fi
  if [ $# -eq 0 ] || [ -f "$1" ]; then
    tig "$@"
    return
  fi

  case "$1" in

  L) shift && tig reflog "$@" ;;

  cbc)
    g cbr || return $?
    g cb --merged |
      sed 's/^.* //' | grep -Ev '^(?:main|master|develop)$' |
      xargs git cb --delete
    ;;

  cgi) shift && git config --file ~/git/github.com/sharils/home/gitignore.gitconfig "$@" ;;

  cbr) shift && "$SHARILS_HOME/shell_plugins/g/cbr.sh" "$@" ;;

  cl) shift && "$SHARILS_HOME/shell_plugins/g/cl.sh" "$@" ;;

  cmx) shift && g cm "Apply $*" ;;

  cs) shift && git-crypt status "$@" ;;

  f) shift && "$SHARILS_HOME/shell_plugins/g/f.sh" "$@" ;;

  i)
    shift
    git init "$@"
    [ -n "$G_I" ] && "$G_I"
    git commit --allow-empty --message "Initialize empty Git repository"
    if [ "$(git status --short)" != '' ]; then
      git add .
      git commit
    fi
    ;;

  mr) shift && "$SHARILS_HOME/shell_plugins/g/mr.sh" "$@" ;;

  r)
    shift
    if [ $# -eq 0 ]; then
      tig refs
    else
      git r "$@"
    fi
    ;;

  s) shift && tig status "$@" ;;

  stripspace) shift && git grep -I --files-with-matches ' \{1,\}$' | xargs sed -i '' 's/ \{1,\}$//' ;;

  v) shift && grep "$@" /Users/minniebavaro/git/github.com/sharils/home/.vim/plugged/vim-fugitive/autoload/fugitive.vim ;;

  y) shift && tig stash "$@" ;;

  w)
    cmd="$(git config remote.origin.url | tr ':' /)"
    cmd="${cmd%%.git}"
    w echo "https://${cmd##git@}"
    ;;

  -*) shift && grep "$@" ;;

  *)
    if [ $# -eq 1 ] && [ -f "$1" ] && [ "$1" != a ] && [ "$1" != add ] &&
      [ "$1" != rm ]; then
      grep "$@"
    else
      git "$@"
    fi
    ;;

  esac
}
