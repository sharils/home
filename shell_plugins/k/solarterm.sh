#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

solarterm() {
  cat <<'EOF'
02-04	立春	PC	Spring commences	♒️	寅	315°
02-19	雨水	RW	Rain water      	♓️	寅	330°
03-06	驚蟄	IW	Insects waken   	♓️	卯	345°
03-21	春分	VE	Vernal equinox  	♈️	卯	  0°
04-05	清明	BC	Bright and clear	♈️	辰	 15°
04-20	穀雨	CC	Corn rain       	♉️	辰	 30°
05-06	立夏	SC	Summer commences	♉️	巳	 45°
05-21	小滿	CF	Corn forms      	♊️	巳	 60°
06-06	芒種	CE	Corn on ear     	♊️	午	 75°
06-21	夏至	SS	Summer solstice 	♋️	午	 90°
07-07	小暑	MH	Moderate heat   	♋️	未	105°
07-23	大暑	GH	Great heat      	♌️	未	120°
08-08	立秋	AC	Autumn commences	♌️	申	135°
08-23	處暑	EH	End of heat     	♍️	申	150°
09-08	白露	WD	White dew       	♍️	酉	165°
09-23	秋分	AE	Autumnal equinox	♎️	酉	180°
10-08	寒露	CD	Cold dew        	♎️	戌	195°
10-23	霜降	FR	Frost           	♏️	戌	210°
11-07	立冬	WC	Winter commences	♏️	亥	225°
11-22	小雪	LS	Light snow      	♐️	亥	240°
12-07	大雪	HS	Heavy snow      	♐️	子	255°
12-22	冬至	WS	Winter solstice 	♑️	子	270°
01-06	小寒	MC	Moderate cold   	♑️	丑	285°
01-20	大寒	VC	Severe cold     	♒️	丑	300°
EOF
}

solarterm "$@"
