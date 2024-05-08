#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

geneva() {
  cat <<'EOF'
AS A MEMBER OF THE MEDICAL PROFESSION:

I SOLEMNLY PLEDGE to dedicate my life to the service of humanity;
THE HEALTH AND WELL-BEING OF MY PATIENT will be my first consideration;
I WILL RESPECT the autonomy and dignity of my patient;
I WILL MAINTAIN the utmost respect for human life;
I WILL NOT PERMIT considerations of age, disease or disability, creed, ethnic origin, gender, nationality, political affiliation, race, sexual orientation, social standing or any other factor to intervene between my duty and my patient;
I WILL RESPECT the secrets that are confided in me, even after the patient has died;
I WILL PRACTICE my profession with conscience and dignity and in accordance with good medical practice;
I WILL FOSTER the honour and noble traditions of the medical profession;
I WILL GIVE to my teachers, colleagues, and students the respect and gratitude that is their due;
I WILL SHARE my medical knowledge for the benefit of the patient and the advancement of healthcare;
I WILL ATTEND TO my own health, well-being, and abilities in order to provide care of the highest standard;
I WILL NOT USE my medical knowledge to violate human rights and civil liberties, even under threat;
I MAKE THESE PROMISES solemnly, freely and upon my honour.
EOF

  echo

  cat <<'EOF'
作為一名醫學工作者：

我鄭重宣誓，我將終生致力於為人類服務；
我將患者的健康與幸福作為我的首要顧念；
我將尊重患者的自主權與尊嚴；
我將保持對人類生命的最高敬意；
我將不容許有年齡、疾病或殘疾、信仰、民族、性別、國籍、政治黨派、種族、性取向、社會地位或其他任何因素的考慮，介於我的職責與患者之間；
我將尊重所寄託給我的秘密，即使患者已經離世；
我將在醫學實踐中保持良知與尊嚴，遵從正確的醫學規範；
我將維護醫療職業的榮譽和高尚的傳統；
我將尊重及感戴我的師長、同事與學生；
我將為患者的利益和醫療衛生事業的進步，分享我的醫學知識；
我將關注自身健康、幸福與能力，提供最高標準的照護服務；
即使受到威脅，也絕不使用我的醫學知識侵犯人權和公民自由；
我鄭重地，自主地並且以我的人格宣誓。
EOF
}

geneva "$@"
