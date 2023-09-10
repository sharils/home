#!/usr/bin/env sh

default_conf() {
  mkdir -p ./etc/nginx/templates
  docker run --interactive --rm --tty nginx:1.23-alpine cat /etc/nginx/conf.d/default.conf >./etc/nginx/templates/default.conf.template
}

default_conf "$@"
