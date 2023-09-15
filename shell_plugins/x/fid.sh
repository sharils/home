#!/usr/bin/env sh

fid() {
  weights="$(mktemp)"
  printf '%s\n%s' "$(jot 8 8 1)" 1 >"$weights"

  digits="$(mktemp)"
  printf "1\n2\n8\n9" | sort --sort=random | head -n1 >"$digits"
  jot -r 8 0 9 >>"$digits"

  sum="$(paste -d'*' "$digits" "$weights" | xargs | tr ' ' '+' | bc)"

  letter="$(
    cat <<'EOF' | grep "^$((10 - sum % 10))" | cut -d' ' -f2- | tr ' ' '\n' | sort --sort=random | head -n1
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
  )"

  printf '%s%s' "$letter" "$(tr -d '\n' <"$digits")" | pbcopy && pbpaste
}

fid "$@"
