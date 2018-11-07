# https://twitter.com/thatzackhawkins/status/893495424375341058?lang=en
yo() {
    npx --package yo --package "generator-${1%:*}" --call "yo $*"
}
