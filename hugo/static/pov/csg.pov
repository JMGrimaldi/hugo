#include "colors.inc"
#include "stones.inc"

union {
 cylinder {<-.4,-1,0>,<-.4,.8,0>,1}
 cylinder {<.2,-1.2,-.4>,<.2,1.6,-.4>,.5}
 texture {T_Stone8}
 translate .35*x
 translate -3*x
}
intersection {
 cylinder {<-.4,-1,0>,<-.4,.8,0>,1}
 cylinder {<.2,-1.2,-.4>,<.2,1.6,-.4>,.5}
 translate .35*x
 texture {T_Stone8}
}
difference {
 cylinder {<-.4,-1,0>,<-.4,.8,0>,1}
 cylinder {<.2,-1.2,-.4>,<.2,1.6,-.4>,.5}
 texture {T_Stone8}
 translate .35*x
 translate 3*x
}

plane {y,-1
 pigment {White}
 finish {ambient .2 reflection .4}
 normal {bozo .02 scale .1}}

light_source {<-6,20,-12>, White area_light 5*x, 5*y, 10, 10}

camera {
 angle 20
 location <0,5,-6>*4
 look_at <0,-.6,0> 
}
