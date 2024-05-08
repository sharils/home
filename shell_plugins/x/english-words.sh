#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

english_words() {
  rg --pcre2 "${@:-^}" "$SHARILS_HOME/shell_plugins/x/english-words/words_alpha.txt"
}

english_words "$@"
