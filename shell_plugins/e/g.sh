#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

g() {
  path="$(echo "$1" | perl -pe 's/(?<=[a-z])[A-Z]/_$&/g' | tr '[:upper:]' '[:lower:]' | tr '.' '/')"
  lib_path="lib/$path.ex"
  test_path="test/${path}_test.exs"
  mkdir -pv "$(dirname "$lib_path")" "$(dirname "$test_path")"

  if [ ! -f "$lib_path" ]; then
    cat <<EX > "$lib_path"
defmodule $1 do
end
EX
  fi

  if [ ! -f "$test_path" ]; then
    cat <<EXS > "$test_path"
defmodule $1Test do
  use ExUnit.Case, async: true

  test "$1" do
  end
end
EXS
  fi

  echo "vim -O $test_path $lib_path"
}

g "$@"
