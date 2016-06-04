#include "colors.inc"

sphere {0,1 pigment {Red} translate <-2,0,2>}
box {-1,1 pigment {Green} translate <2,0,2>}
cone {-y,1,y,.2 pigment {Yellow} translate <-2,0,-2>}
cylinder {-y,y,.6 pigment {Blue} translate <2,0,-2>}
torus {.8,.2 pigment {Flesh} translate <0,-.8,-.4>}

plane {y,-1
 pigment {White}
 finish {ambient .2 reflection .4}
 normal {bozo .02 scale .1}}

light_source {<-6,20,-12>, White area_light 5*x, 5*y, 5, 5}

camera {
 location <-1,5,-6>
 look_at <0,-.6,0> 
}
