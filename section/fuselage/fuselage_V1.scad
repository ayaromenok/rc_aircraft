include <../../lib/lib2.scad>
include <../../std/sg90.scad>
include <../wing/wing_V1.scad>
//M190 S20; set hotbed to 20C - add on 10-15 lyaer

//longeron_alu_1000x10x2(-2,0,6.5,    90,0,90);
//wing_section_200x150mm_straight(my=1);  //R

//fuselage_wing_tail_connector(0,0,0,    0,5,0);
//wing_assembly_central(0,0,0,    0,0,0);

module fuselage_wing_tail_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_alu_500x15x2(-270,0,11.5,    90,0,0);
        
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
            }//union
            
            sg90_cut(-55,15.4,-0.5, 90,0,180);
            sg90_cut(-55,-15.4,-0.5, 90,180,0);
            yCyl(4,10,  -67,-8,-2);
            yCyl(4,10,  -67,8,-2);
            
            //wing alum longeron
            yCube(1000,11.2,2.7,    -2,0,6.5,    85,0,90);
            //tail alum connector
            yCube(500,16.2,2.7,     -270,0,11.5,    90,0,0);
            
            //bottom cut
            yCube(100,50,10,    0,0,-5,  0,-5,0);
            
            //holes
            yCyl(2,30,  20,-14,0);
            yCyl(2,30,  20,14,0);
            yCyl(2,30,  -20,-14,0);
            yCyl(2,30,  -20,14,0);        
            yCyl(2,20,  -80,-14,0);
            yCyl(2,20,  -80,14,0);
            
            yCyl(4,20,  20,-14,15);
            yCyl(4,20,  20,14,15);
            yCyl(4,20,  -20,-14,12);
            yCyl(4,20,  -20,14,12);
            yCyl(4,10,  -80,-14,1);
            yCyl(4,10,  -80,14,1);
            
            //weight save
            yMinkCubeSphere(32,18,20, 3,    22,0,10);
            yMinkCubeSphere(24,32,20, 3,    -96,0,-10);
            yMinkCubeSphere(80,5,20, 2,    -46,0,-10);
            yMinkCubeSphere(22,18,20, 3,    -84,0,-5);
            yMinkCubeSphere(44,5.4,30, 2,    -17,6.8,5);
            yMinkCubeSphere(44,5.4,30, 2,    -17,-6.8,5);
            yMinkCubeSphere(30,6,30, 2,    -0,13.5,5);
            yMinkCubeSphere(30,6,30, 2,    -0,-13.5,5);
            yMinkCubeSphere(14,6,30, 2,    -32,13.5,5);
            yMinkCubeSphere(14,6,30, 2,    -32,-13.5,5);
            yMinkCubeSphere(14,8,30, 2,    32,13.5,5);
            yMinkCubeSphere(14,8,30, 2,    32,-13.5,5);
            
        }//difference
    }//transform
}//module



module longeron_alu_500x15x2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(500,15,2);
    }//transform
}//module


module longeron_fuselage_200mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, h=13.2, size=3){
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
