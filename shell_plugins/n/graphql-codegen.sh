#!/usr/bin/env sh

graphql_codegen() {
  npx --yes --package graphql --package @graphql-codegen/cli -- graphql-codegen "$@"
}

graphql_codegen "$@"
