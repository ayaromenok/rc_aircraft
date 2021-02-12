include <../../lib/lib2.scad>
    

//chassis_ski();
//chassis_middle_section();
//chassis_assembly();
module chassis_assembly(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){          
        
        chassis_middle_section(0,0,-4, 180,0,0);
        
        chassis_connector_v1_1(106,0,-149);    
        chassis_connector_v1_1(-106,0,-149);
        //chassis_connector(100,0,-107,    90,0,90);
        //chassis_connector(-100,0,-107,    90,0,-90);
            
        chassis_ski(86,147,-136);
        chassis_ski(-126,147,-136);
        
        chassis_ski(86,-147,-136);
        chassis_ski(-126,-147,-136);
    }//transform
}//module

//chassis_connector_v1_1();
module chassis_connector_v1_1(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){  
        chassis_connector_v1_1_upper(0,0,100, 0,90,0);
        
        chassis_connector_v1_1_lower(0,147,0, 0,90,0);
        chassis_connector_v1_1_middle(0,147,70, 0,30,90);
        chassis_connector_v1_1_middle(0,147,110, 180,30,90);
        
        chassis_connector_v1_1_lower(0,-147,0, 0,90,0);
        chassis_connector_v1_1_middle(0,-147,70, 0,30,-90);
        chassis_connector_v1_1_middle(0,-147,110, 180,30,-90);
        
    }//transform
}//module
//chassis_connector_v1_1_upper();
module chassis_connector_v1_1_upper(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){  
        //connection to fuselage
        yTube(4,1.8,12,     -45,30,0);
        yTube(4,1.8,12,     -45,-30,0);
        
        yTube(4,1.8,12,     -30,30,0);
        yTube(4,1.8,12,     -30,-30,0);
        //center
        difference(){
            yMinkCubeSphere(6,186,12, 2,    -40,0,0);
            //holes just in case
            yCyl(1.8,10,    -40,50,0,  0,90,0);
            yCyl(1.8,10,    -40,70,0,  0,90,0);
            yCyl(1.8,10,    -40,-50,0,  0,90,0);
            yCyl(1.8,10,    -40,-70,0,  0,90,0);
        }//
        yMinkCubeSphere(6,101,12, 2,    -19,46,0,    0,0,-20);
        yMinkCubeSphere(6,101,12, 2,    -19,-46,0,    0,0,20);
        //right
        difference(){
            yMinkCubeSphere(36,6,12, 2,    -20,95,0);
            yCyl(1.8,10,    -10,95,0,    90);
            yCyl(1.8,10,    -20,95,0,    90);
        }//difference
        
        yTube(6,1.8,3,     0,95,-4.5);
        yTube(4,1.8,12,    0,95,0);
        yTube(6,1.8,3,     -40,95,-4.5);
        yTube(4,1.8,12,    -40,95,0);        
        //left
        difference(){
        yMinkCubeSphere(36,6,12, 2,    -20,-95,0);
            yCyl(1.8,10,    -10,-95,0,    90);
            yCyl(1.8,10,    -20,-95,0,    90);
        }//difference
        yTube(6,1.8,3,     0,-95,-4.5);
        yTube(4,1.8,12,    0,-95,0);
        yTube(6,1.8,3,     -40,-95,-4.5);
        yTube(4,1.8,12,    -40,-95,0);
        
    }//transform
}//module   

//chassis_connector_v1_1_middle();
module chassis_connector_v1_1_middle(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){  
        yTube(6,1.8,3,  0,7.7,0,  90,0,0);
        yTube(6,1.8,3,  0,-7.7,0,  90,0,0);
        
        yTube(6,1.8,3,  -60,7.7,0,  90,0,0);
        yTube(6,1.8,3,  -60,-7.7,0,  90,0,0);
        
        yMinkCubeSphere(56,3,6, 1, -30,7.7,-3);
        yMinkCubeSphere(56,3,12, 1, -30,-7.7,0);
        
