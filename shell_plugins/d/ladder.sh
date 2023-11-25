#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ladder() {
  docker run --detach --env RULESET=https://t.ly/14PSf --name ladder --publish 8080:8080 ghcr.io/everywall/ladder:latest "$@"
}

ladder "$@"
