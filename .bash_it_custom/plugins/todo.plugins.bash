#!/usr/bin/env bash
export TODOTXT_DATE_ON_ADD=1

todoinit() {
    local SHARILS_HOME="$HOME/git/github.com/sharils/home"
    local TODO_CONFIG='.todo/config'

    # shellcheck disable=SC2016
    mkdir -p "$(dirname $TODO_CONFIG)" && \
    cp "$SHARILS_HOME/.todo/config" "$TODO_CONFIG" && \
    sed -i'.bak' $"/^export TODO_DIR/s@\$HOME@$PWD@; /^export TODO_DIR/s@$USER@\$USER@;" $TODO_CONFIG && \
    rm "$TODO_CONFIG.bak" && \
    echo 'export TODOTXT_CFG_FILE=$PWD/$TODO_CONFIG'
}

for priority in {a..z}; do
    eval $"ta$priority() { todo.sh add \"($priority) \$*\"; }"
    eval $"tp$priority() { todo.sh pri \"\$*\" $priority; }"
done
unset priority
