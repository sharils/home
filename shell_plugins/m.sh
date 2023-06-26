m() {
  case "$1" in

  977) open -b com.apple.Music 'https://music.apple.com/tw/station/classical-fm-97-7/ra.1459554452?l=en' ;;

  aws) shift && aws "$@" help | l ;;

  erl) erl -man erl | l ;;

  h) shift && m help "$@" | l md ;;

  i)
    if [ $# -eq 0 ]; then
      iex -S mix "$@"
      return
    fi
    shift && m install "$@"
    ;;

  n)
    shift
    case "$1" in
    m) cmd="$2" && shift 2 && set -- "$cmd" --module "$@" ;;
    esac
    m new "$@"
    ;;

  npm) shift && npm help "$@" | l ;;

  p)
    cmd="phx" && shift
    case "$1" in
    i) shift && iex -S mix phx.server "$@" && return ;;
    n) shift && cmd="$cmd.new" ;;
    s) shift && cmd="$cmd.server" ;;
    esac
    mix "$cmd" "$@"
    ;;

  pj) m package-json ;;

  bbc) open -b com.apple.Music 'https://music.apple.com/tw/station/bbc-radio-3/ra.1461288674?l=en' ;;

  re) m re_format ;;

  s) shift && m search "$@" ;;

  t)
    shift
    case "$1" in
    f) shift && set -- --failed "$@";;
    mf) shift && set -- --max-failures "${@:-1}";;
    s) shift && set -- --seed 0 "$@";;
    esac
    m test "$@"
    ;;

  sft) m strftime ;;

  app.config | app.start | app.tree | archive | archive.build | archive.install | archive.uninstall | clean | cmd | compile | deps | deps.clean | deps.compile | deps.get | deps.tree | deps.unlock | deps.update | do | escript | escript.build | escript.install | escript.uninstall | eval | format | help | hex | hex.audit | hex.build | hex.config | hex.docs | hex.info | hex.organization | hex.outdated | hex.owner | hex.package | hex.publish | hex.registry | hex.repo | hex.retire | hex.search | hex.sponsor | hex.user | loadconfig | local | local.hex | local.phx | local.public_keys | local.rebar | new | phx | phx.digest | phx.digest.clean | phx.gen | phx.gen.auth | phx.gen.cert | phx.gen.channel | phx.gen.context | phx.gen.embedded | phx.gen.html | phx.gen.json | phx.gen.live | phx.gen.notifier | phx.gen.presence | phx.gen.release | phx.gen.schema | phx.gen.secret | phx.gen.socket | phx.new | phx.new.ecto | phx.new.web | phx.routes | phx.server | profile.cprof | profile.eprof | profile.fprof | release | release.init | run | test | test.coverage | xref) mix "$@" ;;

  account | home | info | install | list | lucky | open | outdated | purchase | reset | search | signin | signout | uninstall | upgrade | vendor | version) mas "$@" ;;

  echo | false | kill | log | login | nice | nohup | printenv | printf | pwd | time | true | which | *)
    man "$(echo "$*" | sed 's# -.*##' | tr ' ' '-')" | l
    ;;
  esac
}
