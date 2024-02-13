#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

med() {
  if [ $# -eq 0 ]; then
    set -- ^ "$@"
  else
    pattern="$1" && shift
    set -- "^\|.*$pattern.*" "$@"
  fi
  cat <<'EOF' | grep "$@"
      P  M   K    
0730  P  T   WT CM  # Pigs Try Washing Tan Cat More
0930      O  W H    # Old Woman Happy
1130     T   WT  M  # Two White Tiger Meow
1330         W  CM  # Wolves Chase Mice
1530     TO  WT  M  # Two Owls Want Talking Moon
1730         W   M  # White Monkey
1930  P  T   WTH    # Please Try With Tasty Honey
2130      O     C   # Old Cow
EOF
}

med "$@"
