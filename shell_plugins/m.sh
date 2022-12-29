m() {
  case "$1" in
  aws) "$@" help | l;;
  erl) erl -man erl | l;;
  n | npm)
    shift
    npm help "$@" | l
    ;;
  pj) m package-json ;;
  re) m re_format ;;
  sft) m strftime ;;
  echo | false | kill | local | log | login | nice | nohup | printenv | printf | pwd | test | time | true | which | *)
    man "$(echo "$*" | sed 's# -.*##' | tr ' ' '-')"
    ;;
  esac
}
