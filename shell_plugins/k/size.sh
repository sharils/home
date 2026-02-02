#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

size() {
  cat <<'EOF' | sed 's/\t/  /g'
Apple Watch 7   	  41.00mm	   35.00mm	   10.70mm	 32.000g	 430px	352px 	Aluminum
ISO/IEC 7810    	  85.60mm	   53.98mm
Pocket Tissue S 	  12.50cm	    8.00cm
Pocket Tissue L 	  12.50cm	   10.50cm
A4              	  29.70cm	   21.00cm
iPhone 6S       	 138.30cm	   67.10cm	    7.10cm	143.000g	 4.7in	15.8.5
HTC Desire 12s  	 154.20cm	   72.70cm	    8.30cm	150.000g	 5.7in	8.1.0
MacBook Air 2024	  30.41cm	   21.50cm	    1.13cm	  1.24kg	13.6in	15.6.1
ePony           	  98.00cm	   79.00cm	   27.00cm
Cool Summer     	L(50, 95)	a(-5, +15)	b(-20, +5)	C(5, 35)
EOF
}

size "$@"
