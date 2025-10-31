#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

tld() {
  cat <<'EOF'
   a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z
a       ac ad ae af ag    ai       al am    ao    aq ar as at au    aw ax    az
b ba bb    bd be bf bg bh bi bj       bm bn bo       br bs bt       bw    by bz
c ca    cc cd    cf cg ch ci    ck cl cm cn co       cr       cu cv cw cx cy cz
d             de             dj dk    dm    do                               dz
e       ec    ee    eg                               er es et eu               
f                         fi fj fk    fm    fo       fr                        
g ga       gd ge gf gg gh gi       gl gm gn    gp gq gr gs gt gu    gw    gy   
h                               hk    hm hn          hr    ht hu               
i          id ie                   il im in io    iq ir is it                  
j             je                      jm    jo jp                              
k             ke    kg kh ki          km kn    kp    kr             kw    ky kz
l la lb lc                li    lk                   lr ls lt lu lv       ly   
m ma    mc md me    mg mh       mk ml mm mn mo mp mq mr ms mt mu mv mw mx my mz
n na    nc    ne nf ng    ni       nl       no np    nr       nu             nz
o                                     om                                       
p pa          pe pf pg ph       pk pl pm pn          pr ps pt       pw    py   
q qa                                                                           
r             re                            ro          rs    ru    rw         
s sa sb sc sd se    sg sh si    sk sl sm sn so       sr ss st su sv    sx sy sz
t       tc td    tf tg th    tj tk tl tm tn to       tr    tt    tv tw       tz
u ua                ug          uk                      us                uy uz
v va    vc    ve    vg    vi             vn                   vu               
w                wf                                     ws                     
x                                                          yt                  
y             ye                                           yt                  
z za                                  zm                            zw         
EOF
}

tld "$@"
