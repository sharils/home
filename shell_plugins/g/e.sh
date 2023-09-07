#!/usr/bin/env sh

e() {
  $EDITOR "${@:--p}" \
    "$SHARILS_HOME/alias.gitconfig" \
    "$SHARILS_HOME/shell_plugins/g.sh" \
    "$SHARILS_HOME/.vim/plugged/after/plugin/vim-fugitive.vim" \
    "$SHARILS_HOME/.tig/bind-gitconfig.tigrc" \
    "$SHARILS_HOME/.tig/bind-fugitive.tigrc" \
    "$SHARILS_HOME/.tig/bind-deprecated.tigrc" \
    "$SHARILS_HOME/.vim/plugged/vim-fugitive/autoload/fugitive.vim" \
    "$SHARILS_HOME/.gitignore" \
    "$SHARILS_HOME/.gitconfig"
}

e "$@"
