pmps() {
    if [[ ! "$#" -eq 1 ]]; then
        echo "pmps <sleep>"
        return
    fi
    while :; do
        date
        pmset -g ps | xargs
        sleep "$1"
    done
}
