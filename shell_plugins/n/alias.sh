#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

n_alias() {
  cat <<'EOF' | sed '/^#/d' | grep "\(^\| \)$1\( \|$\)" | cut -d' ' -f1
# Biome is a toolchain for the web: formatter, linter and more
@biomejs/biome biome

# A tool for creating and developing Ionic Framework mobile apps.
@ionic/cli ionic

# Command-line interface for mermaid
@mermaid-js/mermaid-cli mmdc

# neu CLI for Neutralinojs
@neutralinojs/neu neu

# A npm package wrapper for OpenAPI Generator (https://github.com/OpenAPITools/openapi-generator), generates which API client libraries (SDK generation), server stubs, documentation and configuration automatically given an OpenAPI Spec (v2, v3)
@openapitools/openapi-generator-cli openapi-generator-cli

# Security & License Compliance For Your App's Dependencies 🪱
@sandworm/audit sandworm sandworm-audit

# Presentation slides for developers
@slidev/cli slidev

# SQL javascript database Excel XLSX XLS CSV https://github.com/alasql/alasql/wiki/AlaSQL-CLI
alasql

# Astro is a modern site builder with web best practices, performance, and DX front-of-mind.
astro

# Super Cool NPM Playground right on the Node REPL
baapan

# BackstopJS: Catch CSS curveballs.
backstopjs backstop

# Live CSS Reload & Browser Syncing
browser-sync browser-sync

# Cli for the node BundlePhobia Service
bundle-phobia-cli bundle-phobia bundle-phobia-install

# Chance CLI - random generator for the command line
chance-cli chance

# The CLI used for communicating with CodeSandbox
codesandbox

# Turns docker run commands into docker-compose files!
composerize

# Find out which of your dependencies are slowing you down 🐢
cost-of-modules

# Pulls down the Contributors Covenant into your project.
covgen

# Stream and CLI to convert CSV to JSON
csv2json

# Cypress is a next generation front end testing tool built for the modern web
cypress

# Straightforward project scaffolding
degit

# Validate and visualize dependencies. With your rules. JavaScript, TypeScript, CoffeeScript. ES6, CommonJS, AMD.
dependency-cruiser dependency-cruise depcruise depcruise-baseline depcruise-fmt depcruise-wrap-stream-in-html

# EAS command line tool
eas-cli eas

# An AST-based pattern checker for JavaScript.
eslint

# The Expo SDK
expo

# Automatically fetch gitignore files for any project type from github into your new project
gitignore

# A toolkit for JavaScript codemods
jscodeshift

# detector of copy/paste in files
jscpd

# Node package to parse and generate changelogs following the [keepachangelog](https://keepachangelog.com/) format.
keep-a-changelog changelog

# Find unused files, dependencies and exports in your TypeScript and JavaScript projects
knip

# A simple measure of software dependency freshness
libyear

# Easily generate licenses for your projects!
license

# Check license info for a package
license-checker

# Automated auditing, performance metrics, and best practices for the web.
lighthouse chrome-debug smokehouse

# A tiny (116 bytes), secure URL-friendly unique string ID generator
nanoid

# Command-line companion utility for Postman
newman

# A linter and formatter for Nginx configuration files
nginx-linter

# A better `npm publish`
np

# Check for outdated, incorrect, and unused dependencies.
npm-check

# Find newer versions of dependencies than what your package.json allows
npm-check-updates ncu cu

# git merge driver for automatically merging lockfiles
npm-merge-driver

# Run any command on specific Node.js versions
nve

# The core Nx plugin contains the core functionality of Nx like the project graph, nx commands and task orchestration.
nx

# packagephobia of cli
packagephobia-cli

# Parser generator for JavaScript
pegjs

# Prettier is an opinionated code formatter
prettier

# Prettier formatter for package.json files
prettier-package-json

# A command-line tool for querying the 'Have I been pwned?' service.
pwned

# Generate integration tests by recording server activity without writing a single line of code.
pythagora

# cli utility for querying the node_modules directory
qnm

# QRCodes, in the terminal
qrcode-terminal qt

# Use react-devtools outside of the browser
react-devtools

# A framework for building native apps using React
react-native

# CLI that generates beautiful README.md files.
readme-md-generator readme

# The JSON Resume command line interface
resume-cli resume

# Run Selenium IDE projects in cli
selenium-side-runner

# Node.js module and command-line tool for exporting SVG to PNG and JPEG.
svgexport

# Trello CLI tool
trello-cli trello

# Hauls your files around without breaking your imports
trucker

# TypeScript execution environment and REPL for node.js, with source map support
ts-node ts-node-cwd ts-node-esm ts-node-script ts-node-transpile-only ts-script

# Transpile TypeScript code to fully compatible JavaScript + JSDoc comments.
ts-to-jsdoc

# A Tool to Setup TailwindCSS in your Project with a Single Command
twify

# Scans your nodejs project folder and shows obsolete files and modules
unimported

# A lightweight private npm proxy registry
verdaccio

# wait-on is a cross platform command line utility and Node.js API which will wait for files, ports, sockets, and http(s) resources to become available
wait-on

# A command line tool to help build, run, and test web extensions
web-ext

# Node is running but you don't know why? why-is-node-running is here to help you.
why-is-node-running

# Work with npm/yarn packages locally like a boss.
yalc
EOF
}

n_alias "$@"
