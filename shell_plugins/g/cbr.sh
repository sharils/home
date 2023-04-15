#!/usr/bin/env sh

cbr() {
  upstream="${1:-origin/develop}"
  current_branch="$(git rev-parse --abbrev-ref HEAD)"
  g f
  g cb |
    sed 's/^.* //' | grep -Ev '^(?:main|master)$' |
    xargs -I{} -n1 sh -c "git -c advice.skippedCherryPicks=false r $upstream {} || exit 255"
  g cb |
    sed 's/^.* //' | grep -E '^(?:main|master)$' |
    xargs -I{} -n1 sh -c "git -c advice.skippedCherryPicks=false r origin/{} {} || exit 255"
  exit_code=$?
  g co "$current_branch"
  return $exit_code
}

cbr "$@"
