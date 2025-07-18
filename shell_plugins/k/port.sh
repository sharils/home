#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

port() {
  cat <<'EOF'
serial double fw 1122 2233 3344 4455 5566 6677 7788 8899 9900
serial double bw 9988 8877 7766 6655 5544 4433 3322 2211 1100
serial fw 1234 2345 3456 4567 6789 7890
serial bw 8765 7654 6543 5432 4321 3210
thousand 2000 3000 4000 5000 6000 7000 8000 9000
double 2020 3030 4040 5050 6060 7070 8080 9090
working 1912 19128 2007 20076 https://statfy.mol.gov.tw/index17.aspx
tw 1314 1450 7878 8787
fib 1123 11235
black death 1346 1353
phi 1618 16180
spanish flu 1918 1920
log2 3010 30102
days/month 3041 30416
pi 3141 31415
anything 3721
acidity 4675
log3 4771 47712
card 8560 5398 10120
pressure 6080 9012
sqrt 14142 17320
e 27182 36787
incident 8964 47228
absolute zero 27315 45967
fall of constantinople 1453
iron 1538
glorious revolution 1689
electricity 1752
declaration of independence 1776
dissolution of the holy roman empire 1806
overture 1812
roc 1911
tel 1999
resolution 2758
fat tom 4675
heart 5999
polar 6656
sg area 7251
teeth 8020
cpu 8086
hours 8760
yard 9144
film 9527
a4 21297 https://en.wikipedia.org/wiki/A4
salary 27470
days/month 30416
taiwan area 36197
salt 38754
EOF
}

port "$@"
