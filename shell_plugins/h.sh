#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h() {
  # shellcheck disable=SC1083
  case "$1" in

  P)
    h g czz
    h g pull --prune --rebase
    vim -S ~/.vim/snapshot.vim
    h
    ;;

  U)
    h u "$@"

    vim +PlugUpdate
    vim +'PlugSnapshot! ~/.vim/snapshot.vim'

    h g add .vim/snapshot.vim
    h g cm 'Execute vim +PlugUpdate'
    h g push
    ;;

  e) shift && "$SHARILS_HOME/shell_plugins/h/e.sh" "$@" ;;

  erl) shift && x erl "c:h($*)" ;;

  ex) shift && e --eval "require IEx.Helpers; IEx.Helpers.h($*)" | l md ;;

  g) shift && "$SHARILS_HOME/shell_plugins/h/g.sh" "$@" ;;

  m) echo 'h mix <command> instead' >&2 ;;

  mix) shift && "$SHARILS_HOME/shell_plugins/h/mix.sh" "$@" ;;

  p) shift && h g push "$@" ;;

  py) shift && x py "help($*)" ;;

  t) todo.sh -vv help | l ;;

  u) shift && "$SHARILS_HOME/shell_plugins/h/u.sh" "$@" ;;

  wc) shift && "$SHARILS_HOME/shell_plugins/h/wc.sh" "$@" ;;

  builtin | % | . | : | \[ | { | alias | bg | bind | break | case | cd | command | complete | continue | dirs | echo | eval | exec | exit | export | false | fc | fg | for | getopts | hash | history | if | jobs | kill | local | log | logout | popd | printf | pushd | pwd | read | readonly | return | set | shift | source | suspend | test | time | times | trap | true | type | ulimit | umask | unalias | unset | until | wait | while) help "$@" | l ;;

  *)
    if [ ! -t 0 ]; then
      head "$@"
    elif [ -f "$*" ]; then
      head "$*"
    elif [ $# -eq 0 ]; then
      # shellcheck source=/dev/null
      . "$SHARILS_HOME/.bash_profile"
    else
      "$@" --help | l
    fi
    ;;

  esac
}
