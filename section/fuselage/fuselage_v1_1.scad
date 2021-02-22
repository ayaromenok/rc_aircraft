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
//fuselage_tail_front();
//fuselage_tail_back();
//fuselage_chassis_tail_connector();
//fuselage_stabilizer_connector();
//fuselage_stabilizer_v_top(0,-100,0,my=1);
//fuselage_stabilizer_v_bot(0,18,0,my=1);
//fuselage_stabilizer_v_rudder();
//fuselage_stabilizer_h(,0,140,0);//left
//fuselage_stabilizer_h(,0,-140,0, my=1);//right
//fuselage_stabilizer_h_elevator();
//fuselage_assembly();

module fuselage_assembly(px=0, py=0, pz=0, rx=0, ry=0, rz=0, isServo=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        fuselage_engine_connector(40,0,93.2);
        //fuselage_chassis_connector();
        fuselage_wing_tail_connector(5,0,111,    0,0,0);            
        fuselage_tail_front(50,0,93.8, 180);
        fuselage_tail_back(-150,0,93.8, 180);
        fuselage_chassis_tail_connector(0,0,93.3,  180,0,0);
        fuselage_stabilizer_connector(-475,0,87.3);
        translate([-475,0,87.3]){
            fuselage_stabilizer_v_top(-10,4,85, -90,0,3,my=1);
            fuselage_stabilizer_v_bot(-10,4,-28, -90,0,3,my=1);
            fuselage_stabilizer_h(,0,140,0);//left
            fuselage_stabilizer_h(,0,-140,0, my=1);//right
            fuselage_stabilizer_h_elevator(12,109,-8);
            fuselage_stabilizer_h_elevator(12,-109,-8);
            fuselage_stabilizer_v_rudder(2,2,43,   90,0,0);
        }//translate

        if (isServo){
            sg90(-45,10,73,   -90,0,0);
            sg90(-45,-11,79,   -180,0,0);        
            sg90(-50,14,110.5, 90,0,180);
            sg90(-50,-14,110.5, 90,180,0);
        }//if (isServo)
        
    }//transform
}//module


module fuselage_stabilizer_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //yCube(30,3,15,  10,-7,0);
        //yCube(30,3,15,  10,7,0);
        longeron_central_200mm(-1.5,9,-7.5, 0,0,90,h=13,length=77);
        mirror([0,1,0])
        longeron_central_200mm(-1.5,9,-7.5, 0,0,90,h=13,length=77);
        
        nervure_clark_y_150mm_outer2(0,15,-7.5, sx=0.8,sz=0.8);        
        nervure_clark_y_150mm_outer2(0,-15,-7.5, sx=0.8,sz=0.8);
        nervure_clark_y_150mm_outer(0,65,-7.5, sx=0.8,sz=0.8);
        nervure_clark_y_150mm_outer(0,-65,-7.5, sx=0.8,sz=0.8);
        //longeron_central_200mm();
        longeron_fuselage_200mm(0,0,-7.5, h=10.5);
        longeron_fuselage_200mm(-30,0,-7.5, h=9.5);
        
        yCube(3,1.2,86,    31.4,57,-6.45, 90,-30,0);
        yCube(3,1.2,86,    31.4,-57,-6.45, 90,-30,0);
    
        //Fin - turn 5-7 degree left for right wing
        //yCyl(5,100, 0,0,50,  0,0,5, sx=5);
        yMinkCubeCyl(5,3,30, 1,    -10,9.5,7.5);
        yMinkCubeCyl(5,4,30, 1,    -10,-6,7.5);
        yMinkCubeCyl(5,5,30, 1,    -40,6,7.5);
        yMinkCubeCyl(5,3,30, 1,    -40,-8,7.5);
        
        //adhesion        
        yCube(62,4,0.4,  0,98,-7.3);
        yCube(62,4,0.4,  0,-98,-7.3);        
        yCube(8,30,0.4,  33,00,-7.3);
        yCube(6,18,0.4,  -40,00,-7.3);
        yCube(6,30,0.4,  -86,00,-7.3);
        yCube(6,8,0.4,  -45,65,-7.3);
        yCube(6,8,0.4,  -45,-65,-7.3);
    }//transform
}//module        

