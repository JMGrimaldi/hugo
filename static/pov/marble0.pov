#include "colors.inc"

background {LightSteelBlue}

union {
 plane {y,0}
 cylinder {0,4*y,1}
 sphere {5*y,1}

 pigment {marble
   color_map {[0 rgb <.5,.3,0>][.3 rgb <1,.9,.8>][.8 rgb .9]}
 }
 finish {reflection .2 ambient .4 diffuse .4 phong .4 phong_size 100}
}

light_source {10*<-1,1,-1> color rgb 1}

camera {
 location <4,5,-8>
 look_at 3*y
}
