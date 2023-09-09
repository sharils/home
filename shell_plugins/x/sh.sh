#!/usr/bin/env sh

x_sh() {
  cmd="$1"
  shift
  case "$cmd" in
  t)
    cmd="${*:-sh}"
    echo "==> $cmd <==" >&2
    x_sh | tee "$cmd"
    chmod -vv +x "$cmd"
    ;;
  *)
    cat <<'EOF'
#!/usr/bin/env sh
set -o errexit -o nounset -o xtrace

echo 'Hello sh!'
EOF
    ;;
  esac
}

x_sh "$@"
