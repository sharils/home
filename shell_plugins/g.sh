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

  cbr) "$SHARILS_HOME/shell_plugins/g/cbr.sh" "$@" ;;

  cl) "$SHARILS_HOME/shell_plugins/g/cl.sh" "$@" ;;

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

  mr) "$SHARILS_HOME/shell_plugins/g/mr.sh" "$@" ;;

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
