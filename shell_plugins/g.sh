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
  if [ $# -eq 1 ] && [ -f "$1" ] || [ $# -eq 0 ]; then
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

  cl)
    shift
    case "$1" in
    e) git config --local "${@:---edit}" ;;
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

  cmx) shift && g cm "Execute $*" ;;

  cs) shift && git-crypt status "$@" ;;

  f) shift && "$SHARILS_HOME/shell_plugins/g/f.sh" "$@" ;;

  e) shift && $EDITOR "${@:--p}" \
    "$SHARILS_HOME/alias.gitconfig" \
    "$SHARILS_HOME/shell_plugins/g.sh" \
    "$SHARILS_HOME/.vim/plugged/after/plugin/vim-fugitive.vim" \
    "$SHARILS_HOME/.tig/bind-gitconfig.tigrc" \
    "$SHARILS_HOME/.tig/bind-fugitive.tigrc" \
    "$SHARILS_HOME/.tig/bind-deprecated.tigrc" ;;

  i) shift && "$SHARILS_HOME/shell_plugins/g/i.sh" "$@" ;;

  mr) shift && "$SHARILS_HOME/shell_plugins/g/mr.sh" "$@" ;;

  r) shift && "$SHARILS_HOME/shell_plugins/g/r.sh" "$@" ;;

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
