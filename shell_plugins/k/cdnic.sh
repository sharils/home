#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cdnic() {
  cat <<'EOF'
1. reverse causation (B → A)
  1. The faster that windmills are observed to rotate, the more wind is observed. Therefore, wind is caused by the rotation of windmills
  2. Subjects with low cholesterol correlate with an increase in mortality. Therefore, low cholesterol increases your risk of mortality.
  3. Ex-smokers are more likely to die of lung cancer than current smokers
  4. Children that watch a lot of TV are the most violent. Clearly, TV makes children more violent.
  5. Europeans in the Middle Ages believed that lice were beneficial to health since there would rarely be any lice on sick people. The reasoning was that the people got sick because the lice left.
2. common-causal variable (C → A ∧ C → B)
  1. As ice cream sales increase, the rate of drowning deaths increases sharply. Therefore, ice cream consumption causes drowning.
  2. 家中藏書越豐富，小朋友越聰明
  3. 哈佛畢業生薪水比它校畢業生高
  4. 擁有『延遲滿足能力』的小朋友，有更好的人生表現
  5. Sleeping with one's shoes on is strongly correlated with waking up with a headache. Therefore, sleeping with one's shoes on causes headache.
  6. Young children who sleep with the light on are much more likely to develop myopia in later life. Therefore, sleeping with the light on causes myopia.
  7. A hypothetical study shows a relationship between test anxiety scores and shyness scores, with a statistical r value (strength of correlation) of +.59. Therefore, it may be simply concluded that shyness, in some part, causally influences test anxiety.
  8. Since the 1950s, both the atmospheric CO2 level and obesity levels have increased sharply. Hence, atmospheric CO2 causes obesity.
  9. HDL ("good") cholesterol is negatively correlated with incidence of heart attack. Therefore, taking medication to raise HDL decreases the chance of having a heart attack.
3. bidirectional causation (A → B ∧ B → A)
  1. cyclists have a lower Body Mass Index than people who do not cycle
4. coincidence
  1. 尼可拉斯凱吉拍過的電影和游泳池溺死人數
  2. 美國小姐的年齡和因取暖設備喪命的人數
  3. The last home game by the Washington Commanders prior to the presidential election predicted the outcome of every presidential election from 1936 to 2000 inclusive.
  4. Correlates the Social Democratic Party of Germany's share of the popular vote with the size of crude steel production in Western Germany.
  5. A bald (or obviously balding) state leader of Russia has succeeded a non-bald ("hairy") one, and vice versa, for nearly 200 years.
  6. Hebrew words predicting historical events supposedly hidden within the Torah: the huge number of combinations of letters makes appearances of any word in sufficiently lengthy text statistically insignificant

unverified
  預防早發性大腸癌　哈佛研究：維生素D有幫助
EOF
}

cdnic "$@"
