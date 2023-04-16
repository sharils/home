#!/usr/bin/env sh

h() {
  # shellcheck disable=SC1083
  case "$1" in

  '')
    # shellcheck source=/dev/null
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
    h g cm 'Apply vim +PlugUpdate'
    h g p
    ;;

  e) shift && "$SHARILS_HOME/shell_plugins/h/e.sh" "$@" ;;

  g)
    shift
    base="$SHARILS_HOME/shell_plugins"
    if [ ! -f "$base/$1.sh" ]; then
      git -C "$SHARILS_HOME" "$@"
      return $?
    fi

    path="$(echo "$*" | tr ' ' '/')"
    for last in "$@"; do :; done
    cat <<SH | x touch "$base/$path.sh"
#!/usr/bin/env sh

$last() {
  :
}

$last "\$@"
SH

    x + "$base/$path.sh"
    [ -n "$EDITOR" ] && $EDITOR "$base/$path.sh"
    h g a "$base/$path.sh"
    echo "  $last) \"\$SHARILS_HOME/shell_plugins/$path.sh\" \"\$@\" ;;" | pbcopy
    ;;

  m) echo 'h mix <command> instead' >&2 ;;

  mix)
    shift
    if [ $# -eq 0 ]; then
      mix --help | l
      return
    fi
    mix help "$@" | l md
    ;;

  push) h g p ;;

  t) todo.sh -vv help | l ;;

  u) shift && "$SHARILS_HOME/shell_plugins/h/u.sh" "$@" ;;

  wc) find "$SHARILS_HOME/shell_plugins" -type f -exec wc -l {} ';' | sed "s#$SHARILS_HOME/shell_plugins/##" | sort ;;

  builtin | % | . | : | \[ | { | alias | bg | bind | break | case | cd | command | complete | continue | dirs | echo | eval | exec | exit | export | false | fc | fg | for | getopts | hash | history | if | jobs | kill | local | log | logout | popd | printf | pushd | pwd | read | readonly | return | set | shift | source | suspend | test | time | times | trap | true | type | ulimit | umask | unalias | unset | until | wait | while) help "$@" | l ;;

  *)
    if [ -f "$*" ]; then
      head "$*"
      return
    fi
    "$@" --help | l
    ;;

  esac
}
