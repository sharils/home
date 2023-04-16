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

  e)
    shift
    case "${1:-install}" in
    bp) vim "$SHARILS_HOME/bash_profile" ;;
    install) vim "$SHARILS_HOME/install" ;;
    karabiner) vim "$SHARILS_HOME/config/karabiner/karabiner.json" ;;
    todo) vim "$SHARILS_HOME/todo.cfg" ;;
    tig) vim "$SHARILS_HOME/tigrc" ;;
    vim) vim "$SHARILS_HOME/vimrc" ;;
    *)
      if [ $# -le 1 ]; then
        vim "$SHARILS_HOME/shell_plugins/$*.sh"
      else
        cmd="$1" && shift
        grep --extended-regexp --line-number --with-filename "^\s+\b$*\)" "$SHARILS_HOME/shell_plugins/$cmd.sh" | v
      fi
      ;;
    esac
    ;;

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

  u)
    sudo --validate
    brew update
    # for less sudo timeout
    for outdated in $(brew outdated); do
      sudo --validate
      brew upgrade "$outdated"
    done
    sudo --validate
    rustup update stable
    sudo --reset-timestamp

    tldr --update
    npm --global update
    pip3 list --outdated
    ;;

  builtin | % | . | : | [ | { | alias | bg | bind | break | case | cd | command | complete | continue | dirs | echo | eval | exec | exit | export | false | fc | fg | for | getopts | hash | history | if | jobs | kill | local | log | logout | popd | printf | pushd | pwd | read | readonly | return | set | shift | source | suspend | test | time | times | trap | true | type | ulimit | umask | unalias | unset | until | wait | while)
    help "$@" | l
    ;;

  *)
    if [ -f "$*" ]; then
      head "$*"
      return
    fi
    "$@" --help | l
    ;;

  esac
}
