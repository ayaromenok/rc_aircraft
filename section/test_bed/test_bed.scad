include <../../lib/lib2.scad>

include <../../std/sg90.scad>
include <../../std/ESC_30A.scad>
include <../../std/engine_A2212.scad>
include <../../std/prop_6035.scad>
include <../../std/reciever_FS_IA6B.scad>

test_bed();

module test_bed(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        engine_A2212(30,0,20,   0,90,0);
        prop_6035(60,0,20,   0,90,0);
        ESC_30A();
        FS_IA6B(-20,0,20, 0,0,180);
        
        //ailerons
        sg90(0,50,0,    -90,180,0);
        sg90(0,-50,0,    90,180,0);
        //rudder
        sg90(-100,0,20,  0,0,180);
        //elevator
        sg90(-100,0,0,  90,0,180);
	}//transform
}//module
