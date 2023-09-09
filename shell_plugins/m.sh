m() {
  case "$1" in

  aws) shift && aws "$@" help | l ;;

  c) shift && "$SHARILS_HOME/shell_plugins/m/c.sh" "$@" ;;

  d) shift && "$SHARILS_HOME/shell_plugins/m/d.sh" "$@" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/m/e.sh" "$@" ;;

  erl) erl -man erl | l ;;

  f) shift && m format "$@" ;;

  h) shift && "$SHARILS_HOME/shell_plugins/m/h.sh" "$@" ;;

  i) shift && "$SHARILS_HOME/shell_plugins/m/i.sh" "$@" ;;

  jason) m r --eval 'IO.read(:all) |> Jason.decode!() |> IO.inspect()' ;;

  kamu) open -b com.apple.Music 'https://kamu.streamguys1.com/hd2-64' ;;

  kids) open -b com.apple.Music 'https://classicalkids.stream.publicradio.org/classicalkids.aac' ;;

  muzaiko) open -b com.apple.Music 'http://fluo.muzaiko.saluton.dk:8000/radio.mp3' ;;

  n) shift && "$SHARILS_HOME/shell_plugins/m/n.sh" "$@" ;;

  o) shift && "$SHARILS_HOME/shell_plugins/m/o.sh" "$@" ;;

  npm) shift && npm help "$@" | l ;;

  p) shift && "$SHARILS_HOME/shell_plugins/m/p.sh" "$@" ;;

  peaceful) open -b com.apple.Music 'https://peacefulpiano.stream.publicradio.org/peacefulpiano.aac' ;;

  pj) m package-json ;;

  r) shift && "$SHARILS_HOME/shell_plugins/m/r.sh" "$@" ;;

  re) m re_format ;;

  s) shift && m search "$@" ;;

  t) shift && "$SHARILS_HOME/shell_plugins/m/t.sh" "$@" ;;

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
