# shellcheck disable=SC2139
alias bi=$'system_profiler SPPowerDataType | yq \'.Power["Battery Information"] | { "Charge Information": .["Charge Information"], "Health Information": .["Health Information"], "Battery Installed": .["Battery Installed"] }\''
