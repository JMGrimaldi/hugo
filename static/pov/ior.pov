#include "colors.inc"
#include "stones1.inc"

background {LightBlue}

sphere {0,1
 pigment {color rgb <1,.5,0> filter .6}
 finish {ambient .2 diffuse .4 reflection .03 specular 1 roughness .001}
 interior {ior 1.05}}
plane {y,-1 pigment {checker color White color Black} finish {ambient .3}}

light_source {<-6,10,-8> White}

camera {
 location <0,.1,-4>
 look_at 0
}
