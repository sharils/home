#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

yue() {
  cat <<'EOF' | grep "${@:-}" | column
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
ai    ㆿ ㄧ
au    ㆿ ㄨ
am    ㆿ ㆬ
an    ㆿ ㄣ
ang   ㆿ ㄥ
ap    ㆿ ㄆ
at    ㆿ ㄊ
ak    ㆿ ㄎ
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
on    干
ong   丄
ot    ㄛㄊ
ok    ㄛㄎ
u     ㄨ
ui    ㄨㄧ
un    ㄨㄣ
ung   ㄨㄥ
ut    ㄨㄊ
uk    ㄨㄎ
oe    ㆾ
oeng  ㆾ ㄥ
oek   ㆾ ㄎ
eoi   ㆾ ㄧ
eon   ㆾ ㄣ
eot   ㆾ ㄊ
yu    ㄩ
yun   ㄩㄣ
yut   ㄩㄊ
m     ㆬ
ng    ㆭ
EOF

  echo 'Cantonese phonology https://en.wikipedia.org/wiki/Cantonese_phonology#Eight_vowel_analysis'
  echo '粵語注音符號 https://zh.wikipedia.org/zh-tw/%E7%B2%B5%E8%AA%9E%E6%B3%A8%E9%9F%B3%E7%AC%A6%E8%99%9F#%E9%9F%BB%E6%AF%8D'
}

yue "$@"