module fuselage_stabilizer_h(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0,my=0,mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        
        nervure_clark_y_150mm_outer2(0,68,-7.5, sx=0.8,sz=0.8);                
        nervure_clark_y_150mm_outer(0,25,-7.5, sx=0.8,sz=0.8);
        nervure_clark_y_150mm_outer(0,-25,-7.5, sx=0.8,sz=0.8);
        
        longeron_outer_200mm(0,0,-7.5, h=10.5, length=135);
        longeron_outer_200mm(-30,0,-7.5, h=9.5, length=135);     
        yCube(3,1.2,135,    31.4,0,-6.45, 90,-30,0);
        //adhesion
        yCube(61,4,0.4,  0.5,-65.5,-7.3);
        yCube(8,8,0.4,  -87,67,-7.3);
    }//transform
}//module        

module fuselage_stabilizer_h_elevator(px=0,py=0,pz=0,  rx=0,ry=0,rz=0,     mx=0,my=0,mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        nervure_clark_y_150mm_elevator(0,0,0);
        nervure_clark_y_150mm_elevator(0,45,0);
        nervure_clark_y_150mm_elevator(0,-45,0);
        nervure_clark_y_150mm_elevator(0,90,0);
        nervure_clark_y_150mm_elevator(0,-90,0);
        
        longeron_central_200mm(-64,0,1.1, h=6.4, length=183);
        yCube(4,183,1,  -108,0,1.4);
    }//transform
}//module

module fuselage_stabilizer_v_top(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0,my=0,mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        
        nervure_clark_y_150mm_outer2(0,100,-7.5, sx=0.8,sz=0.8);
        nervure_clark_y_150mm_outer(0,-63,-7.5, sx=0.8,sz=0.8);
        nervure_clark_y_150mm_outer2(0,63,-7.5, sx=0.8,sz=0.8);        
        nervure_clark_y_150mm_outer(0,25,-7.5, sx=0.8,sz=0.8);
        nervure_clark_y_150mm_outer(0,-25,-7.5, sx=0.8,sz=0.8);
        
        longeron_outer_200mm(0,0,-7.5, h=10.5, length=200);
        longeron_outer_200mm(-30,0,-7.5, h=9.5, length=200);     
        yCube(3,1.2,200,    31.4,0,-6.25, 90,-30,0);
        yCube(3,0.8,37,    -87.3,82.3,-7.1, 90,0,0);
        //adhesion
        yCube(61,4,0.4,  0.5,-100,-7.3);
        
    }//transform
}//module        

module fuselage_stabilizer_v_bot(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0,my=0,mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        nervure_clark_y_150mm_outer2(0,-35,-7.5, sx=0.8,sz=0.8);
        nervure_clark_y_150mm_outer(0,15,-7.5, sx=0.8,sz=0.8);
        
        longeron_outer_200mm(0,0,-7.5, h=10.5, length=70);
        longeron_outer_200mm(-30,0,-7.5, h=9.5, length=70);     
        yCube(3,1.2,70,    31.4,0,-6.25, 90,-30,0);
        
        //adhesion
        yCube(61,4,0.4,  0.5,35,-7.3);        
    }//transform
}//module        




module fuselage_stabilizer_v_rudder(px=0,py=0,pz=0,  rx=0,ry=0,rz=0,     mx=0,my=0,mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        nervure_clark_y_150mm_elevator(0,0,0);
        nervure_clark_y_150mm_elevator(0,50,0);
        nervure_clark_y_150mm_elevator(0,-50,0);
        nervure_clark_y_150mm_elevator(0,102,0);
        nervure_clark_y_150mm_elevator(0,-102,0);
        
        longeron_central_200mm(-64,0,1.1, h=6.4, length=204);
        yCube(4,204,1,  -108,0,1.4);
    }//transform
}//module
//nervure_clark_y_150mm_elevator();
module nervure_clark_y_150mm_elevator(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=2.6, off=1.2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        yTube(3.5,1.6,3,  -61,0,4.5,  90,0,0);
        yCyl(1,4.3,   -78,0,3.2, $fn=4,sx=2);        
        difference(){
            yCyl(4,3, -78.5,0,3.2,  90,176,0, $fn=3, sx=8);
            yCyl(2.8,4, -76,0,3.3,  90,176,0, $fn=3, sx=8);
        }//difference
	}//transform
}//module

