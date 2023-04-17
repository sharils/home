#!/usr/bin/env sh

r() {
  case "$1" in
  d)
    shift
    case "$1" in
    b) shift && set -- --book "$@";;
    esac
    rustup docs "$@"
    ;;
  e) shift && rustc --explain "$@" | l md ;;
  *) reset ;;
  esac
}
