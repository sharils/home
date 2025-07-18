#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bank() {
  cat <<'EOF' | grep -i "${*:-^}"
中央銀行金融資料網路申報系統
金融機構代碼一覽表
109 年 10 月 6 日

本國銀行
機構代號 金融機構簡稱
004 臺灣銀行
005 臺灣土地銀行
006 合作金庫商業銀行
007 第一商業銀行
008 華南商業銀行
009 彰化商業銀行
011 上海商業儲蓄銀行
012 台北富邦商業銀行
013 國泰世華商業銀行
015 中國輸出入銀行
016 高雄銀行
017 兆豐國際商業銀行
018 全國農業金庫
021 花旗(台灣)商業銀行
040 中華開發工業銀行
048 王道商銀
050 臺灣中小企業銀行
052 渣打國際商業銀行
053 台中商業銀行
054 京城商業銀行
081 匯豐(台灣)商業銀行
101 瑞興商業銀行
102 華泰商業銀行
103 臺灣新光商業銀行
108 陽信商業銀行
118 板信商業銀行
147 三信商業銀行
803 聯邦商業銀行
805 遠東國際商業銀行
806 元大商業銀行
806 元大商業銀行
807 永豐商業銀行
808 玉山商業銀行
809 凱基商業銀行
810 星展(臺灣)商業銀行
812 台新國際商業銀行
812 台新國際商業銀行
815 日盛國際商業銀行
816 安泰商業銀行
822 中國信託商業銀行

外商銀行
機構代號 金融機構簡稱
020 日商瑞穗銀行
022 美商美國銀行
023 泰國盤谷銀行
025 菲律賓首都銀行
028 美商美國紐約梅隆銀行
029 新加坡商大華銀行
030 美商道富銀行
037 法國興業銀行
039 澳商澳盛
072 德商德意志銀行
075 香港商東亞銀行
076 美商摩根大通銀行
078 新加坡商星展銀行
082 法商法國巴黎銀行
083 英商渣打銀行
085 新加坡商新加坡華僑銀行
086 法商東方匯理銀行
087 斐商標準銀行
092 瑞士商瑞士銀行
093 荷蘭商安智銀行
097 美商富國銀行
098 日商三菱日聯銀行
321 日商三井住友銀行
323 瑞士商瑞士信貸銀行
324 美商花旗銀行
326 西班牙對外銀行台北分行
328 法商法國外貿銀行臺北分行
380 大陸商中國銀行
381 大陸商交通銀行
382 大陸商中國建設銀行

信用合作社
機構代號 金融機構簡稱
104 台北市第五信用合作社
106 台北市第九信用合作社
114 基隆一信
115 基隆二信
119 淡水一信
120 新北市淡水信合社
124 宜蘭信用合作社
127 桃園信合社
130 新竹一信
132 新竹三信
146 台中二信
158 彰化一信
161 彰化五信
162 彰化六信
163 彰化十信
165 鹿港信合社
178 嘉義市第三信用合作社
179 嘉義市四信
188 台南三信
204 高雄三信
215 花蓮一信
216 花蓮二信
222 澎湖第一信用合作社
223 澎湖二信
224 金門信合社

漁會
機構代號 金融機構簡稱
M501 基隆區漁會
M502 新北市瑞芳區漁會
M503 新北市萬里區漁會
M504 宜蘭縣頭城區漁會
M505 宜蘭縣蘇澳區漁會
M506 桃園縣桃園區漁會
M507 新竹區漁會
M508 苗栗縣南龍區漁會
M509 苗栗縣通苑區漁會
M510 彰化區漁會
M511 雲林區漁會
M512 嘉義縣嘉義區漁會
M513 南市區漁會
M514 台南市南縣區漁會
M515 高雄區漁會
M516 高雄市小港區漁會
M517 高雄市興達港區漁會
M518 林園區漁會
M519 高雄市彌陀區漁會
M520 高雄市永安區漁會
M521 琉球區漁會
M522 屏東縣東港區漁會
M523 屏東縣林邊區漁會
M524 台東縣新港區漁會
M525 澎湖區漁會
M526 高雄市梓官區漁會
M527 金門區漁會信用部
M528 屏東縣枋寮區漁會

