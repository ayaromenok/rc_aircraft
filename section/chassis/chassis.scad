include <../../lib/lib2.scad>
    
//chassis_connector();
//chassis_ski();
//chassis_middle_section();
chassis_assembly();
module chassis_assembly(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){          
        
        chassis_middle_section(0,0,-4, 180,0,0);
        
        chassis_connector(100,0,-107,    90,0,90);
        chassis_connector(-100,0,-107,    90,0,-90);
            
        chassis_ski(86,96.2,-95);
        chassis_ski(-126,96.2,-95);
        
        chassis_ski(86,-96.2,-95);
        chassis_ski(-126,-96.2,-95);
    }//transform
}//module

module chassis_middle_section(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){          
        //chassis_connector(100,0,-103,    90,0,90);
        //chassis_connector(-100,0,-103,    90,0,-90);
        
        //to chassis connector    
        yTube(4,2,4,    97,20,0,  0,90,0);
        yTube(4,2,4,    97,-20,0,  0,90,0);
        yTube(4,2,4,    -97,20,0,  0,90,0);
        yTube(4,2,4,    -97,-20,0,  0,90,0);
        
        //main longerons
        yMinkCubeCyl(198,3,5, 1,    0,9.5,-1.5);
        yMinkCubeCyl(198,3,5, 1,    0,-9.5,-1.5);
        
        //"nervures"
        yCube(3,36,5,   97.5,0,-1.5);
        yCube(3,36,5,   -97.5,0,-1.5);
        yCube(3,20,5,   30,0,-1.5);
        yCube(3,20,5,   -30,0,-1.5);
        //to fuselage
        for (i=[-60:30:(90)]){
            yTube(4,2,2,   i,14,-3);
            yTube(4,2,2,   i,-14,-3);
        }//for
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
    }//transform
}//module

module chassis_ski(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){  
        difference(){
            yMinkCubeCyl(202,45,52, 21,     0,0,0,    90,0,0);
            yMinkCubeCyl(200,43,50, 20,     0,0,0,    90,0,0);
            yCube(204,60,50,    0,0,20);
            yCube(204,60,50,    -16,0,7,    0,-2);
            yCube(40,60,40,    87,0,14, 0,45,0);
    
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
        yCube(1,52,5,   27.5,0,-20);
        yCube(1,52,5,   -27.5,0,-20);
        yCube(108,1,5,   27,0,-20);
        
        //to chassis connector
        difference(){
            yCyl(6,2,  20,0,-14,  90,0,0);
            yCyl(2.4,3,  20,0,-14,  90,0,0);
        }//difference

        difference(){
            yCyl(4.5,2,  -20,0,-14,  90,0,0);
            yCyl(2.4,3,  -20,0,-14,  90,0,0);
        }//difference       
  
        difference(){
            yCyl(4.5,2,  60,0,-14,  90,0,0);
            yCyl(2.4,3,  60,0,-14,  90,0,0);
        }//difference       

    }//transform
}//module
