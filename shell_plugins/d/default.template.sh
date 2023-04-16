#!/usr/bin/env sh

default_template() {
  mkdir -p ./etc/nginx/templates
  docker run --interactive --rm --tty nginx:1.23-alpine cat /etc/nginx/conf.d/default.conf >./etc/nginx/templates/default.template
}

default_template "$@"
