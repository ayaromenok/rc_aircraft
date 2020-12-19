include <../../lib/lib2.scad>

include <../../std/sg90.scad>
include <../../std/ESC_30A.scad>
include <../../std/engine_A2212.scad>
include <../../std/prop_6035.scad>
include <../../std/reciever_FS_IA6B.scad>


fuselage_V0();


module fuselage_V0(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
        //ESC_30A();
        //FS_IA6B(-20,0,20, 0,0,180);

        engine_A2212(83,0,55,   0,90,0);
        prop_6035(110,0,55,   0,90,0);
        yCyl(15,10, 63,0,55,   0,90,0);
        //central section
        yMinkCubeSphere(100,14,90,6,    20,0,0);
        yMinkCubeSphere(160,40,20,6,    20,0,-40);
        
        //side
        yMinkCubeSphere(200,10,20,3,    50,60,-40);
        yMinkCubeSphere(200,10,20,3,    50,-60,-40);
        
        //wing
        translate([50,0,50])
        rotate([90,0,180])
        linear_extrude(height = 1000, center = true, convexity = 10)
            import(file = "../wing/dxf/profile_clark_y.dxf", layer="clark_y_15cm");
        
        
        yCube(500,10,10,   -260,0,40);
        //elevator
        translate([-450,0,50])
        rotate([90,0,180])
        linear_extrude(height = 300, center = true, convexity = 10)
            scale([0.7,0.7])
            import(file = "../wing/dxf/profile_clark_y.dxf", layer="clark_y_15cm");
        yCyl(5,120,  -500,0,110, sx=10);
	}//transform
}//module
