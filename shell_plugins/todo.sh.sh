# === EDIT FILE LOCATIONS BELOW ===

# Your todo.txt directory (this should be an absolute path)
export TODO_DIR="$HOME/Sync/todo"

# Your todo/done/report.txt locations
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/.data/done.txt"
export REPORT_FILE="$TODO_DIR/.data/report.txt"

# You can customize your actions directory location
#export TODO_ACTIONS_DIR="$HOME/.todo.actions.d"

# == EDIT FILE LOCATIONS ABOVE ===

# === BEHAVIOR ===

## customize list output
#
# TODOTXT_SORT_COMMAND will filter after line numbers are
# inserted, but before colorization, and before hiding of
# priority, context, and project.
#
# export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -f -k2'
export TODOTXT_SORT_COMMAND='cat'

# TODOTXT_FINAL_FILTER will filter list output after colorization,
# priority hiding, context hiding, and project hiding. That is,
# just before the list output is displayed.
#
# export TODOTXT_FINAL_FILTER='cat'

export TODOTXT_AUTO_ARCHIVE='0'
export TODOTXT_DATE_ON_ADD='1'
export TODOTXT_DEFAULT_ACTION='shorthelp'
