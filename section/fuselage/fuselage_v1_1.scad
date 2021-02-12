include <../../lib/lib2.scad>

include <../wing/wing_V1.scad>

include <../../std/sg90.scad>
include <../../std/engine_A2212.scad>
include <../../std/prop_6035.scad>

//M190 S20; set hotbed to 20C - add on 10-15 lyaer

//longeron_alu_1000x10x2(-2,0,6.5,    90,0,90);

//fuselage_wing_tail_connector(0,0,0,    0,5,0);
//fuselage_engine_connector();
//fuselage_chassis_connector();
//fuselage_assembly();

module fuselage_assembly(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        fuselage_engine_connector(40,0,93.2);
        fuselage_chassis_connector();
        fuselage_wing_tail_connector(5,0,111,    0,0,0);    
    }//transform
}//module

module fuselage_engine_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        //engine_A2212(60,0,14, 0,-90,180);
        //prop_6035(85,0,14, 0,90,0);
        //engine support
        translate([10,0,-71])
        difference(){
            yCyl(14,20, 27,0,85, 0,90,0);
            //engine cooling
            yCyl(7,25, 30,0,100, 0,105,0);
            yCyl(7,35, 30,0,70, 0,90,0);
            yCyl(7,25, 30,17,85, 0,90,-15);
            yCyl(7,25, 30,-17,85, 0,90,15);            
            //weight save
            yCube(20,40,40, 15,0,18+73,  0,35,0);
            //engine connection
            translate([30,0,85])
            rotate([0,90,0])
            rotate([0,0,45]){
                yCyl(2,40,  9.3,0,-10); 
                yCyl(2,40,  -9.3,0,-10); 
                yCyl(2,40,  0,7.8,-10); 
                yCyl(2,40,  0,-7.8,-10);
                yCyl(4,30,  0,0,0);
                
                yCyl(3.5,20,  9.3,0,-10,    0,00,0); 
                yCyl(3.5,20,  -9.3,0,-10,    0,0,0); 
                yCyl(3.5,20,  0,7.8,-10,    0,0,0); 
                yCyl(3.5,20,  0,-7.8,-10);
            }//transform
            
        }//difference
        
        fuselage_wing_vertical_support();
        fuselage_wing_vertical_support(my=1);        
    }//transform
}//module

