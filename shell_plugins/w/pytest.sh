#!/usr/bin/env sh

# -o OVERRIDE_INI, --override-ini=OVERRIDE_INI
# -v, --verbose         Increase verbosity
# -x, --exitfirst       Exit instantly on first error or failed test
# --ff, --failed-first  Run all tests, but run the last failures first. This may
pytest() {
  "$SHARILS_HOME/shell_plugins/w/pytest.sh" "pytest $*"
}

pytest "$@"
