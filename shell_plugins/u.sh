#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

u() {
  case "$1" in

  clean) shift && rm "${@:--fir}" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/u/e.sh" "$@" ;;

  focus_wip)
    cat <<'EOF'
#!/usr/bin/fish

switch $argv[1]
    case 'start'
        pgrep qutebrowser && /usr/bin/qutebrowser --nowindow ':set content.blocking.method both ;;
        set content.blocking.hosts.lists ["https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts"] ;;
        message-info "Blocked social media websites"'
    case 'stop'
        pgrep qutebrowser && /usr/bin/qutebrowser --nowindow ':set content.blocking.method adblock ;; set content.blocking.hosts.lists [] ;;
        message-info "Enabled social media websites"'
    case '*'
        echo 'argument should be start/stop'
end
EOF
    ;;

  l) shift && l "$@" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  o) open -b org.qt-project.Qt.QtWebEngineCore ;;

  *) qutebrowser "$@" ;;

  esac
}
