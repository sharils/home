#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# Assuming only 1 external display
x_displayplacer() {
  rotation="$(displayplacer list | awk -v RS="" '/Serial screen id/ && !/Type: MacBook built in screen/' | sed -n 's/^.*Rotation: *//p')"
  case "$rotation" in
      *[!0-9]*)
          echo 'Warning: Rotation not found' >&2
          exit 1
          ;;
  esac

  # TODO (sharils): make safer without eval
  eval "$(echo "displayplacer $X_DISPLAYPLACER" | sed "s/degree:[0-9]*/degree:$(( (rotation + 90) % 360 ))/")"
}

x_displayplacer "$@"
