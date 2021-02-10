include <../chassis/chassis.scad>
include <../wing/wing_V1.scad>
include <../tail/stabilizer_V1.scad>
include <../fuselage/fuselage_V1.scad>


fuselage_wing_tail_connector(0,0,0,    0,0,0);
stabilizer_assembly(-540,0,0);
wing_assembly(0,0,0,    0,-5,0);
chassis_assembly(0,0,-100);