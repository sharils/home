#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

graphql_codegen() {
  npx --yes --package graphql --package @graphql-codegen/cli -- graphql-codegen "$@"
}

graphql_codegen "$@"
