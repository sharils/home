#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

joel() {
  cat <<'EOF'
1. Do you use source control?
2. Can you make a build in one step?
3. Do you make daily builds?
4. Do you have a bug database?
5. Do you fix bugs before writing new code?
6. Do you have an up-to-date schedule?
7. Do you have a spec?
8. Do programmers have quiet working conditions?
9. Do you use the best tools money can buy?
10. Do you have testers?
11. Do new candidates write code during their interview?
12. Do you do hallway usability testing?

https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/
EOF
}

joel "$@"
