#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

node() {
  cat <<'EOF'
4.x   Argon      2015
6.x   Boron      2016
8.x   Carbon     2017
10.x  Dubnium    2018
12.x  Erbium     2019
14.x  Fermium    2020
16.x  Gallium    2021
18.x  Hydrogen   2022
20.x  Iron       2023
22.x  Jod        2024
24.x  Krypton    2025
26.x  Lithium    2026
28.x  Magnesium  2027
30.x  Neon       2028
32.x  Oxygen     2029
34.x  Platinum   2030

https://github.com/nodejs/Release/blob/main/CODENAMES.md
EOF
}

node "$@"
