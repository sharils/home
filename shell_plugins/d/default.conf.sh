#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

default_conf() {
  mkdir -p ./etc/nginx/templates
  docker run --interactive --rm --tty nginx:1.23-alpine cat /etc/nginx/conf.d/default.conf >./etc/nginx/templates/default.conf.template
}

default_conf "$@"
