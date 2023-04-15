#!/usr/bin/env sh

sh() {
  cmd="$1"
  shift
  case "$cmd" in
  t)
    cmd="${*:-sh}"
    echo "==> $cmd <==" >&2
    x sh | tee "$cmd"
    x + "$cmd"
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

sh "$@"