農會
機構代號 金融機構簡稱
M601 基隆市農會
M602 台南地區農會
M603 高雄地區農會
M604 新北市三重區農會
M605 新北市板橋區農會
M606 新北市淡水區農會
M607 新北市樹林區農會
M608 新北市鶯歌區農會
M609 三峽區農會
M610 新莊區農會
M611 汐止區農會
M612 土城區農會
M613 蘆洲市農會
M614 新北市五股區農會信用部
M615 林口區農會
M616 泰山區農會
M617 坪林鄉農會
M618 八里區農會
M619 金山地區農會
M620 瑞芳地區農會
M621 新店地區農會信用部
M622 新北市中和地區農會
M623 深坑區農會
M624 石碇區農會
M625 平溪區農會
M626 石門區農會
M627 三芝鄉農會
M628 宜蘭縣宜蘭市農會
M629 宜蘭縣頭城鎮農會
M630 宜蘭縣羅東鎮農會
M631 宜蘭縣礁溪鄉農會
M632 宜蘭縣壯圍鄉農會
M633 宜蘭縣員山鄉農會
M634 五結鄉農會
M635 冬山鄉農會
M636 宜蘭縣蘇澳地區農會
M638 桃園縣桃園市農會
M639 桃園縣大溪鎮農會
M640 楊梅區農會
M641 桃園縣大園鄉農會
M642 桃園縣蘆竹鄉農會
M643 龜山鄉農會
M644 桃園縣八德市農會
M645 桃園縣新屋鄉農會
M646 桃園市龍潭區農會
M647 桃園市復興區農會
M648 桃園縣平鎮市農會
M649 新竹縣關西鎮農會
M650 新竹縣新埔鎮農會
M651 竹北市農會
M652 湖口鄉農會
M653 新竹市農會
M654 新竹縣芎林鄉農會
M655 新竹縣寶山鄉農會
M656 新竹縣峨嵋鄉農會
M657 新竹縣北埔鄉農會
M658 竹東地區農會
M659 新竹縣橫山地區農會
M660 苗栗市農會
M661 苗栗縣頭份市農會
M662 竹南鎮農會
M663 苗栗縣通霄鎮農會
M664 苑裡鎮農會
M665 後龍鎮農會
M666 卓蘭鎮農會
M667 西湖鄉農會信用部
M668 公館鄉農會
M669 銅鑼鄉農會信用部
M670 三義鄉農會信用部
M671 苗栗縣造橋鄉農會
M672 南庄鄉農會信用部
M673 獅潭鄉農會信用部
M674 苗栗縣頭屋鄉農會
M675 苗栗縣三灣鄉農會
M676 苗栗縣大湖地區農會
M677 台中市東勢區農會
M678 清水區農會
M679 台中市梧棲區農會
M680 大甲區農會
M681 台中市沙鹿區農會
M682 台中市大里區農會
M683 台中市霧峰區農會
M684 太平市農會
M685 台中市烏日區農會
M686 后里區農會信用部
M687 大雅區農會
M688 台中市潭子區農會
M689 石岡區農會信用部
M690 新社區農會信用部
M691 台中市大肚區農會
M692 外埔區農會信用部
M693 台中市大安區農會
M694 台中市龍井區農會
M695 和平區農會信用部
M696 南投市農會
M697 南投縣草屯鎮農會
M698 南投縣集集鎮農會
M699 南投縣埔里鎮農會
M700 竹山鎮農會
M701 南投縣中寮鄉農會
M702 南投縣名間鄉農會信用部
M703 南投縣魚池鄉農會
M704 南投縣水里鄉農會
M705 南投縣國姓鄉農會
M706 鹿谷鄉農會
M707 南投縣信義鄉農會
M708 南投縣仁愛鄉農會
M709 彰化縣鹿港鎮農會
M710 彰化縣和美鎮農會
M711 員林鎮農會
M712 溪湖鎮農會
M713 田中鎮農會
M714 彰化縣北斗鎮農會信用部
M715 彰化縣二林鎮農會
M716 線西鄉農會
M717 伸港鄉農會
M718 彰化縣秀水鄉農會信用部
M719 花壇鄉農會
M720 彰化縣大村鄉農會信用部
M721 埔心鄉農會
M722 彰化縣永靖鄉農會
M723 彰化縣社頭鄉農會信用部
M724 彰化縣二水鄉農會信用部
M725 彰化縣田尾鄉農會信用部
M726 彰化縣埤頭鄉農會信用部
M727 彰化縣大城鄉農會信用部
M728 彰化縣溪州鄉農會
M729 彰化縣竹塘鄉農會信用部
M730 斗六市農會
M731 虎尾鎮農會
M732 雲林縣西螺鎮農會
M733 雲林縣北港鎮農會
M734 雲林縣斗南鎮農會信用部
M735 雲林縣土庫鎮農會
M736 雲林縣古坑鄉農會
M737 雲林縣大埤鄉農會信用部
M738 雲林縣莿桐鄉農會
M739 雲林縣二崙鄉農會信用部
M740 雲林縣崙背鄉農會
M741 雲林縣台西鄉農會信用部
M742 雲林縣褒忠鄉農會信用部
M743 雲林縣東勢鄉農會
M744 雲林縣四湖鄉農會信用部
M745 雲林縣口湖鄉農會信用部
M747 雲林縣元長鄉農會
M748 麥寮鄉農會
M749 朴子市農會
M750 嘉義縣布袋鎮農會信用部
M751 大林鎮農會
M752 嘉義縣民雄鄉農會信用部
M753 嘉義縣溪口鄉農會信用部
M754 嘉義縣東石鄉農會信用部
M755 嘉義縣義竹鄉農會信用部
M756 嘉義縣鹿草鄉農會信用部
M757 嘉義縣太保市農會信用部
M758 水上鄉農會
M759 嘉義縣中埔鄉農會
M760 嘉義縣番路鄉農會
M762 嘉義縣梅山鄉農會
M764 嘉義縣六腳鄉農會信用部
M765 新港鄉農會
M766 嘉義市農會信用部
M767 嘉義縣阿里山鄉農會
M768 台南市新營區農會
M769 台南市鹽水區農會信用部
M770 台南市白河區農會
M771 台南市麻豆區農會
M772 台南市佳里區農會信用部
M773 台南市新化區農會
M774 台南市善化區農會
M775 台南市柳營區農會
M776 台南市後壁區農會
M777 台南市東山區農會
M778 台南市下營區農會
M779 六甲區農會
M780 台南市官田區農會
M781 台南市大內區農會
M782 台南市西港區農會
M783 台南市將軍區農會信用部
M784 台南市北門區農會信用部
M785 台南市學甲區農會
M786 台南市新市區農會
M787 安定區農會
M788 台南市山上區農會
M789 台南市玉井區農會信用部
M790 台南市左鎮區農會
M791 台南市仁德區農會
M792 台南市歸仁區農會
M793 台南市關廟區農會
M794 台南市龍崎區農會
M795 永康區農會
M796 高雄市鳳山區農會
M797 高雄市岡山區農會
M798 高雄市旗山區農會信用部
M799 高雄市美濃區農會
M800 高雄市橋頭區農會信用部
M801 高雄市燕巢區農會信用部
M802 高雄市田寮區農會信用部
M803 高雄市阿蓮區農會信用部
M804 高雄市路竹區農會信用部
M805 高雄市湖內區農會
M806 高雄市茄萣區農會
M807 高雄市彌陀區農會信用部
M808 高雄市永安區農會
M809 梓官區農會
M810 高雄市林園區農會信用部
M811 高雄市大寮區農會
M812 高雄市仁武區農會
M813 高雄市大社區農會
M814 高雄市杉林區農會信用部
M815 高雄市甲仙地區農會信用部
M816 屏東縣東港鎮農會信用部
M817 恆春鎮農會
M818 屏東縣麟洛鄉農會信用部
M819 屏東縣九如鄉農會信用部
M820 屏東縣里港鄉農會信用部
M822 屏東縣崁頂鄉農會信用部
M823 屏東縣南州地區農會信用部
M824 屏東縣琉球鄉農會信用部
M825 屏東縣滿州鄉農會信用部
M826 屏東縣內埔地區農會
M827 屏東縣枋山地區農會信用部
M828 花蓮縣花蓮市農會
M829 吉安鄉農會
M830 花蓮縣壽豐鄉農會信用部
M831 花蓮縣富里鄉農會信用部
M832 花蓮縣瑞穗鄉農會
M833 花蓮縣玉溪地區農會
M834 花蓮縣鳳榮地區農會
M835 花蓮縣光豐地區農會
M836 花蓮縣新秀地區農會信用部
M837 台東縣關山鎮農會信用部
M838 台東縣成功鎮農會信用部
M839 台東縣池上鄉農會信用部
M840 台東縣東河鄉農會信用部
M841 台東縣長濱鄉農會信用部
M843 鹿野地區農會
M844 台東縣太麻里地區農會信用部
M845 北投區農會
M846 士林區農會
M847 內湖區農會
M848 南港區農會
M849 木柵區農會
M850 景美區農會
M851 澎湖縣農會
M852 台中市台中地區農會
M853 連江縣農會
M854 鳥松區農會
M855 臺灣省農會
M856 神岡區農會
M857 屏東縣車城地區農會
M858 高雄市小港區農會
M859 高雄市內門區農會
M860 屏東縣萬丹鄉農會
M861 屏東縣屏東市農會
M862 屏東縣長治鄉農會
M863 屏東縣枋寮地區農會
M864 屏東縣農會
M865 屏東縣竹田鄉農會
M867 高雄市大樹區農會
M868 高雄市六龜區農會
M869 台南市楠西區農會
M870 彰化縣芳苑鄉農會
M871 彰化縣芬園鄉農會
M872 台中市豐原區農會
M873 彰化縣埔鹽鄉農會
M874 彰化市農會
M875 彰化縣福興鄉農會
M877 台南市七股區農會
M878 台南市南化區農會
M879 新竹縣新豐鄉農會
M880 中華民國農會中壢辦事處
M881 林邊鄉農會信用部
M882 屏東縣佳冬鄉農會
M883 高樹鄉農會
M884 觀音鄉農會
M885 萬巒地區農會
M886 新園鄉農會
M887 潮州鎮農會

