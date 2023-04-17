#!/usr/bin/env sh

n() {
  cat <<'JAVASCRIPT' | node - "$@" | fold -w 4 | tr '\n' ' '
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
}

n "$@"