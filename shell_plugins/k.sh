#!/usr/bin/env bash

k() {
  case "$1" in

  0d) "$SHARILS_HOME/shell_plugins/k/0d.sh" "$@" ;;

  0x) "$SHARILS_HOME/shell_plugins/k/0x.sh" "$@" ;;

  b)
    keepassxc-cli generate --custom '0123456789ABCDEFGHJKMNPQRSTVWXYZ' --length "${@:-4}" | tr -d \\n | pbcopy
    pbpaste
    ;;

  bind)
    shift
    bind -p | grep --color=never ^#
    bind -p | grep '"[^"]\+"' | grep -v 'self-insert\|do-lowercase-version\|digit-argument' | grep "$*"
    ;;

  d) "$SHARILS_HOME/shell_plugins/k/d.sh" "$@" ;;

  g)
    shift
    no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
    pbpaste | wc
    ;;

  n)
    shift && cat <<'JAVASCRIPT' | node - "$@" | x chunk 4
// 7 8 9
// 4 5 6
// 1 2 3
const LENGTH = 16;
const NEXT = {
  1: [/* 1, */ 2, /* 3, */ 4, 5, 6, /* 7, */ 8, /* 9 */],
  2: [1, /* 2, */ 3, 4, 5, 6, 7, /* 8, */ 9],
  3: [/* 1, */ 2, /* 3, */ 4, 5, 6, /* 7, */ 8, /* 9 */],
  4: [1, 2, 3, /* 4, */ 5, /* 6, */ 7, 8, 9],
  5: [1, 2, 3, 4, /* 5, */ 6, 7, 8, 9],
  6: [1, 2, 3, /* 4, */ 5, /* 6, */ 7, 8, 9],
  7: [/* 1, */ 2, /* 3, */ 4, 5, 6, /* 7, */ 8, /* 9 */],
  8: [1, /* 2, */ 3, 4, 5, 6, 7, /* 8, */ 9],
  9: [/* 1, */ 2, /* 3, */ 4, 5, 6, /* 7, */ 8, /* 9 */],
};
const length = Number(process.env.LENGTH ?? process.argv[2] ?? LENGTH);
const nodes = Array(length);
let states = Object.keys(NEXT).map(Number);
for (nodeIdx = 0; nodeIdx < nodes.length; nodeIdx++) {
  const stateIdx = Math.floor(Math.random() * states.length);
  const state = states[stateIdx];
  nodes[nodeIdx] = state;
  states = NEXT[state];
}
console.log(nodes.join(''));
JAVASCRIPT
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
