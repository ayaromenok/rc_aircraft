include <../../lib/lib2.scad>

include <../../std/sg90.scad>
include <../../std/ESC_30A.scad>
include <../../std/engine_A2212.scad>
include <../../std/prop_6035.scad>
include <../../std/reciever_FS_IA6B.scad>

test_bed();
/*
difference(){
yCube(25,25,1.4,    0,0,-10);
            yCyl(1.7,10,  9.3,0,-10); 
            yCyl(1.7,10,  -9.3,0,-10); 
            yCyl(1.7,10,  0,7.8,-10); 
            yCyl(1.7,10,  0,-7.8,-10); 
yCube(11,9,3.4,    0,0,-10);    
} 
*/
module test_bed(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //horizontal part/motor        
        difference(){
            yCube(150,40,1.2,     0,0,-65);
            yCyl(15,10,         2,0,-65);
            yCyl(15,10,         37,0,-65);
            yCyl(15,10,         -34,0,-65);
        }//difference
        yCube(150,1.2,6,     0,19.4,-62);
        yCube(150,1.2,6,     0,-19.4,-62);
        
        //vertical part/motor
        difference(){
            yCube(1.2,40,105,     20,0,-13.1);
            
            translate([30,0,20])
            rotate([0,90,0]){
                yCyl(1.9,10,  9.2,0,-10); 
                yCyl(1.9,10,  -9.2,0,-10); 
                yCyl(1.9,10,  0,7.7,-10); 
                yCyl(1.9,10,  0,-7.7,-10); 
                yCyl(4,10,  0,0,-10);
                
                yCyl(15,10, 30,0,-10);
                yCyl(15,10, 65,0,-10);
            }//transform            
        }//difference
        yCube(12,1.2,105,     17.6,19.4,-13.1);
        yCube(12,1.2,105,     17.6,-19.4,-13.1);
        
        //wings
        yCube(10,120,1.2,     20,0,-65);
        //tale
        yCube(15,1.2,30,     -67,-19.4,-50);
        
        //engine_A2212(33,0,20,   0,90,0);
        //prop_6035(60,0,20,   0,90,0);
        //ESC_30A();
        //FS_IA6B(-20,0,20, 0,0,180);
        
        //ailerons
        //sg90(0,50,-56,    -90,180,0);
        //sg90(0,-50,-56,    90,180,0);
        //rudder
        //sg90(-100,0,-36,  0,0,180);
        //elevator
        //sg90(-100,0,-56,  90,0,180);
	}//transform
}//module
