#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

oote() {
  cat <<EOF
    I am an Engineer.

    In my profession I take deep pride. To it I owe solemn obligations.

    As an engineer, I, $@, pledge to practice Integrity and Fair Dealing, Tolerance, and Respect, and to uphold devotion to the standards and dignity of my profession, conscious always that my skill carries with it the obligation to serve humanity by making best use of the Earth's precious wealth.

    As an engineer, I shall participate in none but honest enterprises. When needed, my skill and knowledge shall be given without reservation for the public good.

    In the performance of duty, and in fidelity to my profession, I shall give the utmost.
EOF
}

oote "$@"
