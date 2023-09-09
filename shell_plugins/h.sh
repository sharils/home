#!/usr/bin/env sh

h() {
  # shellcheck disable=SC1083
  case "$1" in

  '') # shellcheck source=/dev/null
    . "$SHARILS_HOME/.bash_profile"
    ;;

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

    h g a .vim/snapshot.vim
    h g cm 'Execute vim +PlugUpdate'
    h g p
    ;;

  e) shift && "$SHARILS_HOME/shell_plugins/h/e.sh" "$@" ;;

  erl) shift && x erl "c:h($*)" ;;

  ex) shift && e --eval "require IEx.Helpers; IEx.Helpers.h($*)" | l md ;;

  g) shift && "$SHARILS_HOME/shell_plugins/h/g.sh" "$@" ;;

  m) echo 'h mix <command> instead' >&2 ;;

  mix)
    shift
    if [ $# -eq 0 ]; then
      mix --help | l
    else
      mix help "$@" | l md
    fi
    ;;

  push) h g p ;;

  py) shift && x py "help($*)" ;;

  t) todo.sh -vv help | l ;;

  u) shift && "$SHARILS_HOME/shell_plugins/h/u.sh" "$@" ;;

  wc) find "$SHARILS_HOME/shell_plugins" -type f -exec wc -l {} ';' | sed "s#$SHARILS_HOME/shell_plugins/##" | sort ;;

  builtin | % | . | : | \[ | { | alias | bg | bind | break | case | cd | command | complete | continue | dirs | echo | eval | exec | exit | export | false | fc | fg | for | getopts | hash | history | if | jobs | kill | local | log | logout | popd | printf | pushd | pwd | read | readonly | return | set | shift | source | suspend | test | time | times | trap | true | type | ulimit | umask | unalias | unset | until | wait | while) help "$@" | l ;;

  *)
    if [ -f "$*" ]; then
      head "$*"
    else
      "$@" --help | l
    fi
    ;;

  esac
}