期貨經理於信託投資公司
機構代號 金融機構簡稱
0998 康和期經
0044 亞洲信託投資公司

人壽保險公司
機構代號 金融機構簡稱
0451 臺銀人壽保險公司
0452 台灣人壽保險公司
0453 保誠人壽保險公司
0454 國泰人壽保險公司
0455 中國人壽保險公司
0456 南山人壽保險公司
0457 國華人壽保險公司
0458 新光人壽保險公司
0464 紐西蘭商康健人壽保險公司
0465 英屬百慕達商友邦人壽保險公司
0466 英屬百慕達商宏利人壽保險國際公司
0468 合作金庫人壽保險公司
0471 富邦人壽保險公司
0472 國寶人壽保險公司
0473 三商美邦人壽保險公司
0474 朝陽人壽保險公司
0474 朝陽人壽保險公司
0477 蘇黎世國際人壽保險公司
0478 幸福人壽保險公司
0479 遠雄人壽保險公司
0480 宏泰人壽保險公司
0481 安聯人壽保險公司
0484 法商法國巴黎人壽保險公司
0485 康健人壽保險公司
0488 保德信國際人壽保險公司
0489 全球人壽保險公司
0490 美商安達保險公司
0491 元大人壽保險公司
0492 中華郵政公司壽險處
0493 台灣人壽保險股份有限公司
0494 英屬百慕達商安達人壽保險公司
0495 安泰人壽保險公司
0498 英屬百慕達商匯豐人壽保險國際公司
0499 第一金人壽保險公司

