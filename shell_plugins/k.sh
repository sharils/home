#!/usr/bin/env bash

k() {
  case "$1" in

  %)
    case "${2:-all}" in
    all)
      for cmd in datetime date time year month week day hour minute second timezone literal extension; do
        k % "$cmd"
      done
      ;;

    *) cmd="$2" && shift 2 && "$SHARILS_HOME/shell_plugins/k/%/$cmd.sh" "$@" ;;
    esac
    ;;

  0d) "$SHARILS_HOME/shell_plugins/k/0d.sh" "$@" ;;

  0x) "$SHARILS_HOME/shell_plugins/k/0x.sh" "$@" ;;

  b)
    shift
    keepassxc-cli generate --custom '0123456789ABCDEFGHJKMNPQRSTVWXYZ' --length "${@:-4}" | tr -d \\n | pbcopy
    pbpaste
    ;;

  bind)
    shift
    bind -p | grep --color=never ^#
    bind -p | grep '"[^"]\+"' | grep -v 'self-insert\|do-lowercase-version\|digit-argument' | grep "$*"
    ;;

  d) shift && "$SHARILS_HOME/shell_plugins/k/d.sh" "$@" ;;

  e) $EDITOR "$@" ~/.config/karabiner/karabiner.json ;;

  g)
    shift
    no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
    pbpaste | wc
    ;;

  n) shift && "$SHARILS_HOME/shell_plugins/k/n.sh" "$@" ;;

  port) "$SHARILS_HOME/shell_plugins/k/port.sh" "$@" ;;

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

  zip)
    shift
    z t_init
    dir="$(z t && echo "$PWD")"
    cd "$dir" || return $?
    path="$(k b)"
    printf %s "$*" > "$path"
    zip -er "$path.zip" "$path"
    rm "$path"
    cd - || return $?
    printf %s "$dir/$path.zip" | pbcopy
    ;;

  esac
}