        yMinkCubeSphere(6,15,6, 1, -30,0,-3);
        difference(){
            yCube(43,16,2, -30,0,-5);        
            //rubber amo connector
            yCyl(1.8,10,    -12,0,-5);
        }//difference
        //move locker
        yCube(3,7,12, -50,-5,0, 0,0,0);
          //adhesian
        yCube(10,18.4,0.4,    5,0,-5.8);
        yCube(10,18.4,0.4,    -65,0,-5.8);
    }//transform
}//module    
//chassis_connector_v1_1_lower();
module chassis_connector_v1_1_lower(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){  
        yTube(6,2.4,3,  0,3,0,  90,0,0);
        yTube(6,2.4,3,  0,-3,0,  90,0,0);
        yMinkCubeSphere(12,3,12, 1, -8.5,3,0);
        yMinkCubeSphere(12,3,12, 1, -8.5,-3,0);
        
        difference(){
            yMinkCubeSphere(60,6,12, 2,    -38,0,0);
            //holes for ski rubber amo and other
            yCyl(1.8,10,    -30,0,0,    90);
            yCyl(1.8,10,    -50,0,0,    90);
        }//difference
        
        difference(){
            yMinkCubeSphere(36,6,12, 2,    -90,0,0);
            //holes for rubber amo
            yCyl(1.8,10,    -100,0,0,    90);
            yCyl(1.8,10,    -90,0,0,    90);
        }//difference
        yTube(6,1.8,3,    -70,0,-4.5);
        yTube(4,1.8,12,    -70,0,0);
        yTube(6,1.8,3,    -110,0,-4.5);
        yTube(4,1.8,12,    -110,0,0);
        
          //adhesian
        yCube(10,9,0.4,    5,0,-5.8);
    }//transform
}//module    

//chassis_middle_section();
module chassis_middle_section(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){          
        //main longerons
        yMinkCubeSphere(198,6,12, 2,    0,8,1);
        yMinkCubeSphere(198,6,12, 2,    0,-8,1);
        
        difference(){
            union(){            
                yMinkCubeSphere(6,72,12, 2,     97.5,0,1);
                yMinkCubeSphere(6,12,24, 2,     97.5,30,8);        
                yMinkCubeSphere(6,12,24, 2,     97.5,-30,8);        
            }//union
            yCyl(1.8,10,    96,30,0,  0,90,0);
            yCyl(1.8,10,    96,-30,0,  0,90,0);
            yCyl(1.8,10,    96,30,15,  0,90,0);
            yCyl(1.8,10,    96,-30,15,  0,90,0);
        }//difference
        
        difference(){
            union(){            
                yMinkCubeSphere(6,72,12, 2,     -97.5,0,1);
                yMinkCubeSphere(6,12,24, 2,     -97.5,30,8);        
                yMinkCubeSphere(6,12,24, 2,     -97.5,-30,8);        
            }//union
            yCyl(1.8,10,    -96,30,0,  0,90,0);
            yCyl(1.8,10,    -96,-30,0,  0,90,0);
            yCyl(1.8,10,    -96,30,15,  0,90,0);
            yCyl(1.8,10,    -96,-30,15,  0,90,0);
        }//difference
        
        //"nervures" middle       
        yMinkCubeSphere(6,20,12, 2,     30,0,1);
        yMinkCubeSphere(6,20,12, 2,     -30,0,1);
        
        
        //to fuselage
        for (i=[-90:30:(90)]){
            yTube(5,2,4,   i,14,-3);
            yTube(5,2,4,   i,-14,-3);
        }//for
        
        //adhesian
        /*
        yCube(10,10,0.4,    97,24,-3.8);
        yCube(10,10,0.4,    97,-24,-3.8);
        yCube(10,10,0.4,    -97,24,-3.8);
        yCube(10,10,0.4,    -97,-24,-3.8);
        */
    }//transform
}//module

module chassis_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){  
        size=200;
        shift=2.4;
        
        s_2=size/2;
        s_4=size/4;
        
        sh2=shift*2;
        sh3=shift*3;
        sh_2=shift/2;
        
