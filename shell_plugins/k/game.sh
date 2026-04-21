#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

game() {
  cat <<'EOF'
Two Truths and a Lie: Share three facts about yourself, including one fake one, and let the other person guess which is the lie.
This or That: Make quick-fire choices between two options to instantly reveal your personal preferences and lifestyle.
The Sync Game: Count down and shout a word from a specific category simultaneously to see if your minds are perfectly in sync.
The 3-Minute Life Story: Take turns sharing your entire life journey in three minutes to build a deep, focused connection.
If I Were...: Explore each other's imagination and values by answering hypothetical questions about "what if" scenarios.
PowerPoint Karaoke: Improve your improvisational skills by giving a presentation using a deck of slides you’ve never seen before.
Ten Questions: Try to identify a secret object by asking up to ten "yes or no" questions in a logical elimination race.
Word Association: Keep a rapid pace by shouting the very first word that pops into your head in response to the previous one.
Common Ground: Work together to discover a set number of unexpected similarities or shared experiences you both have.
Blind Recommendation: Suggest a book, movie, or song specifically tailored to the other person’s vibe to show how well you understand them.
Spot the Difference: Test your partner's observation skills by changing one small detail about your appearance while they aren't looking.
The Finger Counting: Synchronize your intuition by trying to hold up the exact same number of fingers on a count of three.
Miss Sweetie Poo Challenge: Give a speech or tell a story within 60 seconds, or be interrupted by someone shouting "Please stop, I'm bored!"
24/7 Lecture: Explain a complex topic in depth for 24 seconds, then summarize it perfectly using only seven words.
EOF
}

game "$@"
