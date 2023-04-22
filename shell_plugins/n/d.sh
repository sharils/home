#!/usr/bin/env sh

d() {
  if [ $# -eq 0 ]; then
    npm run dev
  else
    $BROWSER "$(npm docs "$@" --no-browser | "$SHARILS_HOME/shell_plugins/g/STDIN.sh" uri)"
  fi
}

d "$@"
