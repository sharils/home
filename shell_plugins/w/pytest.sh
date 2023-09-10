#!/usr/bin/env sh

pytest() {
  "$SHARILS_HOME/shell_plugins/w/pytest.sh" "pytest $*"
}

pytest "$@"
