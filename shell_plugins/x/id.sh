#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

id() {
  weights="$(mktemp)"
  printf '%s\n%s' "$(jot 8 8 1)" 1 >"$weights"

  digits="$(mktemp)"
  if [ $# -eq 0 ]; then
    keepassxc-cli generate --custom 1289 --length 1 >"$digits"
    jot -r 8 0 9 >>"$digits"
  else
    echo "$1" | grep --extended-regexp --only-matching '\d' >"$digits"
  fi

  sum="$(paste -d'*' "$digits" "$weights" | xargs | tr ' ' '+' | bc)"

  letter="$(
  )"

  {
    cat <<'EOF' | grep "^$((10 - sum % 10))" | cut -d' ' -f2- | tr ' ' '\n'
1 A M W
2 K L Y
3 J V X
4 H U
5 G T
6 F S
7 E R
8 D O Q
9 C I P
10 B N Z
EOF
  } | {
    if [ $# -eq 0 ]; then
      sort --sort=random | head -n1
    else
      cat
    fi
  } | sed "s/$/$(tr -d '\n' <"$digits")/" | grep --ignore-case "^\|$1"
}

id "$@"
