#!/usr/bin/env sh

home() {
  cmd=$1
  shift

  case $cmd in

  cd) cd ~/git/github.com/sharils/home/ || return ;;

  e)
    if [ $# -eq 0 ]; then
      cmd=install
    elif [ "$1" = 'bp' ]; then
      cmd=".bash_profile"
    else
      cmd="shell_plugins/$*.sh"
    fi
    vim "$HOME/git/github.com/sharils/home/$cmd"
    # shellcheck source=/dev/null
    . "$HOME/git/github.com/sharils/home/.bash_profile"
    ;;

  P | pull)
    git -C ~/git/github.com/sharils/home stash push
    git -C ~/git/github.com/sharils/home pull --prune --rebase
    vim -S ~/.vim/snapshot.vim
    bash-it reload
    ;;

  p | push) git -C ~/git/github.com/sharils/home push ;;

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

    bash-it update
    tldr --update
    npm --global update

    vim +PlugUpdate
    vim +'PlugSnapshot! ~/.vim/snapshot.vim'

    git -C ~/git/github.com/sharils/home add .vim/snapshot.vim
    git -C ~/git/github.com/sharils/home commit --message 'Pump vim plugin verions'
    git -C ~/git/github.com/sharils/home push
    ;;

  esac
}
