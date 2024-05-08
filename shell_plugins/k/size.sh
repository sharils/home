#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

size() {
  cat <<'EOF' | sed 's/\t/  /g'
Cool Summer    	L(50, 95)	a(-5, +15)	b(-20, +5)	 C(5, 35)
TWD $1         	  20.00mm	   20.00mm	    1.57mm	    3.80g
TWD $20        	  26.85mm	   26.85mm	    2.00mm	    8.50g
TWD $50        	  28.00mm	   28.00mm	    2.26mm	   10.00g
Apple Watch 7  	  41.00mm	   35.00mm	   10.70mm	   30.00g	2021	 1.70in	11.6.2	Aluminum
Transcend MP840	  82.00mm	   40.50mm	   12.50mm	   70.00g	2008	 1.80in
ISO/IEC 7810   	  85.60mm	   53.98mm	    0.76mm
iPhone 4S      	 115.20mm	   58.60mm	    9.30mm	  140.00g	2011	 3.50in	 8.4.1
Pocket Tissue L	 125.00mm	  105.00mm
Pocket Tissue S	 125.00mm	   80.00mm
iPhone 6S      	 138.30mm	   67.10mm	    7.10mm	  143.00g	2015	 4.70in	15.8.5
TWD $100       	 145.00mm	   70.00mm	    0.10mm	    0.95g
TWD $200       	 150.00mm	   70.00mm	    0.10mm	    1.00g
iPhone XR      	 150.90mm	   75.70mm	    8.30mm	  194.00g	2018	 6.10in	15.7.4
HTC Desire 12s 	 154.20mm	   72.70mm	    8.30mm	  150.00g	2018	 5.70in	 8.1.0
HTC U12 Life   	 158.50mm	   75.40mm	    8.30mm	  175.00g	2018	 6.00in	 8.1.0
TWD $2000      	 165.00mm	   70.00mm	    0.10mm	    1.15g
A4             	 297.00mm	  210.00mm
MacBook Air    	 304.10mm	  215.00mm	   11.30mm	 1240.00g	2024	13.60in	15.6.1
On-Lap1306H    	 320.00mm	  203.00mm	    9.00mm	  670.00g	2019	13.30in
On-Lap1305H    	 320.00mm	  203.00mm	    9.00mm	  685.00g	2017	13.30in
Roomba 890     	 353.00mm	  353.00mm	   91.00mm	 3800.00g	2017
KHS ePony      	 980.00mm	  790.00mm	  270.00mm	18000.00g	2025	16.00in
EOF

  echo

  cat <<'EOF' | sed 's/\t/  /g'
Jelly Star     	  95.10mm	   49.60mm	   18.70mm	  121.00g	2023	 3.00in	13
Jelly Max      	 128.70mm	   62.70mm	   16.30mm	  180.00g	2024	 5.05in	14
iPhone SE 3    	 138.40mm	   67.30mm	    7.30mm	  144.00g	2022	 4.70in	26
iPhone 16e     	 146.70mm	   71.50mm	    7.80mm	  167.00g	2025	 6.10in	26
Xperia 10 VII  	 153.00mm	   72.00mm	    8.30mm	  168.00g	2025	 6.10in	15
Pixel 10a      	 153.90mm	   73.00mm	    8.90mm	  188.00g	2026	 6.30in	16
The Fairphone 6	 156.50mm	   73.30mm	    9.60mm	  191.40g	2025	 6.31in	15
Switch OLED    	 242.00mm	  102.00mm	   13.90mm	  420.00g	2021	 7.00in
Switch 2       	 272.00mm	  116.00mm	   13.90mm	  534.00g	2025	 7.90in
iPad Air       	 280.60mm	  214.90mm	    6.10mm	  616.00g	2024	13.00in	16
BOOX Tab X C   	 310.00mm	  228.00mm	    6.70mm	  560.00g	2024	13.30in	11
MacBook Pro    	 355.70mm	  248.10mm	   16.80mm	 2140.00g	2025	16.20in	11
Brompton T Line	 585.00mm	  565.00mm	  270.00mm	 7950.00g	2026	16.00in
EOF
}

size "$@"
