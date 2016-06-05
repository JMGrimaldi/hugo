#include "colors.inc"

sphere {0,10
 pigment {bozo color_map {[0 rgb .3][1 rgb 1]}}
 finish {ambient .4 specular .6 roughness .01 phong 1 phong_size 200}
 normal {bozo 10}
}
plane {y,-10 pigment {rgb <47,180,114>/255}}

light_source {<-6,10,-18> color rgb 1 area_light 4*x,4*y,5,5}

camera {
 location -40*z
 look_at 0
}