module fuselage_wing_vertical_support(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx, my, mz]){
        difference(){
            union(){
                yMinkCubeSphere(196,7,7, 2.4,  -51,9,1,  0,0,0);
                //chassis                
                yMinkCubeSphere(8,16,5, 2.4,  -20,5.75,0,  0,0,0, sx=1.4);    
                yMinkCubeSphere(8,16,5, 2.4,  -60,5.75,0,  0,0,0, sx=1.4);                
                yMinkCubeSphere(8,16,5, 2.4,  -100,5.75,0,  0,0,0, sx=1.4);
                
                //wing                
                yMinkCubeSphere(10,8,45, 2.4,  -25,13.75,20,  0,0,0, sx=1.4);            
                yMinkCubeSphere(10,8,45, 2.4,  -55,13.75,20,  0,0,0, sx=1.4);
                yMinkCubeSphere(10,8,45, 2.4,  -85,13.75,20,  0,0,0, sx=1.4);
                yMinkCubeSphere(10,8,45, 2.4,  -115,13.75,20,  0,0,0,sx=1.4);
                yMinkCubeSphere(10,8,45, 2.4,  -145,13.75,20,  0,0,0,sx=1.4);
            }//union
            //cut 5 degree for wing
            yMinkCubeSphere(260,36,45, 2.4,  -40,11.75,40,  0,-5,0);
            //to chassis            
            yCyl(1.8,50,    -20,9.5,0);
            yCyl(1.8,50,    -60,9.5,0);
            yCyl(1.8,50,    -100,9.5,0);
            yCyl(1.8,50,    -140,9.5,0);
            
            yCyl(3.2,5,    -20,9.5,7);
            yCyl(3.2,5,    -60,9.5,7);
            yCyl(3.2,5,    -140,9.5,7);
        
            //to wing            
            yCyl(1.8,50,    -25,14,0);
            yCyl(1.8,50,    -55,14,0);
            yCyl(1.8,50,    -85,14,0);
            yCyl(1.8,50,    -115,14,0);
            yCyl(1.8,50,    -145,14,0);
            
            //to wing            
            yCube(6.4,20,5,    -25,14,13);
            yCube(6.4,20,5,     -55,14,10.5);
            yCube(6.4,20,5,     -85,14,8);
            yCube(6.4,20,5,     -115,14,5.5);
            yCube(6.4,10,5,     -145,14,3);
            //weight save            
            yCube(6.4,10,15,    -25,17,4);
            yCube(6.4,10,15,     -55,17,3);
            yCube(6.4,10,10,     -85,17,3);
            yCube(6.4,10,10,     -115,17,1.5);
            yCube(6.4,10,10,     -145,17,-1.5);
            
            yCube(120,25,25,    -70,27,0,  75,0,0);
        }//difference
        //adhesion
        yCube(6,15,0.4,    45,10,-2.2);
        yCube(6,15,0.4,    -151.5,10,-2.2);
    }//transform
}//module        
module fuselage_chassis_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
        fuselage_chassis_vertical_support(20,9.5,0);
        fuselage_chassis_vertical_support(20,-9.5,0);
        fuselage_chassis_vertical_support(-20,9.5,0);
        fuselage_chassis_vertical_support(-20,-9.5,0);
        
        
        //bottom connection to chassis
          //main longerons
        yMinkCubeCyl(65,5,6, 1,    0,8.5,-1.5);
        yMinkCubeCyl(65,5,6, 1,    0,-8.5,-1.5);
        
        //"nervures"        
        yCube(3,20,5,   30,0,-1.5);
        yCube(3,20,5,   -30,0,-1.5);
        //to fuselage
        for (i=[-30:30:(30)]){
            yTube(4,1.8,3,   i,14,-3);
            yTube(4,1.8,3,   i,-14,-3);
        }//for
   }//transform
}//module
module fuselage_chassis_vertical_support(px=0, py=0, pz=0, rx=0, ry=0, rz=0, height=95){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yMinkCubeCyl(5,6,height, 2,    0,0,(height/2-4.1), sx=2.6);
            yCyl(1.8,20,    0,0,height-10);            
            yCube(7,7,4,    0,0,height-10);
            //additional holes for camera holder, etc - just in case            
            yCyl(1.8,10,    0,0,height/2,  90,0,0);
            yCyl(1.8,10,    0,0,height/4,  90,0,0);
        }
        
    }//transform
}//module
module fuselage_wing_tail_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //longeron_alu_500x15x2(-270,0,11.5,    90,0,0);
        
        longeron_fuselage_200mm(0,0,0,    0,-5,0);
        difference(){
            longeron_fuselage_200mm(h=12.4,  -30,0,-2.5,    0,-5,0);
            //tail alum connector
            yCube(500,16.2,2.7,     -270,0,11.5,    90,0,0);
        }//difference
        
        nervure_clark_y_150mm_outer2(0,-50,0,   0,-5,0);
        nervure_clark_y_150mm_outer2(0,50,0,   0,-5,0);
        
        //central wing
        difference(){
            union(){
                translate([40,0,3.5])
                rotate([90,5,180])
                linear_extrude(height = 36, center = true, convexity = 10)
                        import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_main");                
                
                yMinkCubeSphere(60,8,26, 2.5, -40,0,9);
                yMinkCubeSphere(20,4,16, 1.5, -5,0,9);
                
                yMinkCubeSphere(8,100,13.8, 2.5, -3.4,0,6.5,  0,-5,0);
            }//union
            
            sg90_cut(-55,14,-0.5, 90,0,180);
            sg90_cut(-55,-14,-0.5, 90,180,0);
            yCube(23.6,20,30, -55,14,-0.5);
            yCube(23.6,20,30, -55,-14,-0.5);
            yCyl(4,10,  -67,-8,-2);
            yCyl(4,10,  -67,8,-2);
            
            //wing alum longeron
            yCube(1000,11.2,3.1,    -3.4,0,6.5,    85,0,90);
            //tail alum connector
            yCube(500,16.0,2.7,     -270,0,11.5,    90,0,0);
            
            //bottom cut
            yCube(100,50,10,    0,0,-5,  0,-5,0);
            
            //holes
            yCyl(2,30,  10,-14,0);
            yCyl(2,30,  10,14,0);
            yCyl(2,30,  -20,-14,0);
            yCyl(2,30,  -20,14,0);        
            yCyl(2,20,  -80,-14,0);
            yCyl(2,20,  -80,14,0);
            
            yCyl(4,20,  10,-14,15);
            yCyl(4,20,  10,14,15);
            yCyl(4,20,  -20,-14,12);
            yCyl(4,20,  -20,14,12);
            yCyl(4,10,  -80,-14,1);
            yCyl(4,10,  -80,14,1);
            
            //weight save
            yMinkCubeSphere(34,18,20, 3,    23,0,10);
            yMinkCubeSphere(24,32,20, 3,    -96,0,-10);
            yMinkCubeSphere(80,4,20, 1.8,    -46,0,-10);
            yMinkCubeSphere(22,18,20, 3,    -84,0,-5);
            yMinkCubeSphere(44,5.4,30, 2,    -17,6.8,5);
            yMinkCubeSphere(44,5.4,30, 2,    -17,-6.8,5);
            yMinkCubeSphere(26,12,30, 2,    27,15.5,5);
            yMinkCubeSphere(26,12,30, 2,    27,-15.5,5);            
            yMinkCubeSphere(20,5,30, 2,    -5,13.5,5);
            yMinkCubeSphere(20,5,30, 2,    -5,-13.5,5);
            yMinkCubeSphere(14,6,30, 2,    -32,13.5,5);
            yMinkCubeSphere(14,6,30, 2,    -32,-13.5,5);
            
            yCyl(3,20,  -21,0,14.5,  90,0,0);
            yCyl(4,20,  -31,0,14,  90,0,0);
            yCyl(5,20,  -43,0,13.5,  90,0,0);
            yCyl(6,20,  -57,0,13,  90,0,0);
            
        }//difference
        
        rotate([0,-5,0]){
            //front longeron
            yCyl(2.3,200, 39.4,0,1.2,  90,60,0, sx=0.3);                
            //back longeron
            yCube(3,200,0.7,    -109.4,0,0.35);            
        }    
                //adhesion for pinting
        yCube(148,3,0.35,    -36,98.5,-3,    0,-5,0);     
        yCube(148,3,0.35,    -36,-98.5,-3,    0,-5,0); 
    }//transform
}//module



module longeron_alu_500x15x2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(500,15,2);
    }//transform
}//module


module longeron_fuselage_200mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, h=13.2, size=4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        s_2=size/2;
        s_4=size/4;
        difference(){
            union(){                
                yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=length/2,rx=90);        
                yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=-length/2,pz=h,rx=-90);
                
                translate([0,-length/2,0])
                for (i=[0:32.6:(length)]){
                    yCyl(2.5,h, 0,i+2.1,h/2, sx=0.6,$fn=6);
                }//for
            }//union
            yCube(size,45,h*2,    (s_2+0.2),length/2,h/2);
            yCube(size,45,h*2,    (s_2+0.2),-length/2,h/2);
        }//difference        
    }//transform
}//module
