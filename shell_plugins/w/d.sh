#!/usr/bin/env sh

d() {
  case "$1" in
  c) shift && watchman-make --pattern 'Dockerfile' 'docker-compose.yml' --run 'docker compose build' ;;
  *) watchman-make --pattern 'Dockerfile' --run 'docker build .' ;;
  esac
}

d "$@"
