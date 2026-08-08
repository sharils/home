update_terminal_cwd() {
    printf "\033]7;file://%s%s\a" "$HOSTNAME" "$PWD"
}
if [[ "$PROMPT_COMMAND" != *update_terminal_cwd* ]]; then
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
