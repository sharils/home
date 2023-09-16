#!/usr/bin/env sh

node_red() {
  docker run --interactive --tty --publish 1880:1880 --volume node_red_data:/data nodered/node-red "$@"
}

node_red "$@"
