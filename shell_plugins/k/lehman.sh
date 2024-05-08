#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

lehman() {
  cat <<'EOF' | grep '^\|.*"'
1. "Continuing Change" — an E-type system must be continually adapted or it becomes progressively less satisfactory. (1974)
2. "Increasing Complexity" — as an E-type system evolves, its complexity increases unless work is done to maintain or reduce it. (1974)
3. "Self Regulation" — E-type system evolution processes are self-regulating with the distribution of product and process measures close to normal. (1974)
4. "Conservation of Organisational Stability (invariant work rate)" — the average effective global activity rate in an evolving E-type system is invariant over the product's lifetime. (1978)
5. "Conservation of Familiarity" — as an E-type system evolves, all associated with it, developers, sales personnel and users, for example, must maintain mastery of its content and behaviour to achieve satisfactory evolution. Excessive growth diminishes that mastery. Hence the average incremental growth remains invariant as the system evolves. (1978)
6. "Continuing Growth" — the functional content of an E-type system must be continually increased to maintain user satisfaction over its lifetime. (1991)
7. "Declining Quality" — the quality of an E-type system will appear to be declining unless it is rigorously maintained and adapted to operational environment changes. (1996)
8. "Feedback System" — E-type evolution processes constitute multi-level, multi-loop, multi-agent feedback systems and must be treated as such to achieve significant improvement over any reasonable base. (1996)

An E-program is written to perform some real-world activity; how it should behave is strongly linked to the environment in which it runs, and such a program needs to adapt to varying requirements and circumstances in that environment

https://en.wikipedia.org/wiki/Lehman%27s_laws_of_software_evolution
EOF
}

lehman "$@"