        difference(){
            yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=5,px=0,py=0,rx=0);
            yPoly(p=[[s_2-shift,0],[s_2-shift,s_4-shift],[s_4-shift,s_2-shift],[-s_4+shift,s_2-shift], [-s_2+shift,s_4-shift],[-s_2+shift,0]], szz=7,px=0,py=0,pz=-1);
        }//difference
        difference(){
            yPoly(p=[[s_2-sh2,0],[s_2-sh2,s_4-sh2],[s_4-sh2,s_2-sh2],[-s_4+sh2,s_2-sh2], [-s_2+sh2,s_4-sh2],[-s_2+sh2,0]], szz=5,px=0,py=0,pz=0);
            yPoly(p=[[s_2-sh3,0],[s_2-sh3,s_4-sh3],[s_4-sh3,s_2-sh3],[-s_4+sh3,s_2-sh3], [-s_2+sh3,s_4-sh3],[-s_2+sh3,0]], szz=7,px=0,py=0,pz=-1);
        }//difference
        
        //to chassis ski/wheel
        difference(){
            yCyl(6,shift,     s_2-sh_2,-2,6,  0,90,0);
            yCyl(2.4,sh2,     s_2-sh_2,-2,6,  0,90,0);
        }//difference        
        difference(){
            yCyl(6,shift,     s_2-sh2-sh_2,-2,6,  0,90,0);
            yCyl(2.4,sh2,     s_2-sh2-sh_2,-2,6,  0,90,0);
        }//difference
        
        //to chassis ski/wheel
        difference(){
            yCyl(6,shift,     -s_2+sh_2,-2,6,  0,90,0);
            yCyl(2.4,sh2,     -s_2+sh_2,-2,6,  0,90,0);
        }//difference        
        difference(){
            yCyl(6,shift,     -s_2+sh2+sh_2,-2,6,  0,90,0);
            yCyl(2.4,sh2,     -s_2+sh2+sh_2,-2,6,  0,90,0);
        }//difference
        
        //fuselage connector
        difference(){
            yCyl(4,5,   20,s_2+shift*1.3,2.5);
            yCyl(2,7,   20,s_2+shift*1.3,2.5);
        }
        difference(){
            yCyl(4,5,   -20,s_2+shift*1.3,2.5);
            yCyl(2,7,   -20,s_2+shift*1.3,2.5);
        }
        
        //connector of internal/external leg
        yCube(shift,shift,5,  20,s_2-shift*1.5,2.5);
        yCube(shift,shift,5,  -20,s_2-shift*1.5,2.5);
        
        yCube(shift,shift,5,  s_2-shift*1.5,20,2.5);
        yCube(shift,shift,5,  s_2-shift*1.5,s_4-sh3,2.5);
        
        yCube(shift,shift,5,  -s_2+shift*1.5,20,2.5);
        yCube(shift,shift,5,  -s_2+shift*1.5,s_4-sh3,2.5);
        
        //adhesion
        yCube(sh3,15,0.4,    s_2-shift*1.5,-8,0.2);
        yCube(sh3,15,0.4,    -s_2+shift*1.5,-8,0.2);
    }//transform
}//module

//chassis_ski();
module chassis_ski(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){  
        difference(){
            yMinkCubeCyl(202,45,52, 21,     0,0,0,    90,0,0);
            yMinkCubeCyl(200,43,50, 20,     0,0,0,    90,0,0);
            yCube(204,60,50,    0,0,27);
            yCube(204,60,50,    -16,0,7,    0,-2);
            yCube(40,60,40,    85,0,14, 0,45,0);
    
            //bottom weight saving
            yCube(50,20,10,    55,12.5,-20);    
            yCube(50,20,10,    0,12.5,-20);
            yCube(50,20,10,    -55,12.5,-20);
    
            yCube(50,20,10,    55,-12.5,-20);    
            yCube(50,20,10,    0,-12.5,-20);
            yCube(50,20,10,    -55,-12.5,-20);
            
            //front weight saving
            yCube(5,20,10,    90,12.5,-20,  0,-30,0);    
            yCube(5,20,10,    95,12.5,-15,  0,-45,0);    
            yCube(5,20,10,    97,12.5,-8,  0,-60,0);    
    
            yCube(5,20,10,    90,-12.5,-20,  0,-30,0);    
            yCube(5,20,10,    95,-12.5,-15,  0,-45,0);    
            yCube(5,20,10,    97,-12.5,-8,  0,-60,0);    
        }//difference

        //longerons
        yCube(108,2.4,5,   27,0,-20);
        yCube(1.2,52,5,   80.5,0,-20);
        yCube(1.2,52,5,   27.5,0,-20);
        yCube(1,52,3,   -27.5,0,-20);
        
        
        //to chassis connector
        yTube(6,2.4,2.4,    20,0,-14,  90,0,0);
        yTube(4.5,2.4,2.4,  -20,0,-14,  90,0,0);
        yTube(4.5,2.4,2.4,  60,0,-14,  90,0,0);

    }//transform
}//module
