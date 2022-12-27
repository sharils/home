m() {
  cmd="$1"
  shift
  case "$cmd" in
    pj) m package-json ;;
    sft) m strftime ;;
    *) man "$(echo "$cmd $*" | tr ' ' '-')" ;;
  esac
}
