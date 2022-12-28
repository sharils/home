#!/usr/bin/env sh

h() {
  cmd=$1
  shift

  case $cmd in

  '')
    # shellcheck source=/dev/null
    . "$SHARILS_HOME/.bash_profile"
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

  P)
    h g stash push
    h g pull --prune --rebase
    vim -S ~/.vim/snapshot.vim
    h .
    ;;

  p) h g push ;;

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
    pip list --outdated
    pip3 list --outdated

    vim +PlugUpdate
    vim +'PlugSnapshot! ~/.vim/snapshot.vim'

    h g add .vim/snapshot.vim
    h g commit --message 'Apply vim +PlugUpdate'
    h g push
    ;;

  *) "$cmd" "$@" --help ;;

  esac
}