產物保險公司
機構代號 金融機構簡稱
0401 台灣產物保險公司
0402 兆豐產物保險公司
0403 華山產物保險公司
0405 富邦產物保險公司
0406 和泰產物保險
0407 泰安產物保險公司
0408 明台產物保險公司
0409 南山產物保險公司
0410 第一產物保險公司
0412 旺旺友聯產物保險公司
0413 新光產物保險公司
0414 華南產物保險公司
0415 國泰世紀產物保險公司
0417 新安東京海上產物保險公司
0418 台壽保產物保險公司
0432 美商安達產物保險公司
0433 美商聯邦產物保險公司
0442 香港商亞洲保險公司
0443 法商安盛產物保險公司
0444 日商三井住友海上火災產物保險公司
0446 法商法國巴黎產物保險公司
0447 新加坡商美國國際產物保險
0448 法商科法斯產物保險
0449 裕利安宜產物保險
0496 台灣區漁船產物保險合作社

票券金融與證券公司
機構代號 金融機構簡稱
0060 兆豐票券金融公司
0061 中華票券金融公司
0062 國際票券金融公司
0063 大中票券金融公司
0065 臺灣票券金融股份有限公司
0066 萬通票券金融公司
0372 大慶票券金融公司
0375 合作金庫票券金融公司
0981 環華證券金融公司
0982 富邦證券金融公司
0983 安泰證券金融公司
0995 元大證券金融公司
0527 群益証券
0551 永豐金證券
0585 統一綜合証券
0592 元富証券
0910 群益金鼎證券
0920 凱基證券
0960 富邦證券
0980 元大證券

中華郵政
機構代號 金融機構簡稱
0700 中華郵政公司儲匯處

信用卡公司與周邊金融機構
機構代號 金融機構簡稱
0956 聯合信用卡處理中心
0979 環匯亞太信用卡股份有限公司
0390 悠遊卡公司
0391 一卡通票證
0392 愛金卡公司
0393 遠鑫電子票證
0950 財金資訊股份有限公司
0951 臺灣集保
0953 櫃買中心
0954 臺灣證券交易所
0955 愛金卡公司
0958 金融拆款中心
0999 臺灣票據交換所

退休基金與再保險公司
機構代號 金融機構簡稱
P002 勞保局
P003 勞退基金監理會
P006 勞動部勞動基金運用局
0987 科隆再保險
P005 中央再保

電子支付機構
機構代號 金融機構簡稱
0791 歐付寶電子支付
0792 簡單行動支付
0793 國際連
0794 橘子支行動支付
0796 街口電子支付

貨幣型基金-投資發行
機構代號 金融機構簡稱
A001 兆豐國際證券投資信託股份有限公司
A003 第一金證券投資信託股份有限公司
A017 台中銀證券投信
A031 貝萊德證券投資信託股份有限公司
A043 街口投信
A047 台新證券投資信託股份有限公司
EOF
}

bank "$@"
