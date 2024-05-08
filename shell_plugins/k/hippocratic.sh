#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

hippocratic() {
  cat <<'EOF'
I swear by Apollo, the healer, Asclepius, Hygieia, and Panacea, and I take to witness all the gods, all the goddesses, to keep according to my ability and my judgment, the following Oath and agreement:

To consider dear to me, as my parents, him who taught me this art; to live in common with him and, if necessary, to share my goods with him; To look upon his children as my own brothers, to teach them this art.

I will prescribe regimens for the good of my patients according to my ability and my judgment and never do harm to anyone. I will not give a lethal drug to anyone if I am asked, nor will I advise such a plan; and similarly I will not give a woman a pessary to cause an abortion. But I will preserve the purity of my life and my arts. I will not cut for stone, even for patients in whom the disease is manifest; I will leave this operation to be performed by practitioners, specialists in this art.

In every house where I come I will enter only for the good of my patients, keeping myself far from all intentional ill-doing and all seduction and especially from the pleasures of love with women or with men, be they free or slaves. All that may come to my knowledge in the exercise of my profession or in daily commerce with men, which ought not to be spread abroad, I will keep secret and will never reveal.

If I keep this oath faithfully, may I enjoy my life and practice my art, respected by all men and in all times; but if I swerve from it or violate it, may the reverse be my lot.

仰賴醫神阿波羅、埃斯克雷波斯及天地諾神為證，鄙人敬謹直誓：

願以自身能力及判斷力所及，遵守此約。凡授我藝者，敬之如父母，作為終身同業伴侶，彼有急需，我接濟之。視彼兒女，猶我兄弟，如欲受業，當免費並無條件傳授之。凡我所知，無論口授書傳，俱傳之吾與吾師之子及發誓遵守此約之生徒，此外不傳與他人。

我願盡余之能力與判斷力所及，遵守為病家謀利益之信條，並檢柬一切墮落和害人行為，我不得將危害藥品給予他人，並不作該項之指導，雖有人請求亦必不與之。尤不為婦人施墮胎手術。我願以此純潔與神聖之精神，終身執行我職務。凡患結石者，我不施手術，此則有待於專家為之。

無論至於何處，遇男或女，貴人及奴婢，我之唯一目的，為病家謀幸福，並檢點吾身，不作各種害人及惡劣行為，尤不作誘姦之事。凡我所見所聞，無論有無業務關係，我認為應守秘密者，我願保守秘密。

尚使我嚴守上述誓言時，請求神祗讓我生命與醫術能得無上光榮，我苟違誓，天地鬼神實共亟之。
EOF
}

hippocratic "$@"
