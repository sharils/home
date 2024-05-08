#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

iphone() {
  cat <<'EOF'
2007-06-29  iPhone
2008-07-11  iPhone 3G
2009-06-19  iPhone 3GS
2010-06-24  iPhone 4
2011-10-14  iPhone 4s
2012-09-21  iPhone 5
2013-09-20  iPhone 5c
2013-09-20  iPhone 5s
2014-09-19  iPhone 6 / 6 Plus
2015-09-25  iPhone 6s / 6s Plus
2016-03-31  iPhone SE (1st)
2016-09-16  iPhone 7 / 7 Plus
2017-09-22  iPhone 8 / 8 Plus
2017-11-03  iPhone X
2018-09-21  iPhone XS / XS Max
2018-10-26  iPhone XR
2019-09-20  iPhone 11
2019-09-20  iPhone 11 Pro / 11 Pro Max
2020-04-24  iPhone SE (2nd)
2020-10-23  iPhone 12
2020-10-23  iPhone 12 Pro
2020-11-13  iPhone 12 Mini
2020-11-13  iPhone 12 Pro Max
2021-09-24  iPhone 13 / 13 Mini
2021-09-24  iPhone 13 Pro / 13 Pro Max
2022-03-18  iPhone SE (3rd)
2022-09-16  iPhone 14
2022-09-16  iPhone 14 Pro / 14 Pro Max
2022-10-07  iPhone 14 Plus
2023-09-22  iPhone 15 / 15 Plus
2023-09-22  iPhone 15 Pro / 15 Pro Max
2024-09-09  iPhone 16 / 16 Plus
2024-09-09  iPhone 16 Pro / 16 Pro Max
2025-02-19  iPhone 16e
2025-09-19  iPhone 17
2025-09-19  iPhone Air
2025-09-19  iPhone 17 Pro / 17 Pro Max

https://en.wikipedia.org/wiki/List_of_iPhone_models
EOF
}

iphone "$@"
