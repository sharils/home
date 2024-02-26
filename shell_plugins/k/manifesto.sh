#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

manifesto() {
  cat <<'EOF'
Well-crafted software
  Working software
    Comprehensive documentation
Steadily adding value
  Responding to change
    Following a plan
Community of professionals
  Individuals and interactions
    Processes and tools
Productive partnerships
  Customer collaboration
    Contract negotiation
EOF
}

manifesto "$@"
