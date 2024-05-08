#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

tarot() {
  cat <<'EOF'
Ο    	最初的虛無    	愚者    	Le Fou               	狡猾之者        	天王星
I    	萬物的開端    	魔術師  	Le Bateleur          	出發、發現、創造	水星
II   	陰陽          	女祭司  	La Papesse           	女性的神秘      	月球
III  	愛、生命、和平	皇后    	L'Impératrice        	包容、豐收、豐腴	金星
IV   	四大元素      	皇帝    	L'Empereur           	自我的權利      	白羊座
V    	平均的力量    	教皇    	Le Pape              	知識與道德      	金牛座
VI   	天地的調和    	戀人    	L'Amant              	上天的祝福      	雙子座
VII  	勝利          	戰車    	Le Chariot           	熱情            	巨蟹座
VIII 	力量的穩定    	力量    	La Force             	支配            	獅子座
IX   	調和大三角    	隱者    	L'Ermite             	知識            	處女座
X    	宇宙的基礎    	命運之輪	La Roue de la fortune	天使與魔鬼      	木星
XI   	不完整        	正義    	La Justice           	公平的真理      	天秤座
XII  	終點          	倒吊人  	Le Pendu             	自我犧牲        	海王星
XIII 	死亡人數      	死神    	La Mort              	循環            	天蠍座
XIV  	適當          	節制    	Tempérance           	自我控制        	射手座
XV   	野性          	惡魔    	Le Diable            	慾望            	魔羯座
XVI  	惡意的基盤    	塔      	La Maison Dieu       	驕傲者必亡      	火星
XVII 	治癒          	星星    	L'Étoile             	魂魄飛向宇宙    	水瓶座
XVIII	不安、淨化    	月亮    	La Lune              	黑暗的降臨      	雙魚座
XIX  	新生命誕生    	太陽    	Le Soleil            	崇拜            	太陽
XX   	極限          	審判    	Le Juge              	復活            	冥王星
XXI  	最終的虛無    	世界    	Le Monde             	完美無缺        	土星
EOF
}

tarot "$@"
