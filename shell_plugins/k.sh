#!/usr/bin/env bash

k() {
  case "$1" in

  0x)
    cat <<'TEXT'
==> ASCII <<=
  0 00 nul    1 01 soh    2 02 stx    3 03 etx    4 04 eot    5 05 enq    6 06 ack    7 07 bel
  8 08 bs     9 09 ht    10 0a nl    11 0b vt    12 0c np    13 0d cr    14 0e so    15 0f si
 16 10 dle   17 11 dc1   18 12 dc2   19 13 dc3   20 14 dc4   21 15 nak   22 16 syn   23 17 etb
 24 18 can   25 19 em    26 1a sub   27 1b esc   28 1c fs    29 1d gs    30 1e rs    31 1f us
 32 20 sp    33 21  !    34 22  "    35 23  #    36 24  $    37 25  %    38 26  &    39 27  '
 40 28  (    41 29  )    42 2a  *    43 2b  +    44 2c  ,    45 2d  -    46 2e  .    47 2f  /
 48 30  0    49 31  1    50 32  2    51 33  3    52 34  4    53 35  5    54 36  6    55 37  7
 56 38  8    57 39  9    58 3a  :    59 3b  ;    60 3c  <    61 3d  =    62 3e  >    63 3f  ?
 64 40  @    65 41  A    66 42  B    67 43  C    68 44  D    69 45  E    70 46  F    71 47  G
 72 48  H    73 49  I    74 4a  J    75 4b  K    76 4c  L    77 4c  M    78 4d  N    79 4e  O
 80 50  P    81 51  Q    82 52  R    83 53  S    84 54  T    85 55  U    86 56  V    87 57  W
 88 58  X    89 59  Y    90 5a  Z    91 5b  [    92 5c  \    93 5d  ]    94 5e  ^    95 5f  _
 96 60  `    97 61  a    98 62  b    99 63  c   100 64  d   101 65  e   102 66  f   103 67  g
104 68  h   105 69  i   106 6a  j   107 6b  k   108 6c  l   109 6d  m   110 6e  n   111 6f  o
112 70  p   113 71  q   114 72  r   115 73  s   116 74  t   117 75  u   118 76  v   119 77  w
120 78  x   121 79  y   122 7a  z   123 7b  {   124 7c  |   125 7d  }   126 7e  ~   127 7f del

==> PRINTABLE <<=
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

==> URI <<=
!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~

==> POSIX <<=
#%+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~

==> POSIX URI <<=
-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~
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
      xargs -n1 |
      sort -R |
      xargs |
      perl -pe 's/\b\w/\U$&/g' |
      tr -d \\n |
      tr ' ' - |
      pbcopy
    pbpaste | wc
    ;;

  g)
    no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
    pbpaste | wc
    ;;

  u) shift && sed -n '3527,3842p' /Applications/qutebrowser.app/Contents/Resources/config/configdata.yml | grep "$*" ;;

  esac
}
