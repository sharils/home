#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ha() {
  # 7,23Tabularize/\t/l0r0r0r0r0r0r0r0r0r0r0
  cat <<'EOF' | grep "^\|${*:-^}"
Availability %             	Per year	Per quarter	Per month	Per week	Per day
90% ("one nine")           	  36.53d	      9.13d	   73.05h	  16.80h	  2.40h
95% ("one nine five")      	  18.26d	      4.56d	   36.53h	   8.40h	  1.20h
97% ("one nine seven")     	  10.96d	      2.74d	   21.92h	   5.04h	 43.20m
98% ("one nine eight")     	   7.31d	     43.86h	   14.61h	   3.36h	 28.80m
99% ("two nines")          	   3.65d	     21.90h	    7.31h	   1.68h	 14.40m
99.5% ("two nines five")   	   1.83d	     10.98h	    3.65h	  50.40m	  7.20m
99.8% ("two nines eight")  	  17.53h	      4.38h	   87.66m	  20.16m	  2.88m
99.9% ("three nines")      	   8.77h	      2.19h	   43.83m	  10.08m	  1.44m
99.95% ("three nines five")	   4.38h	     65.70m	   21.92m	   5.04m	 43.20s
99.99% ("four nines")      	  52.60m	     13.15m	    4.38m	   1.01m	  8.64s
99.995% ("four nines five")	  26.30m	      6.57m	    2.19m	  30.24s	  4.32s
99.999% ("five nines")     	   5.26m	      1.31m	   26.30s	   6.05s	864.0ms
99.9999% ("six nines")     	  31.56s	      7.89s	    2.63s	 604.8ms	 86.4ms
99.99999% ("seven nines")  	   3.16s	      0.79s	  263.0ms	  60.5ms	  8.6ms
99.999999% ("eight nines") 	 315.6ms	     78.9ms	   26.3ms	   6.1ms	864.0μs
EOF
}

ha "$@"
