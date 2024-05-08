#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

m() {
  case "$1" in

  aws) shift && aws "$@" help | l ;;

  c) shift && "$SHARILS_HOME/shell_plugins/m/c.sh" "$@" ;;

  cl) shift && "$SHARILS_HOME/shell_plugins/m/cl.sh" "$@" ;;

  composers)
    cat <<'EOF' | sed 's/, /\n/g' | sort -R | head -n1 | pbcopy && pbpaste
Bach, Bartók, Handel, Beethoven, Berlioz, Brahms, Chopin, Debussy, Django Reinhardt, Dukas, Dvorak, Elgar, Fauré, Gershwin, Glinka, Haydn, Holst, Lalo, Liszt, Mahler, Mozart, Nielsen, Paganini, Prokofiev, Puccini, Ravel, Rossini, Saint-Saëns, Smetana, Schubert, Schumann, Sibelius, Richard Strauss, Johann Strauss II, Tchaikovsky, Verdi, Vivaldi, Wagner, Mussorgsky, Bruckner, Grieg, Rimsky-Korsakov, Stamitz, Richter, Stamitz, Cannabich, Mendelssohn, Bellini, Rachmaninoff, Franck, Ennio Morricone, Nino Rota, Ludovico Einaudi
EOF
    ;;

  d) shift && "$SHARILS_HOME/shell_plugins/m/d.sh" "$@" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/m/e.sh" "$@" ;;

  erl) erl -man erl | l ;;

  f) shift && m format "$@" ;;

  h) shift && "$SHARILS_HOME/shell_plugins/m/h.sh" "$@" ;;

  i) shift && "$SHARILS_HOME/shell_plugins/m/i.sh" "$@" ;;

  jason) m r --eval 'IO.read(:all) |> Jason.decode!() |> IO.inspect()' ;;

  n) shift && "$SHARILS_HOME/shell_plugins/m/n.sh" "$@" ;;

  o) shift && "$SHARILS_HOME/shell_plugins/m/o.sh" "$@" ;;

  npm) shift && npm help "$@" | l ;;

  p) shift && "$SHARILS_HOME/shell_plugins/m/p.sh" "$@" ;;

  pieces)
    cat <<'EOF' | sed 's/, /\n/g' | sort -R | head -n1 | pbcopy && pbpaste
K265, BWV881, BWV1007-1012, Butterfly Lover, Carmina Burana, Goldberg Variation, Also sprach Zarathustra, Turandot, Má vlast, Tannhäuser, Der Fliegende Holländer, L'Apprenti sorcier, Ночь на лысой горе, Guillaume Tell, Tristan und Isolde, Peer Gynt Suites, Night on Bald Mountain, Night on Bald Mountain, Aida, Requiem (Verdi), Peter and the Wolf, Carnival of the Animals, Csárdás
EOF
    ;;

  pj) m package-json ;;

  r) shift && "$SHARILS_HOME/shell_plugins/m/r.sh" "$@" ;;

  re) m re_format ;;

  s) shift && m search "$@" ;;

  songs)
    cat <<'EOF' | sed 's/, /\n/g' | sort -R | head -n1 | pbcopy && pbpaste
Vincent, Sound of Silence, Hey Jude
EOF
    ;;

  t) shift && "$SHARILS_HOME/shell_plugins/m/t.sh" "$@" ;;

  sft) m strftime ;;

  phx.gen | phx.gen.auth | phx.gen.cert | phx.gen.channel | phx.gen.context | phx.gen.embedded | phx.gen.html | phx.gen.json | phx.gen.live | phx.gen.notifier | phx.gen.presence | phx.gen.release | phx.gen.schema | phx.gen.secret | phx.gen.socket)
    (
      pwd | grep --quiet '_umbrella$' && cd apps/*_web || return $?
      mix "$@"
    )
    ;;

  app.config | app.start | app.tree | archive | archive.build | archive.install | archive.uninstall | clean | cmd | compile | deps | deps.clean | deps.compile | deps.get | deps.tree | deps.unlock | deps.update | do | escript | escript.build | escript.install | escript.uninstall | eval | format | help | hex | hex.audit | hex.build | hex.config | hex.docs | hex.info | hex.organization | hex.outdated | hex.owner | hex.package | hex.publish | hex.registry | hex.repo | hex.retire | hex.search | hex.sponsor | hex.user | loadconfig | local | local.hex | local.phx | local.public_keys | local.rebar | new | phx | phx.digest | phx.digest.clean | phx.new | phx.new.ecto | phx.new.web | phx.routes | phx.server | profile.cprof | profile.eprof | profile.fprof | release | release.init | run | test | test.coverage | xref) mix "$@" ;;

  account | home | info | install | list | lucky | open | outdated | purchase | reset | search | signin | signout | uninstall | upgrade | vendor | version) mas "$@" ;;

  echo | false | kill | log | login | nice | nohup | printenv | printf | pwd | time | true | which | *)
    man "$(echo "$*" | sed 's# -.*##' | tr ' ' '-')" | l
    ;;
  esac
}
