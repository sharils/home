#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

pmdr() {
  if [ $# -eq 0 ]; then
    cat <<'EOF' | column -t
minute  pomodoro  short  long  break    total
25      1         1      0     3—5      28—30
50      2         2      0     6—10     56—60
75      3         3      0     9—15     84—90
100     4         3      1     24—45    124—145
125     5         4      1     27—50    152-175
150     6         5      1     30—55    180—205
175     7         6      1     33—60    208—235
200     8         6      2     48—90    248—290
225     9         7      2     51—95    276—320
250     10        8      2     54—100   304—350
275     11        9      2     57—105   332—380
300     12        9      3     72—135   372—435
325     13        10     3     75—140   400—465
350     14        11     3     78—145   428—495
375     15        12     3     81—150   456—525
400     16        12     4     96—180   496—580
425     17        13     4     99—185   524—610
450     18        14     4     102—190  552—640
475     19        15     4     105—195  580—670
500     20        15     5     120—225  620—725
525     21        16     5     123—230  648—755
550     22        17     5     126—235  676—785
575     23        18     5     129—240  704—815
600     24        18     6     144—270  744—870
EOF
    return $?
  fi
  LONG="${X_PMDR:-4}"
  LONG_MAX=30
  LONG_MIN=15
  POMODORO=25
  SHORT_MAX=5
  SHORT_MIN=3

  next=$(((POMODORO - $1 % POMODORO) % POMODORO))
  minutes=$(($1 + next))
  pomodoro=$(($1 / POMODORO))
  long=$((pomodoro / LONG))
  short=$((pomodoro - long))
  break_min=$((short * SHORT_MIN + long * LONG_MIN))
  break_max=$((short * SHORT_MAX + long * LONG_MAX))
  total_min=$(($1 + break_min))
  total_max=$(($1 + break_max))

  cat <<EOF
til next  $next ($minutes)
pomodoro  $pomodoro
short     $short
long      $long
break     ${break_min}—$break_max
total     ${total_min}—$total_max
EOF
}

pmdr "$@"
