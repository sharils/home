#!/usr/bin/env sh

d() {
  # -4 for numeric and special
  cmd="$((${1:-100} - 4))"
  # shellcheck disable=3009
  for words in {12..4}; do
    pass="$(keepassxc-cli diceware --words "$words")"
    [ "${#pass}" -lt "$cmd" ] && break
  done
  # shellcheck disable=3009
  for _ in {1..10}; do
    longer="$(keepassxc-cli diceware --words "$words")"
    [ "${#pass}" -lt "${#longer}" ] && [ "${#longer}" -lt "$cmd" ] && pass="$longer"
  done
  printf '%s %s %s' "$pass" \
    "$(keepassxc-cli generate --length 1 --numeric)" \
    "$(keepassxc-cli generate --length 1 --custom "${K_D_CUSTOM:-"!'()*._~"}")" |
    tr ' ' '\n' |
    sort -R |
    tr '\n' ' ' |
    perl -pe 's/\b\w/\U$&/g' |
    sed 's/[[:space:]][[:space:]]*$//' |
    tr ' ' - |
    pbcopy
  pbpaste | wc
}

d "$@"
