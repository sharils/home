#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  vim -p \
    "$SHARILS_HOME/.vimrc" \
    "$SHARILS_HOME/.vim/plugged/after/plugin/set.vim" \
    "$SHARILS_HOME/.vim/plugged/after/plugin/map.vim" \
    "$SHARILS_HOME/.vim/plugged/after/plugin" \
    "$SHARILS_HOME/.vim/plugged/before/plugin" \
    "$SHARILS_HOME/.vim/UltiSnips" \
    "$SHARILS_HOME/.vim/plugged/after/pythonx/my_snippet_helpers.py"
}

e "$@"
