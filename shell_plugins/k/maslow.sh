#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

maslow() {
  cat <<'EOF' | grep -E '^|Sleep|Food|Water|Toilet|Medicine|Shower|Hygiene|Environment|Trust|My Liege|Cherry|Kids|Self-Respect|Aesthetic'
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
        🦾 Strength
        ♟️ Competence / Mastery
        🕶️ Self-Confidence
        🚲 Independence
        🗽 Freedom
        👑 Self-Respect
    📉 Lower
        🪪 Status
        🎖️ Recognition
        🎉 Fame
        💎 Prestige
        🔦 Attention
👨‍👩‍👧‍👦 Belonging / Love
    🍻 Friendship
    🍻 Acceptance
    🎁 Receiving and Giving Love and Affection
    🏠 Family
        🐈 Kids
        🍒 Cherry
    💞 Intimacy
    🥂 Trust
🛡️ Safety
    ⚔️ Personal Security
    💖 Emotional Security
        ⚓️ Anchor
    💰 Financial Security
        🧳 Job
    🏥 Health
        🧹 Environment
        🪥 Hygiene
        🚿 Shower
        💊 Medicine
        🚽 Toilet
🫀 Physiological
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
