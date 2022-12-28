m() {
  case "$1" in
  erl) erl -man erl ;;
  n | npm)
    shift
    npm help "$@"
    ;;
  pj) m package-json ;;
  re) m re_format ;;
  sft) m strftime ;;
  *) man "$(echo "$*" | tr ' ' '-')" ;;
  esac
}
