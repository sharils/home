#!/usr/bin/env bash

gclt() {
    git clone --depth=1 "$1" "/tmp/$(basename "$1")"
}
