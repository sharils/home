#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

doctor() {
  cat <<'EOF'
knows everything, does nothing — Neurologist
knows nothing, does everything — Surgeon
knows nothing, does nothing — Psychiatrist
knows everything, does everything but too late — A pathologist
EOF
}

doctor "$@"
