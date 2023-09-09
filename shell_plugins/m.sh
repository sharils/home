m() {
  case "$1" in

  91) open -b com.apple.Music 'https://jazzfm91.streamb.live/SB00009' ;;

  247) open -b com.apple.Music 'https://stream.zeno.fm/s2888pqwzqzuv' ;;

  977) open -b com.apple.Music 'https://music.apple.com/tw/station/classical-fm-97-7/ra.1459554452?l=en' ;;

  aws) shift && aws "$@" help | l ;;

  bbc) open -b com.apple.Music 'https://music.apple.com/tw/station/bbc-radio-3/ra.1461288674?l=en' ;;

  c) shift && "$SHARILS_HOME/shell_plugins/m/c.sh" "$@" ;;

  cap) open -b com.apple.Music 'https://playerservices.streamtheworld.com/pls/ClassicalStreamAAC.pls' ;;

  d) shift && "$SHARILS_HOME/shell_plugins/m/d.sh" "$@" ;;

  e)
    shift
    if [ $# -eq 0 ]; then
      $EDITOR mix.exs
      return
    fi
    case "$1" in
    c) shift && m ecto.create "$@" ;;
    *)
      tmp="$(mktemp)"
      grep --line-number --with-filename "$1" mix.exs >"$tmp"
      vim -q "$tmp"
      ;;
    esac
    ;;

  erl) erl -man erl | l ;;

  f) shift && m format "$@" ;;

  h)
    shift
    case "$1" in
    d)
      shift
      case "$1" in
      o) shift && set -- online "$@" ;;
      *) set -- offline "${@}" ;;
      esac
      m hex.docs "$@"
      ;;
    s) shift && m hex.search "$@" ;;
    *) m help "$@" | l md ;;
    esac
    ;;

  i)
    shift
    if [ $# -eq 0 ]; then
      iex -S mix "$@"
      return
    fi
    m install "$@"
    ;;

  jason) m r --eval 'IO.read(:all) |> Jason.decode!() |> IO.inspect()' ;;

  kamu) open -b com.apple.Music 'https://kamu.streamguys1.com/hd2-64' ;;

  kids) open -b com.apple.Music 'https://classicalkids.stream.publicradio.org/classicalkids.aac' ;;

  muzaiko) open -b com.apple.Music 'http://fluo.muzaiko.saluton.dk:8000/radio.mp3' ;;

  n)
    shift
    case "$1" in
    m) cmd="$2" && shift 2 && set -- "$cmd" --module "$@" ;;
    u) cmd="$2_umbrella" && shift 2 && set -- "$cmd" --umbrella "$@" ;;
    esac
    m new "$@" && cd "$cmd" && return $?
    ;;

  npm) shift && npm help "$@" | l ;;

  p) shift && "$SHARILS_HOME/shell_plugins/m/p.sh" "$@" ;;

  peaceful) open -b com.apple.Music 'https://peacefulpiano.stream.publicradio.org/peacefulpiano.aac' ;;

  pj) m package-json ;;

  r)
    shift
    case "$1" in
    '') shift && MIX_ENV=prod mix release ;;
    i) shift && MIX_ENV=prod mix release.init "$@" ;;
    nh) shift && m run --no-halt "$@" ;;
    ns) shift && iex -S mix run --no-start "$@" ;;
    *) m run "$@" ;;
    esac
    ;;

  re) m re_format ;;

  s) shift && m search "$@" ;;

  t)
    shift
    case "$1" in
    f) shift && set -- --failed "$@" ;;
    mf) shift && set -- --max-failures "${@:-1}" ;;
    s) shift && set -- --seed 0 "$@" ;;
    t) shift && set -- --trace "$@" ;;
    esac
    m test "$@"
    ;;

  sft) m strftime ;;

  vpr) open -b com.apple.Music 'https://www.vpr.net/apps/stream-playlists/vprclassicalaac.pls' ;;

  wwfm) open -b com.apple.Music 'https://wwmf.streamguys1.com/live' ;;

  app.config | app.start | app.tree | archive | archive.build | archive.install | archive.uninstall | clean | cmd | compile | deps | deps.clean | deps.compile | deps.get | deps.tree | deps.unlock | deps.update | do | escript | escript.build | escript.install | escript.uninstall | eval | format | help | hex | hex.audit | hex.build | hex.config | hex.docs | hex.info | hex.organization | hex.outdated | hex.owner | hex.package | hex.publish | hex.registry | hex.repo | hex.retire | hex.search | hex.sponsor | hex.user | loadconfig | local | local.hex | local.phx | local.public_keys | local.rebar | new | phx | phx.digest | phx.digest.clean | phx.gen | phx.gen.auth | phx.gen.cert | phx.gen.channel | phx.gen.context | phx.gen.embedded | phx.gen.html | phx.gen.json | phx.gen.live | phx.gen.notifier | phx.gen.presence | phx.gen.release | phx.gen.schema | phx.gen.secret | phx.gen.socket | phx.new | phx.new.ecto | phx.new.web | phx.routes | phx.server | profile.cprof | profile.eprof | profile.fprof | release | release.init | run | test | test.coverage | xref) mix "$@" ;;

  account | home | info | install | list | lucky | open | outdated | purchase | reset | search | signin | signout | uninstall | upgrade | vendor | version) mas "$@" ;;

  echo | false | kill | log | login | nice | nohup | printenv | printf | pwd | time | true | which | *)
    man "$(echo "$*" | sed 's# -.*##' | tr ' ' '-')" | l
    ;;
  esac
}
