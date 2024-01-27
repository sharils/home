#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cost() {
  # 7,29Tab/\t/l0r0r0r0r0r0r0r0r0r0r0r0r0
  cat <<'EOF' | grep -i "^\|${*:-^}"
What                                	Amount	Per Month	1y commit $ /month	Spot $ /month	Hourly Spot $
CPU                                 	     1	      $15	               $10	           $2	       $0.005
GPU                                 	     1	    $5000	             $3000	        $1500	           $2
Memory                              	  1 GB	       $2	                $1	         $0.2	      $0.0005
Storage
├ Warehouse Storage                 	  1 GB	    $0.02
├ Blob (S3, GCS)                    	  1 GB	    $0.02
├ Zonal HDD                         	  1 GB	    $0.05
├ Ephemeral SSD                     	  1 GB	     $0.1	             $0.05	        $0.05	        $0.05
├ Regional HDD                      	  1 GB	     $0.1
├ Zonal SSD                         	  1 GB	     $0.2
├ Regional SSD                      	  1 GB	    $0.35
Networking
├ Same Zone †                       	  1 GB	       $0
├ Cross-Zone                        	  1 GB	    $0.01
├ Cross-Zone Blob                   	  1 GB	       $0
├ Region Ingress                    	  1 GB	       $0
├ Region Egress                     	  1 GB	     $0.1
├ Internet Ingress                  	  1 GB	       $0
├ Internet Egress                   	  1 GB	     $0.1
CDN Egress                          	  1 GB	    $0.05
CDN Fill ‡                          	  1 GB	    $0.01
Warehouse Query                     	  1 GB	   $0.005

# https://github.com/sirupsen/napkin-math#cost-numbers
EOF
}

cost "$@"
