#!/usr/bin/env sh

yo() {
  if [ $# -eq 0 ]; then
    open 'https://www.npmjs.com/search?q=keywords%3Ayeoman-generator'
    return $?
  fi

  case "$1" in
  s) shift && npm search keywords:yeoman-generator "$@" ;;
  *) npx --yes --package yo --package "generator-$1" -- yo "$@" ;;
  esac
}

yo "$@"
