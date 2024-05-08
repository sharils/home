#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

android() {
  cat <<'EOF'
Date        API  Ver    Name
2008-09-23  1    1.0    1.0
2009-02-09  2    1.1    1.1
2009-04-27  3    1.5    Cupcake
2009-09-15  4    1.6    Donut
2009-10-27  5    2.0    Eclair
2009-12-03  6    2.0.1  Eclair
2010-01-11  7    2.1    Eclair
2010-05-20  8    2.2    Froyo
2010-12-06  9    2.3    Gingerbread
2011-02-09  10   2.3.3  Gingerbread
2011-02-22  11   3.0    Honeycomb
2011-05-10  12   3.1    Honeycomb
2011-07-15  13   3.2    Honeycomb
2011-10-18  14   4.0    Ice Cream Sandwich
2011-12-16  15   4.0.3  Ice Cream Sandwich
2012-07-09  16   4.1    Jelly Bean
2012-11-13  17   4.2    Jelly Bean
2013-07-24  18   4.3    Jelly Bean
2013-10-31  19   4.4    KitKat
2014-06-25  20   4.4W   KitKat
2014-11-04  21   5.0    Lollipop
2015-03-02  22   5.1    Lollipop
2015-10-02  23   6.0    Marshmallow
2016-08-22  24   7.0    Nougat
2016-10-04  25   7.1    Nougat
2017-08-21  26   8.0    Oreo
2017-12-05  27   8.1    Oreo
2018-08-06  28   9      Pie
2019-09-03  29   10     10
2020-09-08  30   11     11
2021-10-04  31   12     12
2022-03-07  32   12.1   12L
2022-08-15  33   13     13
2023-10-04  34   14     14
2024-09-03  35   15     15
2025-06-10  36   16     16
Date        API  Ver    Name

source: https://en.wikipedia.org/wiki/Android_version_history#Overview
EOF
}

android "$@"
