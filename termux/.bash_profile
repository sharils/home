alias q='pkill sshd && exit'
alias s='sshd'

x() {
  cmd="$1"
  shift

  case "$cmd" in
  sn)
    # {375..890}
    if [ $# -eq 0 ]; then
      ls ~/sn
      return
    fi
    set -x
    for i in $(seq "$1" "${2:-$1}"); do
      curl --fail --remote-name --location --continue-at - --output-dir ~/sn "http://media.grc.com/sn/sn-$i.mp3"
    done
    set +x
    ;;
  esac
}

eval "$(starship init bash)"
