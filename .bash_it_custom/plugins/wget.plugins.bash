placeholdjp() {
    if [ $# -eq 0 ]; then size='1x1'; else size="$*"; fi
    wget --directory-prefix="$HOME/Downloads" "http://placehold.jp/$size.png"
}
