#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

v_v() {
  case "$1" in
  erl) erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().' ;;
  ex) elixir --version ;;
  f | flyctl) flyctl version ;;
  phx) mix phx.new --version ;;
  py) python --version ;;
  *) "$@" --version ;;
  esac
}

v_v "$@"
