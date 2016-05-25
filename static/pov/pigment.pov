#include "colors.inc"
#include "stones1.inc"

background {White}

sphere {0,1
 pigment {color rgb <1,.5,0> filter .4}
 finish {ambient .4 specular .4 roughness .03}}
plane {y,-1 texture {T_Stone20}}

light_source {<-6,10,-8> White}

camera {
 location -4*z
 look_at 0
}
