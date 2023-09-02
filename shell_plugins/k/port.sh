#!/usr/bin/env sh

port() {
  cat <<'EOF'
serial double:
  1122 2233 3344 4455 5566 6677 7788 8899 9900  9988 8877 7766 6655 5544 4433 3322 2211  1100
serial:
  1234 2345 3456 4567 6789 7890  9876 8765 7654 6543 5432 4321  3210
thousand;
  2000 3000 4000 5000 6000 7000 8000 9000
double:
  2020 3030 4040 5050 6060 7070 8080 9090
iron:
  1538
fib:
  11235
sqrt:
  14142 17320
phi:
  16180
e:
  27182 36787
pi:
  31415
EOF
}

port "$@"
