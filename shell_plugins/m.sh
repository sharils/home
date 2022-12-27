m() {
  cmd="$1"
  shift
  case "$cmd" in
    sft) m strftime ;;
    *) man "$(echo "$cmd $*" | tr ' ' '-')" ;;
  esac
}