module fuselage_chassis_tail_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCyl(rt=22,rb=10,szz=7, px=0,py=0,pz=95, sx=2.5);
                yCyl(10,90, 0,0,47,sx=2.5);
                yCube(52,26,5,  0,0,1);
                yCube(10,44,5,  -25,0,1);
            }//union
            //internal
            yCyl(9,110, 0,0,47,sx=2.5);
            //to wing
            yCyl(1.8,10,  20,9.5,0);
            yCyl(1.8,10,  20,-9.5,0);
            yCyl(1.8,10,  -20,9.5,0);
            yCyl(1.8,10,  -20,-9.5,0);            
            //to chassis
            for (i=[-30:30:(30)]){
                yCyl(1.8,10,   i,14,96);
                yCyl(1.8,10,   i,-14,96);
            }//for    
            yCube(30,50,20, 48,0,92, 0,30);
            yCube(30,50,20, -48,0,92, 0,-30);
            yCube(70,10,20, 0,22,92, 0,0);
            yCube(70,10,20, 0,-22,92, 0,0);
            
            yCyl(10,30, -26,0,60,  90, sy=3);
        }//difference
        
        
        yCube(30,2,3,  -35,0,0);
        yCube(30,2,3,  -35,0,29);
        yCube(1,2,29,  -49.5,0,15);
        yCube(10,2,29,  -25,0,15);
        //side
        yCube(30,3,15,  -35,-22,6);
        yCube(30,3,15,  -35,22,6);
        
        //servos
        difference(){
            yCube(34,16,20, -45,11,8.5);
            sg90_cut(-45,11,12);
        }//difference
        difference(){
            yCube(34,8,30, -45,-12,13.5);
            sg90_cut(-45,-10,20.3,    90);
        }//difference
        
        
    }//transform
}//module
module fuselage_tail_front(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_fuselage(-200,18,0, 0,0,92.3,length=200);
        longeron_fuselage(-200,-18,0, 0,0,87.7,length=200);
        
        fuselage_profile_tail(-125,0,0, depth=4);
        fuselage_profile_tail(-175,0,0, scale=0.92);
        fuselage_profile_tail(-225,0,0, scale=0.83);
        fuselage_profile_tail(-275,0,0, scale=0.75, depth=4);
        yCube(2,2,30,  -299,0,15);
    }//transform
}//module

module fuselage_tail_back(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_fuselage(-200,10,0, 0,0,92.3,length=200);
        longeron_fuselage(-200,-10,0, 0,0,87.7,length=200);
        
        fuselage_profile_tail(-125,0,0, scale=0.67);
        fuselage_profile_tail(-175,0,0, scale=0.58);
        fuselage_profile_tail(-225,0,0, scale=0.49, depth=4);
        fuselage_profile_tail(-275,0,0, scale=0.4);
        yCube(2,2,30,  -299,0,15);
    }//transform
}//module

module longeron_fuselage(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, h=13.7){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCyl(2.5,length,    0,0,0, 0,-90,90, sx=0.7, $fn=3);
        yCyl(2.5,length,    0,0,h, 0,90,90, sx=0.7, $fn=3);
        
        yCyl(2.5,h, 0,0,h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,47.5,h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,97.5,h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,-47.5,h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,-97.5,h/2, , sx=0.4,$fn=6);
    }//transform
}//module 
module fuselage_profile_tail(px=0, py=0, pz=0, rx=0, ry=0, rz=0, scale=1, depth=2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    {

        difference(){
            yPoly(p=[[23,0],[23,15.5],[2,30],[0,30],[0,0]], szz=depth, pz=-0.9,rx=90,rz=90, sx=scale);
            yPoly(p=[[21,2],[21,14.5],[2,27],[2,2]], szz=depth+3, px=-1,pz=-0.9,rx=90,rz=90, sx=scale);
        }
        translate([depth,0,0])
        rotate([0,0,180])
        difference(){
            yPoly(p=[[23,0],[23,15.5],[2,30],[0,30],[0,0]], szz=depth, pz=-0.9,rx=90,rz=90, sx=scale);
            yPoly(p=[[21,2],[21,14.5],[2,27],[2,2]], szz=depth+3, px=-1,pz=-0.9,rx=90,rz=90, sx=scale);
        }
        yCube(50,2,2,  0,0,0);
        yCube(3,2,30,  23.5,0,15);
        yCube(50,2,2,  0,0,30);
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
        
        //fuselage_chassis_vertical_support(20,9.5,0);
        //fuselage_chassis_vertical_support(20,-9.5,0);
        //fuselage_chassis_vertical_support(-20,9.5,0);
        //fuselage_chassis_vertical_support(-20,-9.5,0);
        
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
