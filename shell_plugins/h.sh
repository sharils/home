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
    if [ $# -eq 0 ]; then
      cmd=install
    elif [ "$1" = 'bp' ]; then
      cmd='.bash_profile'
    elif [ "$1" = 'todo' ]; then
      cmd='.todo.cfg'
    else
      cmd="shell_plugins/$*.sh"
    fi
    vim "$SHARILS_HOME/$cmd"
    home .
    ;;

  g)
    git -C "$SHARILS_HOME" "$@"
    ;;

  P | pull)
    h g stash push
    h g pull --prune --rebase
    vim -S ~/.vim/snapshot.vim
    home .
    ;;

  p | push) h g push ;;

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

    git -C ~/git/github.com/sharils/home add .vim/snapshot.vim
    git -C ~/git/github.com/sharils/home commit --message 'Pump vim plugin verions'
    git -C ~/git/github.com/sharils/home push
    ;;

  z) cd ~/git/github.com/sharils/home/ || return ;;

  esac
}
