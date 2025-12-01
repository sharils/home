#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  l) shift && set -- line "$@" ;;
  sp) shift && set -- smileys-people "$@" ;;
  an) shift && set -- animals-nature "$@" ;;
  fd) shift && set -- food-drink "$@" ;;
  a) shift && set -- activity "$@" ;;
  tp) shift && set -- travel-places "$@" ;;
  o) shift && set -- objects "$@" ;;
  s) shift && set -- symbols "$@" ;;
  f) shift && set -- flags "$@" ;;
  ls) shift && set -- "$(ls "$SHARILS_HOME/emoji/" | sed 's/.png//g' | fzf)" "$@" ;;
  zh)
    cat <<'EOF'
☠️ 毒
☹️ 不滿
❤️ 心
👹 惡鬼
👺 天狗
👻 鬼
👽 外星人
👿 惡魔
💀 死亡
💩 大便
😁 嘻嘻
😁 嘿嘿
😂 大笑
😌 可以
😒 可疑
😃 笑
😃 笑
😆 爆笑
😇 光環
😈 邪惡
😉 眨眼
😉 輕鬆
😋 好吃
😌 放鬆 滿足
😍 愛你
😎 墨鏡
😏 冷笑 對啊
😐 平靜
😑 好吧 無言
😒 不爽
😓 冷汗 困難 汗
😔 沈思
😕 困擾 擔心
😘 飛吻
😙 親親
😛 吐舌
😝 嘲笑
😞 失望 憂鬱
😟 怕
🤐 閉嘴
😢 傷心
😥 流汗
😧 啊 啥
😨 可怕 害怕
😫 痛
😬 咬牙
😭 哭
😮‍💨 唉 累
😮 驚訝
😯 哦
😰 冒汗
😱 驚訝
😲 震驚
😴 睏
😷 口罩
🙁 不開心
🙂‍↔️ 搖頭
🙂‍↕️ 點頭
🙂 微笑
🙃 顛倒
🙄 白眼
🤐 沈默
🤑 發財
🤒 發燒
🤔 思考
🤕 繃帶
🤖 機器人
🤗 抱抱
🤠 牛仔
🤡 小丑
🤢 噁心
🤣 笑翻
🤤 口水
🤥 說謊
🤧 噴嚏
🤨 挑眉
🤪 瘋
🤫 噓
🤫 小聲
🤬 髒話
🤭 呵呵
🤮 想吐
🤯 好難
🥰 愛 花痴
🥱 累
🥳 慶祝
🥵 熱
🥶 冷
🥸 假扮
🥹 忍住 感動
🥺 拜託 難過
🧐 困惑
🫠 融化
🫡 敬禮
🫢 摀嘴
🫣 偷看 害羞
🫤 歪嘴
🫨 晃動
🫩 疲倦
😔 難 哀傷
😡 哼 怒
EOF
    return $?
    ;;
  esac

  case "$1" in
  line | smileys-people | animals-nature | food-drink | activity | travel-places | objects | symbols | flags) open "$SHARILS_HOME/emoji/$1.png" ;;
  *) cat <<'EOF'
2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274

Looking for this?  $EDITOR "$@" ~/.config/karabiner/karabiner.json
EOF
    ;;
  esac
}

e "$@"
