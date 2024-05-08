#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

op() {
  cat <<'EOF' | grep -i "^\|${*:-^}"
Operation                          	Latency	Throughput	 1 MiB	 1 GiB
Sequential Memory R/W (64 bytes)   	 0.5 ns
├ Single Thread, No SIMD           	       	  10 GiB/s	100 μs	100 ms
├ Single Thread, SIMD              	       	  20 GiB/s	 50 μs	 50 ms
├ Threaded, No SIMD                	       	  30 GiB/s	 35 μs	 35 ms
├ Threaded, SIMD                   	       	  35 GiB/s	 30 μs	 30 ms
Network Same-Zone                  	       	  10 GiB/s	100 μs	100 ms
├ Inside VPC                       	       	  10 GiB/s	100 μs	100 ms
├ Outside VPC                      	       	   3 GiB/s	300 μs	300 ms
Hashing, not crypto-safe (64 bytes)	  25 ns	   2 GiB/s	500 μs	500 ms
Random Memory R/W (64 bytes)       	  50 ns	   1 GiB/s	  1 ms	    1s
Fast Serialization †               	    N/A	   1 GiB/s	  1 ms	    1s
Fast Deserialization †             	    N/A	   1 GiB/s	  1 ms	    1s
System Call                        	 500 ns	       N/A	   N/A	   N/A
Hashing, crypto-safe (64 bytes)    	 500 ns	 200 MiB/s	 10 ms	   10s
Sequential SSD read (8 KiB)        	   1 μs	   4 GiB/s	200 μs	200 ms
Context Switch                     	  10 μs	       N/A	   N/A	   N/A
Sequential SSD write, -fsync (8KiB)	  10 μs	   1 GiB/s	  1 ms	    1s
TCP Echo Server (32 KiB)           	  10 μs	   4 GiB/s	200 μs	200 ms
Decompression                      	    N/A	   1 GiB/s	  1 ms	    1s
Compression                        	    N/A	 500 MiB/s	  2 ms	    2s
Sequential SSD write, +fsync (8KiB)	   1 ms	  10 MiB/s	100 ms	 2 min
Sorting (64-bit integers)          	    N/A	 200 MiB/s	  5 ms	    5s
Sequential HDD Read (8 KiB)        	  10 ms	 250 MiB/s	  2 ms	    2s
Blob Storage same region, 1 file   	  50 ms	 500 MiB/s	  2 ms	    2s
Blob Storage same region, n files  	  50 ms	  NW limit
Random SSD Read (8 KiB)            	 100 μs	  70 MiB/s	 15 ms	   15s
Serialization †                    	    N/A	 100 MiB/s	 10 ms	   10s
Deserialization †                  	    N/A	 100 MiB/s	 10 ms	   10s
Proxy: Envoy/ProxySQL/Nginx/HAProxy	  50 μs	         ?	     ?	     ?
Network within same region         	 250 μs	   2 GiB/s	500 μs	500 ms
Premium network within zone/VPC    	 250 μs	  25 GiB/s	 50 μs	 40 ms
{MySQL, Memcached, Redis, ..} Query	 500 μs	         ?	     ?	     ?
Random HDD Read (8 KiB)            	  10 ms	 0.7 MiB/s	   2 s	   30m
Network between regions            	 Varies	  25 MiB/s	 40 ms	   40s
Network NA East <-> West           	  60 ms	  25 MiB/s	 40 ms	   40s
Network EU West <-> NA East        	  80 ms	  25 MiB/s	 40 ms	   40s
Network NA West <-> Singapore      	 180 ms	  25 MiB/s	 40 ms	   40s
Network EU West <-> Singapore      	 160 ms	  25 MiB/s	 40 ms	   40s

# https://github.com/sirupsen/napkin-math#numbers
EOF
}

op "$@"
