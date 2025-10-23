#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

size() {
  cat <<'EOF' | sed 's/\t/  /g'
ISO/IEC 7810    	 85.60mm	  53.98mm
HTC Desire 12s  	154.20cm	  72.70cm	   8.30cm	  5.7in	150.000g	 8.1.0
MacBook Air 2024	 30.41cm	  21.50cm	   1.13cm	 13.6in	  1.24kg	15.6.1
iPhone 6S       	138.30cm	  67.10cm	   7.10cm	  4.7in	143.000g	15.8.5
Cool Summer     	(50, 95)	(-5, +15)	(-20, +5)	(5, 35)
EOF
}

size "$@"
