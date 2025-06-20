#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

dodecagram() {
  cat <<'EOF'
                                                 ♈️
                                                 **
                                                 @@
                         ♓️                                              ♉️
                           #                    @  @                    #
                           @@                                          @@
                              @                @    @                @
                            @   @                                  @   @
                                 @            @      @            @
                             @     @                            @     @
                                     @       @        @       @
                              @        @                    @        @
       ♒️                                @  @          @  @                               ♊️
          %                    @          @@@          @@@          @                    %
          %@@@@@                           @@          @@                           @@@@@%
             @     @@@          @          @  @      @  @          @          @@@     @
               @          @@@             @     @  @     @             @@@          @
                @@               @@@      @      @@      @      @@@               @@
                  @                    @@@@    @    @    @@@@                    @
                    @             @      @    @@@  @@@    @      @             @
                      @                 @   @@@      @@@   @                 @
                        @          @ @@@@ @              @ @@@@ @          @
                          @   @@@      @@                  @@      @@@   @
                       @@@ @        @ @@                    @@ @        @ @@@
                @@@@         @      @@@                      @@@      @         @@@@
          @@@                  @   @ @@                      @@ @   @                  @@@
 ♑️ *@                           @   @                        @   @                           @* ♋️
          @@@                  @   @ @@                      @@ @   @                  @@@
                @@@@         @      @@@                      @@@      @         @@@@
                       @@@ @        @ @@                    @@ @        @ @@@
                          @   @@@      @@                  @@      @@@   @
                        @          @ @@@@ @              @ @@@@ @          @
                      @                 @   @@@      @@@   @                 @
                    @             @      @    @@@  @@@    @      @             @
                  @                     @@@    @    @    @@@                     @
                @@               @@@      @      @@      @      @@@               @@
               @          @@@             @     @  @     @             @@@          @
             @     @@@          @          @  @      @  @          @          @@@     @
          %@@@@@                           @@          @@                           @@@@@%
          %                    @          @@@          @@@          @                    %
        ♐️                               @  @          @  @                                ♌️
                              @        @                    @        @
                                     @       @        @       @
                             @     @                            @     @
                                 @            @      @            @
                            @   @                                  @   @
                              @                @    @                @
                           @@                                          @@
                           #                    @  @                    #
                          ♏️                                            ♍️
                                                 @@
                                                 **
                                                 ♎️
EOF
}

dodecagram "$@"
