#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://smolsite.zip/UEsDBBQAAgAIAMYVIVfaTMb/VQIAANwDAAAKAAAAaW5kZXguaHRtbHVTUW+bMBB+Lr/ilq1i0wo4BGghJA/t9lBpk6Zpm6Y91cEOeAPMbCeEbv3vO0OjZdIK4mTuvvt8+vw5r0xTr5284pStc22Gmq+djWQD/HI2tPhRKrlrmVfIWqoMnm/HZ3laEg0teQY7Vb+cMWpoNiYCvS9fH5r64nxxg0voBTPVyp2HLlRclJXBdeLCXvD+Wh5WLgEC8xBsDrtavXIrY7osCPq+9/uFL1UZhIQQy+ueL94ibUdNBWzlvo/AT9MbjFEUQ4QxQrIYSOHHcWh5sRLbmKb7yCfhTQIxluIxJoB/kBTeBPbmHoJtTNMv+N03CVwVBKtRYpltHsbqE+QFAYv1LBhz3lj5H/mVZXdhK+p65Z6HC3bJYkanhCc7WggzoC5+9JhSu5qvXL7nrWTMDSYNrBy4mr1aOlvZGm9LG1EPGWjaak9zJfCsGqpK0WYo71V3WDoPTsFbwxUe8FlHGRNteVLrFLeFv+eLhx4S+y6ds6MLLol9lyf9IbHtZ4YfzNErU+rByYPJVXkweszJrbus4+brW+NqoKAbWWth+DOEzNeOk3frT5XQ0Fey5mArqIDRIFotGAdTcfj88R2iu0ewhEpqA4PcKY1O1BOmkE1D0aC1aNGf3c4AiqcGU+HEyIUbf7v9YLXlF3BNsSmJgLeFxC2EuQBsBYMy4A/QrRVsZi2p0ZPHgf170QWz7DiIwqvzAjAH3puv33+moGXDjzjckfGDb68bNEMtS+l3bYl4XlTyCeq7gpp/SX7DBifFQT2vV7QDcjdDgced82ASFhfTnXb+AFBLAQIeAxQAAgAIAMYVIVfaTMb/VQIAANwDAAAKAAAAAAAAAAEAAACkgQAAAABpbmRleC5odG1sUEsFBgAAAAABAAEAOAAAAH0CAAAAAA==
smolsite() {
  zip -DXjq9 "${tmp:=$(mktemp -u)}" index.html mylogo.png
  echo "https://smolsite.zip/$(base64 <"$tmp")"
}

smolsite "$@"
