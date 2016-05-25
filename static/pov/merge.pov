#include "colors.inc"
#include "textures.inc"

union {
 cylinder {-2*y,y,1}
 sphere {y,1}
 texture {Orange_Glass}
 translate -2*x
}
merge {
 cylinder {-2*y,y,1}
 sphere {y,1}
 texture {Orange_Glass}
 translate 2*x
}

plane {y,-1
 pigment {White}
 finish {ambient .2 reflection .4}
 normal {bozo .02 scale .1}}

light_source {<-6,20,-12>, White area_light 5*x, 5*y, 5, 5}

camera {
 location <1,4,-6>
 look_at 0
}
