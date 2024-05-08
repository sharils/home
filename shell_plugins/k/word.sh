#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

word() {
  cat <<'EOF'
aa ab       ae       ah ai       al am an ao       ar as at    av aw ax ay   
ba          be                            bo       br                   by   
            ce                                                               
da          de                            do                                 
            ee ef    eh          el em en          er es et       ew ex ey ez
fa                                                                           
ga          ge          gi                go                                 
ha          he          hi          hm hn ho                hu               
         id    if                      in io          is it                  
                                          jo                                 
ka                      ki                                                   
la                      li                lo                                 
ma          me          mi          mm    mo                mu          my   
na          ne                            no                nu               
   ob    od oe of    oh       ok    om on oo       or os          ow ox oy   
pa          pe          pi                po                                 
                        qi                                                   
ra          re                            ro                ru               
                     sh si                so                                 
ta          te          ti                to                tu               
ua                   uh          ul um un    up       us ut                  
                                                                        vy   
wa          we          wi                wo                wu          wy   
            xe          xi                                  xu               
ya          ye          yi                yo                                 
za          ze          zi                zo                                 

https://en.wiktionary.org/wiki/Appendix:Glossary_of_two-letter_English_words
EOF
}

word "$@"
