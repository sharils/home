alias sp='system_profiler'
alias spls='system_profiler -listDataTypes'
# shellcheck disable=SC2139
alias spb=$'system_profiler SPPowerDataType | yq \'.Power["Battery Information"] | { "Charge Information": .["Charge Information"], "Health Information": .["Health Information"], "Battery Installed": .["Battery Installed"] }\''
