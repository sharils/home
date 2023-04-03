m() {
  case "$1" in

  aws) "$@" help | l ;;

  erl) erl -man erl | l ;;

  i) shift && m install "$@" ;;

  n | npm) shift && npm help "$@" | l ;;

  pj) m package-json ;;

  re) m re_format ;;

  s) shift && m search "$@" ;;

  sft) m strftime ;;

  account | home | info | install | list | lucky | open | outdated | purchase | reset | search | signin | signout | uninstall | upgrade | vendor | version) mas "$@" ;;

  echo | false | kill | log | login | nice | nohup | printenv | printf | pwd | test | time | true | which | *)
    man "$(echo "$*" | sed 's# -.*##' | tr ' ' '-')" | l
    ;;
  esac
}
