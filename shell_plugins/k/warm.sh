#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

warm() {
  cat <<'EOF'
It’s ok to start again.
I hope your day is as beautiful as you are.
You’re not stuck. You’re learning. You’re growing. You’re preparing to bloom!
Keep walking the path you never know what.
Dear stranger, No matter what you have gone through, you have won. I’m proud of you.
EOF
}

warm "$@"
