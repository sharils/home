#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

maslow() {
  cat <<'EOF' | grep -E '^|Transcendence|Self-actualization|Aesthetic|Cognitive|Esteem|Belonging and love|Safety|Physiological'
Transcendence
Self-actualization
    Partner acquisition
    Parenting
    Utilizing and developing talents and abilities
    Pursuing goals
Aesthetic
Cognitive
    Creativity
    Foresight
    Curiosity
    Meaning
Esteem
    Lower
        Status
        Recognition
        Fame
        Prestige
        And attention
    Higher
        Self-respect
        Strength
        Competence, mastery
        Self-confidence
        Independence
        Freedom
Belonging and love
    Family
    Friendship
    Intimacy
    Trust
    Acceptance
    Receiving and giving love and affection
Safety
    Health
    Personal security
    Emotional security
    Financial security
Physiological
    Air
    Water
    Food
    Heat
    Clothes
    Reproduction
    Shelter
    Sleep
EOF
}

maslow "$@"
