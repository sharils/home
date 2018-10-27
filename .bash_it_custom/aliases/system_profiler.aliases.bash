alias sp='system_profiler'
alias spls='system_profiler -listDataTypes'
# shellcheck disable=SC2139
alias spb=$'system_profiler SPPowerDataType | yq \'.Power["Battery Information"]\''
