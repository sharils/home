#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

joke() {
  cat <<'EOF'
Do you know CPR?
It's a very critical question to me because you just took my breath away.
---
Do you know who I don't want to play hide and seek with?
You.
Because someone like you is impossible to find.
---
I believe you are a time traveler.
Because I see you in my future.
---
Do you by any chance have an extra heart?
Because I think you stole my heart.
---
Are you Google?
You have everything I'm searching for.
---
You know I never believe love in the first sight.
Because I never met you.
---
Do you know if I were able to rearrange the alphabet order what I would do?
I will put you and I together
---
Is your name Wi-Fi?
I feel the connection with you.
---
How does it feel to be the most gorgeous girl in this room?
---
Do you have a driver license?
Did you get your driver license suspended for driving all the girls crazy.
---
Do you have a map with you?
I got lost in your eyes.
---
Your hand looks heavy. Can I hold it for you?
EOF

  echo

  cat <<'EOF'
## EN
---
You have some a little bit something on your face.
A little bit cute.
---
I thought happiness always starts with H.
But after meeting you I thought it changed to U.
---
Do you know what's on the menu?
Me n u.
---
Do you know what you look very beautiful in?
In my arms.
---
Did you just fart?
Because you just blew me away.
---
Did you just come out out of oven?
You are so hot.
---
Are you a bank loan?
You have my interest.
---
If you were a triangle, what kind of triangle will you be?
No, you will be a cute (acute) one.
EOF

  echo

  cat <<'EOF'
## ZH

> 我可以去你家洗東西嗎？
我喜歡你
EOF

}

joke "$@"
