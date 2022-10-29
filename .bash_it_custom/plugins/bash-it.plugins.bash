#!/usr/bin/env sh

bsh() {
  cmd=${1---help}; shift
  case $cmd in
    enp)
      bash-it enable plugin "$@"
      ;;
    ha)
      bash-it help alias
      ;;
    hc)
      if [ "$#" -eq 0 ]; then
        bash-it help completions
      else
        $PAGER "$HOME/.bash_it/completion/available/$1.completion.bash"
      fi
      ;;
    hp)
      if [ "$#" -eq 0 ]; then
        bash-it help plugins
      else
        $PAGER "$HOME/.bash_it/plugins/available/$1.plugin.bash"
      fi
      ;;
    r)
      bash-it reload
      ;;
    sa)
      bash-it show aliases
      ;;
    sc)
      bash-it show completions
      ;;
    sp)
      bash-it show plugins
      ;;
    va)
      vim "$HOME/git/github.com/sharils/home/.bash_it_custom/aliases/$1.aliases.bash"
      ;;
    vp)
      vim "$HOME/git/github.com/sharils/home/.bash_it_custom/plugins/$1.plugins.bash"
      ;;
    *)
      bash-it "$cmd" "$@"
  esac
}
