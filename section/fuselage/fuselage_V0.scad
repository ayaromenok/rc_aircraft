include <../../lib/lib2.scad>

include <../../std/sg90.scad>
include <../../std/ESC_30A.scad>
include <../../std/engine_A2212.scad>
include <../../std/prop_6035.scad>
include <../../std/reciever_FS_IA6B.scad>


fuselage_V0();
//fuselage_central_sec();

module fuselage_V0(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
        //ESC_30A();
        //FS_IA6B(-20,0,20, 0,0,180);
         
        engine_A2212(103,0,58,   0,90,0);
        prop_6035(130,0,58,   0,90,0);
        //central section
        fuselage_central_sec(20,0,0);
        
        //side wheels
        //yMinkCubeSphere(200,10,20,3,    50,60,-40);
        //yMinkCubeSphere(200,10,20,3,    50,-60,-40);
        yCyl(30,10, 135,60,-40,  90,0,0);
        yCyl(30,10, -40,60,-40,  90,0,0);            
        yCyl(30,10, 135,-60,-40,  90,0,0);
        yCyl(30,10, -40,-60,-40,  90,0,0);            
        
        //wing
        translate([70,0,46])
        rotate([90,3,180])
        linear_extrude(height = 1000, center = true, convexity = 10)
            import(file = "../wing/dxf/profile_clark_y.dxf", layer="clark_y_15cm");
        
        
        
                
        //tail section
        yCube(500,2,12, -300,5,30);
        yCube(500,2,12, -300,-5,30);
        yCube(500,12,2, -300,0,25);
        //elevator
        translate([-450,0,35])
        rotate([90,0,180])
        linear_extrude(height = 300, center = true, convexity = 10)
            scale([0.7,0.7])
            import(file = "../wing/dxf/profile_clark_y.dxf", layer="clark_y_15cm");
        yCyl(5,120,  -500,0,100, sx=10);
	}//transform
}//module

module fuselage_central_sec(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yMinkCubeSphere(25,14,90,6.8,    0,0,0, sx=5);
                //bottom
                yMinkCubeSphere(40,100,22,9.9,    0,0,-40, sx=4);            
                //tail
                yMinkCubeSphere(35,16,16,4,    -60,0,30, sx=1);
                //front
                yMinkCubeSphere(45,16,16,7,    60,0,40, sx=1);                        
                yCyl(14,10, 73,0,58,   0,90,0);
                
                yMinkCubeSphere(35,16,22,7,    75,0,-40, sx=3,sy=2);                        
            }
            yCube(100,6.4,100,    0,0,0);
            
            //battery cut
            yCube((105),70,15,    0,0,-40  ); 
            yCube((105),30,15,    0,28,-28  ); 
            yCube((105),30,15,    0,-28,-32  ); 
            yCube((105),5,15,    0,20,-45  ); 
            yCube((105),5,15,    0,-20,-45  ); 
            //tail
            yCube(50,12.4,12.4, -70,0,30);
            
            //front section       
            translate([77,0,58])
            rotate([45,0,0])
            rotate([0,90,0]){
                yCyl(1.9,10,  9.2,0,-10); 
                yCyl(1.9,10,  -9.2,0,-10); 
                yCyl(1.9,10,  0,7.7,-10); 
                yCyl(1.9,10,  0,-7.7,-10); 
                yCyl(4,10,  0,0,-10);
            }
            yCyl(14.4,14, 77,0,58,   0,90,0);            
            yMinkCubeSphere(45,10,12,4,    58,0,40, sx=1);

            //wing connection
            yCyl(3,100, 20,0,30,  90,0,0);
            //chassis
            yCyl(3,100, 115,0,-40,  90,0,0);
            yCyl(3,100, -60,0,-40,  90,0,0);            
        }
        
        //battery
        //color("red") yCube((75+10),34,11,    0,00,-40  ); 
        
        //chassis axes
        //yCyl(3,120, 111,0,-40,  90,0,0);
        //yCyl(3,120, -60,0,-40,  90,0,0);            
        //back support
        difference(){
            yCube(22,10,20, -63,0,13);        
            yCyl(22,12, -74,0,0,  90,0,0);
        }
        //front support
        difference(){
            yCube(22,3,20, 61,0,23);        
            yCyl(22,12, 80,0,12,  90,0,0);
        }
        
        //front engine support
        difference(){
            yCube(18,3,20, 59,0,56);        
            yCyl(18,12, 46,0,66,  90,0,0);
        }
	}//transform
}//module
