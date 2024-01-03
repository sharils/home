#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

english_words() {
  grep "$@" "$SHARILS_HOME/shell_plugins/x/english-words/words_alpha.txt"
}

english_words "$@"
