m() {
  cmd="$1"
  shift
  case "$cmd" in
    erl) erl -man erl ;;
    pj) m package-json ;;
    re) m re_format ;;
    sft) m strftime ;;
    *) man "$(echo "$cmd $*" | tr ' ' '-')" ;;
  esac
}
