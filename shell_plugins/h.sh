#!/usr/bin/env sh

h() {
  cmd=$1
  shift

  # shellcheck disable=SC1083
  case $cmd in

  '')
    # shellcheck source=/dev/null
    . "$SHARILS_HOME/.bash_profile"
    ;;

  P)
    h g stash push
    h g pull --prune --rebase
    vim -S ~/.vim/snapshot.vim
    h .
    ;;

  U)
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
    pip list --outdated
    pip3 list --outdated

    vim +PlugUpdate
    vim +'PlugSnapshot! ~/.vim/snapshot.vim'

    h g add .vim/snapshot.vim
    h g commit --message 'Apply vim +PlugUpdate'
    h g push
    ;;

  e)
    case "${1:-install}" in
    bp) cmd=/.bash_profile ;;
    install) cmd=/install ;;
    karabiner) cmd=/.config/karabiner/karabiner.json ;;
    todo) cmd=/.todo.cfg ;;
    tig) cmd=/.tigrc ;;
    vim) cmd=/.vimrc ;;
    *) cmd="/shell_plugins/$*.sh" ;;
    esac
    vim "$SHARILS_HOME$cmd"
    h .
    ;;

  g) git -C "$SHARILS_HOME" "$@" ;;

  p) h g push ;;

  t) todo.sh -vv help | l ;;

  builtin | % | . | : | [ | { | alias | bg | bind | break | case | cd | command | complete | continue | dirs | echo | eval | exec | exit | export | false | fc | fg | for | getopts | hash | history | if | jobs | kill | local | log | logout | popd | printf | pushd | pwd | read | readonly | return | set | shift | source | suspend | test | time | times | trap | true | type | ulimit | umask | unalias | unset | until | wait | while) help "$cmd" "$@" ;;

  *) "$cmd" "$@" --help | l ;;

  esac
}
