#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

nf() {
  cat <<'EOF'
1NF: no attribute has relations as elements
2NF: no non-prime attribute is functionally dependent on any proper subset of any candidate key of the relation
3NF: no non-prime attribute is transitively dependent on the primary key.
EOF
}

nf "$@"
