#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

manifesto() {
  cat <<'EOF'
Well-crafted software (WWC)
  Working software
    Comprehensive documentation
Steadily adding value (SRF)
  Responding to change
    Following a plan
Community of professionals (CIP)
  Individuals and interactions
    Processes and tools
Productive partnerships (PCC)
  Customer collaboration
    Contract negotiation
EOF
}

manifesto "$@"
