include <../../lib/lib2.scad>
    
//chassis_ski();
//chassis_middle_section();
//chassis_assembly();
//chassis_assembly_wheel();
module chassis_assembly(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){          
        chassis_middle_section(0,0,-4, 180,0,0);
        
        chassis_connector_v1_1(106,0,-149);    
        chassis_connector_v1_1(-106,0,-149);
            
        chassis_ski(86,147,-136);
        chassis_ski(-126,147,-136);
        
        chassis_ski(86,-147,-136);
        chassis_ski(-126,-147,-136);
    }//transform
}//module


module chassis_assembly_wheel(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){          
        chassis_middle_section(0,0,-4, 180,0,0);
        
        chassis_connector_v1_1(106,0,-149);    
        chassis_connector_v1_1(-106,0,-149);
            
        chassis_wheel(106,157,-149,  -90,0,0);
        chassis_wheel(-106,157,-149,  -90,0,0);
        
        chassis_wheel(106,-157,-149,  90,0,0);
        chassis_wheel(-106,-157,-149,  90,0,0);
        
        //ammo with spring
        chassis_spring_support_p0(117,121,-44,  90,53,90);
        chassis_spring_support_p1(116,121,-44,  90,53,90);
        
        chassis_spring_support_p0(117,-121,-44,  90,-53,90);       
        chassis_spring_support_p1(116,-121,-44,  90,-53,90);
    }//transform
}//module

//87mm open
//chassis_spring_support_p0();
module chassis_spring_support_p0(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yTube(5,2.4,5,  43.5,0,2.5);        
        yCyl(2,50,  15,0,2,  0,90,0 );
        //yCyl(4,20.5,  25,0,2,  0,90,0, clr="blue" ); //spring
        difference(){
            yCyl(4,6,  37.1,0,2,  0,90,0 );
            yCube(30,10,10, 32.6,0,-5);
        }//difference
    }//transform
}//module

//chassis_spring_support_p1();
module chassis_spring_support_p1(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        yTube(5,2.4,5,  -43.5,0,2.5);
        //yCyl(2,50,  15,0,2,  0,90,0 );
        //yCyl(4,20.5,  25,0,2,  0,90,0, clr="blue" ); //spring
        difference(){
            yTube(4, 2.5,55,  -12.8,0,3,  0,90,0 );
            yCube(60,10,10, -012.8,0,-5);
        }//difference
    }//transform
}//module



//chassis_wheel();
module chassis_wheel(px=0, py=0, pz=0, rx=0, ry=0, rz=0, radius=30, width=20){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){      
        _r=radius;
        _w = width;    
        yTube(_r, _r-0.8, 5,   0,0,(_w/2-2.5));
        yTube(_r, _r-0.45, _w);
        yTube(_r,_r*0.85, 1.2,   0,0,(-_w/2+1.2/2));
        yTube(_r, _r-0.8, 5,   0,0,(-_w/2+2.5));

        yTube(3.3, 2.5, 10,   0,0,-_w/2+5+2);
        yTube(5, 3.3, 14,   0,0,-_w/2+7);    
        for (i=[-0:45:(360)]){
            rotate([0,0,i])
            yCube(_r-4,3,1.1,   _r/2+2,0,(-_w/2+1.1/2));
        }//for
    }//transform
}//module


//chassis_connector_v1_1();
module chassis_connector_v1_1(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
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
module chassis_connector_v1_1_upper(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
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
module chassis_connector_v1_1_middle(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
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
module chassis_connector_v1_1_lower(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
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
module chassis_middle_section(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
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
        yCube(10,10,0.4,    97,38,-4.8);
        yCube(10,10,0.4,    97,-38,-4.8);
        yCube(10,10,0.4,    -97,38,-4.8);
        yCube(10,10,0.4,    -97,-38,-4.8);        
    }//transform
}//module

//chassis_ski();
module chassis_ski(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
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
