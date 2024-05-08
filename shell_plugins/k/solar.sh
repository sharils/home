#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

solarterm() {
  ON="$(tput setaf 1)"
  OFF="$(tput sgr0)"

  cat <<EOF
02-04  ${OFF}立${ON}春${OFF}  PC  Spring commences  ♒️  寅  315°  立春正月春氣動 東風能解凝寒凍 土底蟄蟲始振搖 魚陟負冰相戲泳
02-19  ${ON}雨${OFF}水${OFF}  RW  Rain water        ♓️  寅  330°  半月交得雨水後 獺祭魚時隨應候 候雁時催歸北鄉 那堪草木萌芽透
03-06  ${ON}驚${OFF}蟄${OFF}  IW  Insects waken     ♓️  卯  345°  驚蟄二月節氣浮 桃始開花放樹頭 鶬鷓鳴動無休歇 崔得胡鷹化作鳩
03-21  ${ON}春${OFF}分${OFF}  VE  Vernal equinox    ♈️  卯    0°  春色平分纔一半 向時玄鳥重相見 雷乃發聲天際頭 閃閃雲開始見電
04-05  ${ON}清${OFF}明${OFF}  BC  Bright and clear  ♈️  辰   15°  芳菲三月報清明 梧桐枝上始含英 田鼠化鴽人不覺 虹橋始見雨初晴
04-20  ${ON}穀${OFF}雨${OFF}  CC  Corn rain         ♉️  辰   30°  三月中時交穀雨 萍始生遍閒洲渚 鳴鳩自拂其羽毛 戴勝降於桑樹隅
05-06  ${OFF}立${ON}夏${OFF}  SC  Summer commences  ♉️  巳   45°  立夏四月始相爭 知他螻蟈為誰鳴 無端坵蚓縱橫出 有意王瓜取次生
05-21  ${OFF}小${ON}滿${OFF}  CF  Corn forms        ♊️  巳   60°  小滿瞬時更疊至 閒尋苦菜爭榮處 靡草千村死欲枯 微看初暄麥秋至
06-06  ${ON}芒${OFF}種${OFF}  CE  Corn on ear       ♊️  午   75°  芒種一番新換豆 不謂螳螂生如許 鵙者鳴時聲不休 反舌無聲沒半語
06-21  ${ON}夏${OFF}至${OFF}  SS  Summer solstice   ♋️  午   90°  夏至纔交陰始生 鹿乃解角養新茸 陰陰蜩始鳴長日 細細田間半夏生
07-07  ${OFF}小${ON}暑${OFF}  MH  Moderate heat     ♋️  未  105°  小暑乍來渾未覺 溫風時至褰簾幙 蟋蟀纔居屋璧諸 天崖又見鷹始摯
07-23  ${OFF}大${ON}暑${OFF}  GH  Great heat        ♌️  未  120°  大暑雖炎猶自好 且看腐草為螢秒 勻勻土潤散溽蒸 大雨時行蘇枯槁
08-08  ${OFF}立${ON}秋${OFF}  AC  Autumn commences  ♌️  申  135°  大火西流又立秋 涼風至透內房幽 一庭白露微微降 幾個寒蟬鳴樹頭
08-23  ${ON}處${OFF}暑${OFF}  EH  End of heat       ♍️  申  150°  一瞬中間處暑至 鷹乃祭鳥誰教汝 天地屬金始肅清 禾乃登堂收幾許
09-08  ${OFF}白${ON}露${OFF}  WD  White dew         ♍️  酉  165°  無可奈何白露秋 大鴻小雁來南洲 舊石玄鳥都歸去 教令諸禽各養羞
09-23  ${ON}秋${OFF}分${OFF}  AE  Autumnal equinox  ♎️  酉  180°  自入秋分八月中 雷始收聲斂震宮 蟄蟲壞戶先為御 水始涸兮勢向東
10-08  ${ON}寒${OFF}露${OFF}  CD  Cold dew          ♎️  戌  195°  寒露人言晚節佳 鴻雁來賓時不差 雀入大水化為蛤 爭看籬菊有黃花
10-23  ${ON}霜${OFF}降${OFF}  FR  Frost             ♏️  戌  210°  休言霜降非天意 豺乃祭獸班時意 草木皆黃落葉天 蟄蟲咸俯迎寒氣
11-07  ${OFF}立${ON}冬${OFF}  WC  Winter commences  ♏️  亥  225°  誰看書來立冬信 水始成冰寒日進 地始凍兮折裂開 雉入大水潛為蜃
11-22  ${OFF}小${ON}雪${OFF}  LS  Light snow        ♐️  亥  240°  逡巡小雪年華暮 虹藏不見知何處 天升地降兩不交 閉寒成冬如禁錮
12-07  ${OFF}大${ON}雪${OFF}  HS  Heavy snow        ♐️  子  255°  紛飛大雪轉淒迷 鶡旦不鳴馬肯啼 虎始交後風生壑 荔挺出時霜滿溪
12-22  ${ON}冬${OFF}至${OFF}  WS  Winter solstice   ♑️  子  270°  短日漸長冬至矣 蚯蚓結泉更不起 漸漸林間麋角解 水泉搖動溫井底
01-06  ${ON}小${OFF}寒${OFF}  MC  Moderate cold     ♑️  丑  285°  去歲小寒今歲又 雁聲北鄉春去舊 鵲尋枝上始為巢 雉入寒煙時一雊
01-20  ${ON}大${OFF}寒${OFF}  VC  Severe cold       ♒️  丑  300°  一年時盡大寒來 雞始乳兮如乳孩 征鳥當權飛厲疾 澤腹彌堅凍不開
EOF
}

solarterm "$@"
