alias sp='system_profiler'
alias spls='system_profiler -listDataTypes'
alias spp='system_profiler SPPowerDataType'
# shellcheck disable=SC2139
alias sppb=$'system_profiler SPPowerDataType | yq \'.Power["Battery Information"]\''
