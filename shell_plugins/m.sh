m() {
  man "$(echo "$*" | tr ' ' '-')"
}
