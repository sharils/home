#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

db() {
  cat <<'EOF'
Sound	  Time	Example
150dB	    0s	Firecrackers
140dB	    0s	Airplane taking off
130dB	   <1s	Jackhammer
120dB	   12s	Standing near a siren
110dB	  2.5m	Shouting in the ear
105dB	    8m	Car horn at 5 meters
100dB	   20m	Hair dryer
 95dB	 1h15m	Motorcycle
 90dB	    4h	Shouted conversation
 85dB	12h30m	Heavy traffic (inside car)
 80dB	   40h	Doorbell
 60dB	     ∞	Normal conversation
 40dB	     ∞	Library
 30dB	     ∞	Soft whispering
 10dB	     ∞	Normal breathing

https://www.who.int/news-room/questions-and-answers/item/deafness-and-hearing-loss-safe-listening
EOF
}

db "$@"
