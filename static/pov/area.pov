#include "colors.inc"
#include "woods.inc"

union {
 cylinder {0,4*y,1}
 sphere {5*y,1}
 texture {T_Wood3 translate 12 rotate 42}
}

plane {y,0
 pigment {White}
 finish {reflection .2}
 normal {bozo .05 scale .2}
}

light_source {10*<1,1,-1> color rgb .6}
light_source {10*<-1,1,-1> color rgb .6 area_light 3*x,3*y,5,5 jitter}

camera {
 location <0,5,-10>
 look_at 3*y
}
