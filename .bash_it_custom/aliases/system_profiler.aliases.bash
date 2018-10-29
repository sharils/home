alias sp='system_profiler'
alias spls='system_profiler -listDataTypes'
# shellcheck disable=SC2139
alias spp=$'system_profiler SPPowerDataType | yq \'.Power\''
# shellcheck disable=SC2139
alias sppb=$'system_profiler SPPowerDataType | yq \'.Power["Battery Information"]\''
