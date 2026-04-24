#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

maslow() {
  cat <<'EOF' | grep -E '^|Transcendence|Self-actualization|Aesthetic|Cognitive|Esteem|Belonging and love|Safety|Physiological'
✨ Transcendence
🌟 Self-actualization
    💍 Partner Acquisition
    🧑‍🧑‍🧒 Parenting
    🎨 Utilizing and Developing Talents and Abilities
    🎯 Pursuing Goals
🖼️ Aesthetic
🧠 Cognitive
    💡 Creativity
    🔭 Foresight
    🔍 Curiosity
    🌈 Meaning
🏆 Esteem
    📈 Higher
        👑 Self-respect
        🦾 Strength
        ♟️ Competence / Mastery
        🕶️ Self-confidence
        🚲 Independence
        🗽 Freedom
    📉 Lower
        🪪 Status
        🎖️ Recognition
        🎉 Fame
        💎 Prestige
        🔦 Attention
👨‍👩‍👧‍👦 Belonging / Love
    🏠 Family
    🍻 Friendship
    💞 Intimacy
    🥂 Trust
    🍻 Acceptance
    🎁 Receiving and Giving Love and Affection
🛡️ Safety
    🏥 Health
    ⚔️ Personal Security
    💖 Emotional Security
    💰 Financial Security
🍎 Physiological
    🧬 Reproduction
    🌬️ Air
    🔥 Heat
    👕 Clothes
    🏡 Shelter
    🍵 Water
    🍛 Food
    💤 Sleep
EOF
}

maslow "$@"
