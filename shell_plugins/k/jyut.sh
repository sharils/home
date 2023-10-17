#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

jyut() {
  cat <<'EOF' | grep "${@:-}"
b     ㄅ
p     ㄆ
m     ㄇ
f     ㄈ
d     ㄉ
t     ㄊ
n     ㄋ
l     ㄌ
g     ㄍ
k     ㄎ
ng    ㄫ
h     ㄏ
z     ㄐ
c     ㄑ
s     ㄒ
gw    ㄍㄨ
kw    ㄎㄨ
j     ㄧ
w     ㄨ
aa    ㄚ
aai   ㄞ
aau   ㄠ
aam   ㄚㄇ
aan   ㄢ
aang  ㄤ
aap   ㄚㄆ
aat   ㄚㄊ
aak   ㄚㄎ
ai    ㄧ
au    ㄨ
am    ㆬ
an    ㄣ
ang   ㄥ
ap    ㄆ
at    ㄊ
ak    ㄎ
e     ㄝ
ei    ㄟ
eu    ㄝㄨ
em    ㄝㆬ
en    ㄝㄣ
eng   ㄝㄥ
ep    ㄝㄆ
et    ㄝㄊ
ek    ㄝㄎ
i     ㄧ
iu    ㄧㄨ
im    ㄧㆬ
in    ㄧㄣ
ing   ㄧㄥ
ip    ㄧㄆ
it    ㄧㄊ
ik    ㄧㄎ
o     ㄛ
oi    ㄛㄧ
ou    ㄡ
on    ㄛㄋ
ong   ㄛㄫ
ot    ㄛㄊ
ok    ㄛㄎ
u     ㄨ
ui    ㄨㄧ
un    ㄨㄣ
ung   ㄨㄥ
ut    ㄨㄊ
uk    ㄨㄎ
oe
oeng  ㄥ
oek   ㄎ
eoi   ㄧ
eon   ㄣ
eot   ㄊ
yu    ㄩ
yun   ㄩㄣ
yut   ㄩㄊ
m     ㆬ
ng    ㆭ
EOF
}

jyut "$@"
