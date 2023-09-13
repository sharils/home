#!/usr/bin/env sh

n_alias() {
  cat <<'EOF' | grep "\(^\| \)$1\( \|$\)" | cut -d' ' -f1
@ionic/cli ionic
@mermaid-js/mermaid-cli mmdc
@neutralinojs/neu neu
@openapitools/openapi-generator-cli openapi-generator-cli
@sandworm/audit sandworm sandworm-audit
baapan
backstopjs backstop
browser-sync browser-sync
bundle-phobia-cli bundle-phobia bundle-phobia-install
chance-cli chance
codesandbox
composerize
cost-of-modules
covgen
csv2json
cypress
degit
dependency-cruiser dependency-cruise depcruise depcruise-baseline depcruise-fmt depcruise-wrap-stream-in-html
eas-cli eas
eslint
expo
gitignore
jscodeshift
jscpd
knip
license
license-checker
lighthouse chrome-debug smokehouse
nanoid
newman
nginx-linter
npm-check
npm-check-updates ncu cu
npm-merge-driver
nve
nx
packagephobia-cli
pegjs
prettier
prettier-package-json
pwned
pythagora
qnm
qrcode-terminal qt
react-devtools
react-native
readme-md-generator readme
resume-cli resume
selenium-side-runner
trello-cli trello
trucker
ts-node ts-node-cwd ts-node-esm ts-node-script ts-node-transpile-only ts-script
ts-to-jsdoc
twify
unimported
verdaccio
wait-on
web-ext
why-is-node-running
EOF
}

n_alias "$@"
