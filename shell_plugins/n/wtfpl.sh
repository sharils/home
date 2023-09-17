#!/usr/bin/env sh

wtfpl() {
  curl --silent 'http://www.wtfpl.net/txt/copying/' > LICENSE
}

wtfpl "$@"
