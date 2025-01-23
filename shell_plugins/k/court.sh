#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

court() {
  roc="$(echo "$(date +%Y) - 1911" | bc)"

  cat <<EOF
今為${roc}年度醫字第1號民事案件作證，當據實陳述，絕無匿、飾、增、減，如有虛偽陳述，願受偽證之處罰，謹此具結。
EOF
}

court "$@"
