#!/usr/bin/env bash

[ -n "$SET_X" ] && set -x

k() {
  case "$1" in

  %) shift && "$SHARILS_HOME/shell_plugins/k/%.sh" "$@" ;;

  0d) "$SHARILS_HOME/shell_plugins/k/0d.sh" "$@" ;;

  0x) "$SHARILS_HOME/shell_plugins/k/0x.sh" "$@" ;;

  12) shift && "$SHARILS_HOME/shell_plugins/k/12.sh" "$@" ;;

  32) shift && "$SHARILS_HOME/shell_plugins/k/32.sh" "$@" ;;

  64) shift && "$SHARILS_HOME/shell_plugins/k/64.sh" "$@" ;;

  adhd) shift && "$SHARILS_HOME/shell_plugins/k/adhd.sh" "$@" ;;

  agile) shift && "$SHARILS_HOME/shell_plugins/k/agile.sh" "$@" ;;

  alnum) shift && "$SHARILS_HOME/shell_plugins/k/alnum.sh" "$@" ;;

  android) shift && "$SHARILS_HOME/shell_plugins/k/android.sh" "$@" ;;

  bank) shift && "$SHARILS_HOME/shell_plugins/k/bank.sh" "$@" ;;

  bar) shift && "$SHARILS_HOME/shell_plugins/k/bar.sh" "$@" ;;

  battery) shift && "$SHARILS_HOME/shell_plugins/k/battery.sh" "$@" ;;

  bind) shift && "$SHARILS_HOME/shell_plugins/k/bind.sh" "$@" ;;

  brew) shift && "$SHARILS_HOME/shell_plugins/k/brew.sh" "$@" ;;

  burnout) shift && "$SHARILS_HOME/shell_plugins/k/burnout.sh" "$@" ;;

  cat) shift && "$SHARILS_HOME/shell_plugins/k/cat.sh" "$@" ;;

  cdnic) shift && "$SHARILS_HOME/shell_plugins/k/cdnic.sh" "$@" ;;

  cie) shift && "$SHARILS_HOME/shell_plugins/k/cie.sh" "$@" ;;

  circadian) shift && "$SHARILS_HOME/shell_plugins/k/circadian.sh" "$@" ;;

  color) shift && "$SHARILS_HOME/shell_plugins/k/color.sh" "$@" ;;

  court) shift && "$SHARILS_HOME/shell_plugins/k/court.sh" "$@" ;;

  credit-card) shift && "$SHARILS_HOME/shell_plugins/k/credit-card.sh" "$@" ;;

  cup) shift && "$SHARILS_HOME/shell_plugins/k/cup.sh" "$@" ;;

  curl) shift && "$SHARILS_HOME/shell_plugins/k/curl.sh" "$@" ;;

  d) shift && "$SHARILS_HOME/shell_plugins/k/d.sh" "$@" ;;

  db) shift && "$SHARILS_HOME/shell_plugins/k/db.sh" "$@" ;;

  ddx) shift && "$SHARILS_HOME/shell_plugins/k/ddx.sh" "$@" ;;

  debian) shift && "$SHARILS_HOME/shell_plugins/k/debian.sh" "$@" ;;

  devices) shift && "$SHARILS_HOME/shell_plugins/k/devices.sh" "$@" ;;

  diet) shift && "$SHARILS_HOME/shell_plugins/k/diet.sh" "$@" ;;

  digit) shift && "$SHARILS_HOME/shell_plugins/k/digit.sh" "$@" ;;

  distortion) shift && "$SHARILS_HOME/shell_plugins/k/distortion.sh" "$@" ;;

  doctor) shift && "$SHARILS_HOME/shell_plugins/k/doctor.sh" "$@" ;;

  dodecagram) shift && "$SHARILS_HOME/shell_plugins/k/dodecagram.sh" "$@" ;;

  dr) shift && "$SHARILS_HOME/shell_plugins/k/dr.sh" "$@" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/k/e.sh" "$@" ;;

  fib) shift && "$SHARILS_HOME/shell_plugins/k/fib.sh" "$@" ;;

  font) shift && "$SHARILS_HOME/shell_plugins/k/font.sh" "$@" ;;

  food) shift && "$SHARILS_HOME/shell_plugins/k/food.sh" "$@" ;;

  g) shift && "$SHARILS_HOME/shell_plugins/k/g.sh" "$@" ;;

  geneva) shift && "$SHARILS_HOME/shell_plugins/k/geneva.sh" "$@" ;;

  gh) shift && l 'https://docs.github.com/en/get-started/using-github/keyboard-shortcuts#site-wide-shortcuts' ;;

  ha) shift && "$SHARILS_HOME/shell_plugins/k/ha.sh" "$@" ;;

  heptagram) shift && "$SHARILS_HOME/shell_plugins/k/heptagram.sh" "$@" ;;

  hippocratic) shift && "$SHARILS_HOME/shell_plugins/k/hippocratic.sh" "$@" ;;

  horoscope) shift && "$SHARILS_HOME/shell_plugins/k/horoscope.sh" "$@" ;;

  http) shift && "$SHARILS_HOME/shell_plugins/k/http.sh" "$@" ;;

  id) shift && "$SHARILS_HOME/shell_plugins/k/id.sh" "$@" ;;

  id1) shift && "$SHARILS_HOME/shell_plugins/k/id1.sh" "$@" ;;

  iphone) shift && "$SHARILS_HOME/shell_plugins/k/iphone.sh" "$@" ;;

  ja) shift && "$SHARILS_HOME/shell_plugins/k/ja.sh" "$@" ;;

  joel) shift && "$SHARILS_HOME/shell_plugins/k/joel.sh" "$@" ;;

  joke) shift && "$SHARILS_HOME/shell_plugins/k/joke.sh" "$@" ;;

  lehman) shift && "$SHARILS_HOME/shell_plugins/k/lehman.sh" "$@" ;;

  manila) shift && "$SHARILS_HOME/shell_plugins/k/manila.sh" "$@" ;;

  mbti) shift && "$SHARILS_HOME/shell_plugins/k/mbti.sh" "$@" ;;

  med) shift && "$SHARILS_HOME/shell_plugins/k/med.sh" "$@" ;;

  manifesto) shift && "$SHARILS_HOME/shell_plugins/k/manifesto.sh" "$@" ;;

  maslow) shift && "$SHARILS_HOME/shell_plugins/k/maslow.sh" "$@" ;;

  messages) shift && "$SHARILS_HOME/shell_plugins/k/messages.sh" "$@" ;;

  ml) shift && "$SHARILS_HOME/shell_plugins/k/ml.sh" "$@" ;;

  n) shift && "$SHARILS_HOME/shell_plugins/k/n.sh" "$@" ;;

  napkin) shift && "$SHARILS_HOME/shell_plugins/k/napkin.sh" "$@" ;;

  nd) shift && "$SHARILS_HOME/shell_plugins/k/nd.sh" "$@" ;;

  nf) shift && "$SHARILS_HOME/shell_plugins/k/nf.sh" "$@" ;;

  nightingale) shift && "$SHARILS_HOME/shell_plugins/k/nightingale.sh" "$@" ;;

  node) shift && "$SHARILS_HOME/shell_plugins/k/node.sh" "$@" ;;

  o) shift && "$SHARILS_HOME/shell_plugins/k/o.sh" "$@" ;;

  oote) shift && "$SHARILS_HOME/shell_plugins/k/oote.sh" "$@" ;; # Obligation of the Engineer

  oxymoron) shift && "$SHARILS_HOME/shell_plugins/k/oxymoron.sh" "$@" ;;

  pareto) shift && "$SHARILS_HOME/shell_plugins/k/pareto.sh" "$@" ;;

  perfect) shift && "$SHARILS_HOME/shell_plugins/k/perfect.sh" "$@" ;;

  phi) shift && "$SHARILS_HOME/shell_plugins/k/phi.sh" "$@" ;;

  pi) shift && "$SHARILS_HOME/shell_plugins/k/pi.sh" "$@" ;;

  port) "$SHARILS_HOME/shell_plugins/k/port.sh" "$@" ;;

  posix) echo '#%+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  prices) shift && "$SHARILS_HOME/shell_plugins/k/prices.sh" "$@" ;;

  prime) shift && "$SHARILS_HOME/shell_plugins/k/prime.sh" "$@" ;;

  printable) shift && "$SHARILS_HOME/shell_plugins/k/printable.sh" "$@" ;;

  quality) shift && "$SHARILS_HOME/shell_plugins/k/quality.sh" "$@" ;;

  rce) shift && "$SHARILS_HOME/shell_plugins/k/rce.sh" "$@" ;; # Ritual of the Calling of an Engineer

  rtm) shift && "$SHARILS_HOME/shell_plugins/k/rtm.sh" "$@" ;;

  # safe = posix & uri
  safe) echo '-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  salary) shift && "$SHARILS_HOME/shell_plugins/k/salary.sh" "$@" ;;

  scrcpy) shift && "$SHARILS_HOME/shell_plugins/k/scrcpy.sh" "$@" ;;

  sdg) shift && "$SHARILS_HOME/shell_plugins/k/sdg.sh" "$@" ;;

  size) shift && "$SHARILS_HOME/shell_plugins/k/size.sh" "$@" ;;

  solar) shift && "$SHARILS_HOME/shell_plugins/k/solar.sh" "$@" ;;

  stat) shift && stat -x ~/Sync/KeePass/keepass.kdbx ;;

  tarot) shift && "$SHARILS_HOME/shell_plugins/k/tarot.sh" "$@" ;;

  time) shift && "$SHARILS_HOME/shell_plugins/k/time.sh" "$@" ;;

  tld) shift && "$SHARILS_HOME/shell_plugins/k/tld.sh" "$@" ;;

  u) shift && "$SHARILS_HOME/shell_plugins/k/u.sh" "$@" ;;

  ubuntu) shift && "$SHARILS_HOME/shell_plugins/k/ubuntu.sh" "$@" ;;

  uri) echo "!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~" ;;

  vet) shift && "$SHARILS_HOME/shell_plugins/k/vet.sh" "$@" ;;

  w) shift && "$SHARILS_HOME/shell_plugins/k/w.sh" "$@" ;;

  warm) shift && "$SHARILS_HOME/shell_plugins/k/warm.sh" "$@" ;;

  wedding) shift && "$SHARILS_HOME/shell_plugins/k/wedding.sh" "$@" ;;

  week) shift && "$SHARILS_HOME/shell_plugins/k/week.sh" "$@" ;;

  welfare) shift && "$SHARILS_HOME/shell_plugins/k/welfare.sh" "$@" ;;

  word) shift && "$SHARILS_HOME/shell_plugins/k/word.sh" "$@" ;;

  yue) shift && "$SHARILS_HOME/shell_plugins/k/yue.sh" "$@" ;;

  zip)
    shift
    z t_init
    dir="$(z t && echo "$PWD")"
    cd "$dir" || return $?
    path="$(k b)"
    printf %s "$*" >"$path"
    zip -er "$path.zip" "$path"
    rm "$path"
    cd - || return $?
    printf %s "$dir/$path.zip" | pbcopy
    ;;

  -q | -L | -l | -U | -n | -s | -e | -x | -c | -h) "$SHARILS_HOME/shell_plugins/k/generate.sh" "$@" ;;

  esac
}
