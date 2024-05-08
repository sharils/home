#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

draculadaily() {
  jq --raw-output '.[] | @tsv' \
    <"$SHARILS_HOME/shell_plugins/x/draculadaily/draculadaily.json" |
    tr '\t' '' |
    column -t -s '' |
    bat --style=plain
}

draculadaily "$@"
