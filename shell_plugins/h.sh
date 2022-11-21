#!/usr/bin/env sh

h() {
  cmd=$1
  shift

  case $cmd in

  .)
    # shellcheck source=/dev/null
    . "$SHARILS_HOME/.bash_profile"
    ;;

  e)
    case "${1:-i}" in
      bp) cmd=/.bash_profile ;;
      i) cmd=/install ;;
      k) cmd=/.config/karabiner/karabiner.json ;;
      t) cmd=/.todo.cfg ;;
      vim) cmd=/.vimrc ;;
      *) cmd="/shell_plugins/$*.sh" ;;
    esac
    vim "$SHARILS_HOME$cmd"
    h .
    ;;

  g)
    git -C "$SHARILS_HOME" "$@"
    ;;

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

    vim +PlugUpdate
    vim +'PlugSnapshot! ~/.vim/snapshot.vim'

    h g add .vim/snapshot.vim
    h g commit --message 'Pump vim plugin verions'
    h g push
    ;;

  z) cd "$SHARILS_HOME" || return ;;

  esac
}
