#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

g() {
  base="$SHARILS_HOME/shell_plugins"
  if [ ! -f "$base/$1.sh" ]; then
    git -C "$SHARILS_HOME" "$@"
    return $?
  fi

  path="$(echo "$*" | tr ' ' '/')"
  for last in "$@"; do :; done

  mkdir -pv "$(dirname "$base/$path.sh")"
  [ ! -f "$base/$path.sh" ] && cat <<SH >"$base/$path.sh"
#!/usr/bin/env sh

[ -n "\$SET_X" ] && set -x

$last() {
  :
}

$last "\$@"
SH

  chmod -vv +x "$base/$path.sh"
  echo "  $last) shift && \"\$SHARILS_HOME/shell_plugins/$path.sh\" \"\$@\" ;;" | pbcopy
  [ -n "$EDITOR" ] && $EDITOR -O "$base/$1.sh" "$base/$path.sh"
  g a "$base/$1.sh" "$base/$path.sh"
}

g "$@"
