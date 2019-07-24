todoinit() {
    local TODO_CONFIG='.todo/config'

    # shellcheck disable=SC2016
    cp -r "$HOME/.todo" . && \
    sed -i'.bak' $"/^export TODO_DIR/s@\$HOME@$PWD@; /^export TODO_DIR/s@$USER@\$USER@;" $TODO_CONFIG && \
    rm "$TODO_CONFIG.bak" && \
    echo 'export TODOTXT_CFG_FILE=$PWD/$TODO_CONFIG'
}
