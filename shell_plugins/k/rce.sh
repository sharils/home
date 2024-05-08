#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

rce() {
  cat <<EOF
$@ in the presence of these my betters and my equals in my Calling, bind myself upon my Honour and Cold Iron, that, of the best of my knowledge and power, I will not henceforward suffer or pass, or be privy to the passing of, Bad Workmanship or Faulty Material in aught that concerns my works before mankind as an Engineer, or in my dealings with my own Soul before my Maker.

MY TIME I will not refuse; my Thought I will not grudge; my Care I will not deny towards the honour, use, stability and perfection of any works to which I may be called to set my hand.

MY FAIR WAGES for that work I will openly take. My Reputation in my Calling I will honourably guard; but I will in no way go about to compass or wrest judgement or gratification from any one with whom I may deal. And further, I will early and warily strive my uttermost against professional jealousy and the belittling of my working-colleagues in any field of their labour.

FOR MY ASSURED FAILURES and derelictions, I ask pardon beforehand of my betters and my equals in my Calling here assembled; praying that in the hour of my temptations, weakness and weariness, the memory of this my Obligation and of the company before whom it was entered into, may return to me to aid, comfort and restrain.
EOF
}

rce "$@"
