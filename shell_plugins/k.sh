#!/usr/bin/env bash

k() {
  case "$1" in

  0d)
    cat <<'TEXT'
  0 nul    1 soh    2 stx    3 etx    4 eot    5 enq    6 ack    7 bel
  8 bs     9 ht    10 nl    11 vt    12 np    13 cr    14 so    15 si
 16 dle   17 dc1   18 dc2   19 dc3   20 dc4   21 nak   22 syn   23 etb
 24 can   25 em    26 sub   27 esc   28 fs    29 gs    30 rs    31 us
 32 sp    33  !    34  "    35  #    36  $    37  %    38  &    39  '
 40  (    41  )    42  *    43  +    44  ,    45  -    46  .    47  /
 48  0    49  1    50  2    51  3    52  4    53  5    54  6    55  7
 56  8    57  9    58  :    59  ;    60  <    61  =    62  >    63  ?
 64  @    65  A    66  B    67  C    68  D    69  E    70  F    71  G
 72  H    73  I    74  J    75  K    76  L    77  M    78  N    79  O
 80  P    81  Q    82  R    83  S    84  T    85  U    86  V    87  W
 88  X    89  Y    90  Z    91  [    92  \    93  ]    94  ^    95  _
 96  `    97  a    98  b    99  c   100  d   101  e   102  f   103  g
104  h   105  i   106  j   107  k   108  l   109  m   110  n   111  o
112  p   113  q   114  r   115  s   116  t   117  u   118  v   119  w
120  x   121  y   122  z   123  {   124  |   125  }   126  ~   127 del
TEXT
    ;;

  0x)
    cat <<'TEXT'
00 nul   01 soh   02 stx   03 etx   04 eot   05 enq   06 ack   07 bel
08 bs    09 ht    0a nl    0b vt    0c np    0d cr    0e so    0f si
10 dle   11 dc1   12 dc2   13 dc3   14 dc4   15 nak   16 syn   17 etb
18 can   19 em    1a sub   1b esc   1c fs    1d gs    1e rs    1f us
20 sp    21  !    22  "    23  #    24  $    25  %    26  &    27  '
28  (    29  )    2a  *    2b  +    2c  ,    2d  -    2e  .    2f  /
30  0    31  1    32  2    33  3    34  4    35  5    36  6    37  7
38  8    39  9    3a  :    3b  ;    3c  <    3d  =    3e  >    3f  ?
40  @    41  A    42  B    43  C    44  D    45  E    46  F    47  G
48  H    49  I    4a  J    4b  K    4c  L    4d  M    4e  N    4f  O
50  P    51  Q    52  R    53  S    54  T    55  U    56  V    57  W
58  X    59  Y    5a  Z    5b  [    5c  \    5d  ]    5e  ^    5f  _
60  `    61  a    62  b    63  c    64  d    65  e    66  f    67  g
68  h    69  i    6a  j    6b  k    6c  l    6d  m    6e  n    6f  o
70  p    71  q    72  r    73  s    74  t    75  u    76  v    77  w
78  x    79  y    7a  z    7b  {    7c  |    7d  }    7e  ~    7f del
TEXT
    ;;

  b)
    keepassxc-cli generate --custom '0123456789ABCDEFGHJKMNPQRSTVWXYZ' --length "${@:-4}" | tr -d \\n | pbcopy
    pbpaste
    ;;

  bind)
    shift
    bind -p | grep --color=never ^#
    bind -p | grep '"[^"]\+"' | grep -v 'self-insert\|do-lowercase-version\|digit-argument' | grep "$*"
    ;;

  d)
    shift
    # -4 for numeric and special
    cmd="$((${1:-100} - 4))"
    for words in {12..4}; do
      pass="$(keepassxc-cli diceware --words "$words")"
      [ "${#pass}" -lt "$cmd" ] && break
    done
    for _ in {1..10}; do
      longer="$(keepassxc-cli diceware --words "$words")"
      [ "${#pass}" -lt "${#longer}" ] && [ "${#longer}" -lt "$cmd" ] && pass="$longer"
    done
    printf '%s %s %s' "$pass" \
      "$(keepassxc-cli generate --length 1 --numeric)" \
      "$(keepassxc-cli generate --length 1 --custom "${K_D_CUSTOM:-"!'()*._~"}")" |
      tr ' ' '\n' |
      sort -R |
      tr '\n' ' ' |
      perl -pe 's/\b\w/\U$&/g' |
      sed 's/[[:space:]][[:space:]]*$//'|
      tr ' ' - |
      pbcopy
    pbpaste | wc
    ;;

  g)
    shift
    no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
    pbpaste | wc
    ;;

  posix) echo '#%+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  printable)
    cat <<'TEXT'
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
TEXT
    ;;

  # safe = posix & uri
  safe) echo '-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~' ;;

  u) shift && sed -n '3527,3842p' /Applications/qutebrowser.app/Contents/Resources/config/configdata.yml | grep "$*" ;;

  uri) echo "!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~" ;;

  esac
}
