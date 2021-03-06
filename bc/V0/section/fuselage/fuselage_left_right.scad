include <../../lib/lib2.scad>
include <../../std/sg90.scad>
include <../../std/engine_A2212.scad>
include <../../std/prop_6035.scad>
//M190 S20; set hotbed to 20C - add on 10-15 lyaer


wing_upper();
//wing_section_200x150mm_central(0,120,-100.5, 0,-5,0);
//wing_section_200x150mm_central(0,-120,-100.5, 0,-5,0);

fuselage_central_simple();
fuselage_central_simple_bottom();


//wing_section_200x150mm_central(0,0,0);
//fuselage_central_simple(is_print=true, is_left=false, rx=-90);    //right
//fuselage_central_simple(is_print=true, is_left=true, rx=90);     //left
//connectors
//fuselage_tail_connectors();
//fuselage_centralplane_arc_print();
module fuselage_central_simple_bottom(px=0, py=0, pz=0, rx=0, ry=0, rz=0, is_print=false, is_left=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yMinkCubeSphere(100,40,30,6.8,    -10,20,-100, sx=1);
        yMinkCubeSphere(40,160,10,4.9,    -24,110,-110, sx=1);
        //wing support
        yMinkCubeSphere(10,200,2,0.95,    -10,120,-60, 30,0,0);
        yMinkCubeSphere(10,240,2,0.95,    -10,290,-60, 23,0,0);
        yMinkCubeSphere(10,200,2,0.95,    -40,120,-60, 30,0,0);
        yMinkCubeSphere(10,240,2,0.95,    -40,290,-60, 23,0,0);
        
        yCyl(30,10, -150,100,-140, 90,0,0);
        yCyl(30,10, 150,0,-140, 90,0,0);
        
    }//transform
}//module
module wing_upper(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //cantral section
        scale([1,0.5,1])
            wing_section_200x150mm_central(0,0,-7.5, 0,-5,0);
        wing_section_200x150mm_central(0,150,-7.5, 0,-5,0);
        wing_section_200x150mm_central(0,-150,-7.5, 0,-5,0);
        wing_section_200x150mm_central(0,350,-7.5, 0,-5,0);
        wing_section_200x150mm_central(0,-350,-7.5, 0,-5,0);
        
        //aeliron section
        wing_section_200x150mm_aeliron(0,-561,-7.5, 0,-5,0,nerv_w=1.4); //R
        wing_section_200x150mm_aeliron(0,566,-7.5, 0,-5,0, my=1, nerv_w=1.4);//L
        wing_section_200x150mm_aeliron2(0,-550,-7.5, 0,-5,0,nerv_w=1.4);//R
        wing_section_200x150mm_aeliron2(0,550,-7.5, 0,-5,0, my=1, nerv_w=1.4);//L
    }//transform
}//module

module fuselage_tail(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_central(-200,10,0, 0,0,92.3,length=200);
        longeron_central(-200,-10,0, 0,0,87.7,length=200);
        
        fuselage_profile_tail(-125,0,0, scale=0.67);
        fuselage_profile_tail(-175,0,0, scale=0.58);
        fuselage_profile_tail(-225,0,0, scale=0.49, depth=4);
        fuselage_profile_tail(-275,0,0, scale=0.4);
        yCube(2,2,30,  -299,0,15);
    }//transform
}//module

module fuselage_central_back(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_central(-200,18,0, 0,0,92.3,length=200);
        longeron_central(-200,-18,0, 0,0,87.7,length=200);
        
        fuselage_profile_tail(-125,0,0, depth=4);
        fuselage_profile_tail(-175,0,0, scale=0.92);
        fuselage_profile_tail(-225,0,0, scale=0.83);
        fuselage_profile_tail(-275,0,0, scale=0.75, depth=4);
        yCube(2,2,30,  -299,0,15);
    }//transform
}//module

module fuselage_centralplane_arc_print(){
    union(){
        fuselage_centralplane_arc(75, rx=-90);
        yCyl(1.8,2,  -32,-24.5,-0, 0,0,0);
        ySphere(1,  -32,-24.5,1, 0,0,0);
        yCyl(1.8,2,  -14,-72,-0, 0,0,0);
        ySphere(1, -14,-72,1, 0,0,0);
        yCyl(1.8,2,  -5,-65,-0, 0,0,0);
        ySphere(1, -5,-65,1, 0,0,0);
    }//union
    union(){
        fuselage_centralplane_arc(-75,rx=-90,mx=1);
        difference(){
            yCyl(1.8,2,  32,-24.5,-0, 0,0,0);
            ySphere(1.4,  32,-24.5,1, 0,0,0);
        }//diff
        difference(){
            yCyl(1.8,2,  14,-72,-0, 0,0,0);
            ySphere(1.4,  14,-72,1, 0,0,0);
        }//diff
        difference(){
            yCyl(1.8,2,  5,-65,-0, 0,0,0);
            ySphere(1.4,  5,-65,1, 0,0,0);
        }//diff
    }//union
}//module

module fuselage_centralplane_arc(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0,mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx, my,mz]){
        difference(){
            translate([0,2,-10])
            rotate([0,-13,0])
            difference(){ 
                yArc(102,[-7,25], 17, 2,  -10,0,0,  90,0,0);    
                for (i=[0:3:20]){
                    rotate([0,-i,0])
                    translate([-96,0,0])
                        yCyl(1.8,50,  -10,0,0, 90,0,0);
                }//for
                for (i=[1.5:3:18]){
                    rotate([0,-i,0])
                    translate([-90,0,0])
                        yCyl(1.8,50,  -10,0,0, 90,0,0);
                }//for
            }//difference
            
            translate([40,0,-5])       
            rotate([90,9,180])
                linear_extrude(height = 4.4, center = true, convexity = 10)
               offset(0.4)
                import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm"); 
        }//difference        
    }//transform
}//module        


module fuselage_central_simple(px=0, py=0, pz=0, rx=0, ry=0, rz=0, is_print=false, is_left=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //main
        difference(){
            union(){
                difference(){
                    union(){
                        yMinkCubeCyl(20,16,93,7,    -10,0,-37, 0,0,0, sx=5.3);
                        yMinkCubeSphere(25,16,30,6.8,    30,0,-21, sx=2.4);                
                        yMinkCubeSphere(120,40,4, 1.5,  -10,0,-84);    
                    }//union
                    //vertical holes
                    yCyl(6,102,  20,0,-60, sx=2.7);//eng
                    yCyl(6.5,102,  -23.5,0,-49, sx=3);//wing
                    yCyl(4,102,  -53,0,-62, sx=1);//tail
                    //output to servo            
                    yCyl(6.5,102,  -23.5,0,-4, 90,-5,sx=3); //wing
                    yCyl(6,20,  50,0,-20);                  //engine    
                    yCyl(6,24,  40,0,-24,   0,60,0, sx=1.6);//engine
                    yCyl(5,100,    -50,0,-30,  0,90,0 );//rail
            
                    //longerons cut
                    yCube(4.4,30,17.1,  38.8,0,4,  0,-5,0);
                    yCube(4.4,30,19.1,  -0.7,0,1,  0,-5,0);
                    yCube(4.4,30,22.4,  -48.2,0,-1.5,  0,-5,0);            
                    //top side as a wing
                    difference(){
                        yCube(140,80,30,   0,0,6.6, 0,-5,0);
        
                        translate([40,0,-5])       
                        rotate([90,5,180])
                            linear_extrude(height = 100, center = true, convexity = 10)
                            import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm"); 
                    }//diff
                    // engine cuts
                    yCyl(14.6,20, 57.2,0,0,   0,90,0);    
                    yCyl(5,40, 27.2,-9,-5,   0,90,10);    
                    yCyl(5,40, 27.2,9,-6,   0,90,-10);                
            
                    //holes at teh bottom
                    yCyl(2.4,30, 45,15,-92);
                    yCyl(2.4,30, 30,15,-92);            
                    yCyl(2.4,30, 10,15,-92);
                    yCyl(2.4,30, -10,15,-92);
                    yCyl(2.4,30, -30,15,-92);
                    yCyl(2.4,30, -50,15,-92);
                    yCyl(2.4,30, -65,15,-92);
            
                    yCyl(2.4,30, 45,-15,-92);
                    yCyl(2.4,30, 30,-15,-92);
                    yCyl(2.4,30, 10,-15,-92);
                    yCyl(2.4,30, -10,-15,-92);            
                    yCyl(2.4,30, -30,-15,-92);
                    yCyl(2.4,30, -50,-15,-92);
                    yCyl(2.4,30, -65,-15,-92);            
                }//diff
  
                //engine connector
                translate([-23.5,0,-58])
                difference(){    
                    yCyl(14,6, 68,0,58,   0,90,0);
            
                    translate([77,0,58])
                    rotate([45,0,0])
                    rotate([0,90,0]){
                        //holes
                        yCyl(1.9,10,  9.2,0,-10); 
                        yCyl(1.9,10,  -9.2,0,-10); 
                        yCyl(1.9,10,  0,7.7,-10); 
                        yCyl(1.9,10,  0,-7.7,-10); 
                        ///central hole
                        yCyl(4,10,  0,0,-10);
                        //for hiding nuts
                        yCyl(3.9,7,  9.2,0,-11.5); 
                        yCyl(3.9,7,  -9.2,0,-11.5); 
                        yCyl(3.9,7,  0,7.7,-11.5); 
                        yCyl(3.9,7,  0,-7.7,-11.5);                                 
                    }//translate
                    translate([77,0,58])
                    rotate([0,90,0]){
                        //holes
                        yCyl(8,10,  17,0,-10); 
                        yCyl(8,10,  -17,0,-10); 
                        yCyl(8,10,  0,17,-10); 
                        yCyl(8,10,  0,-17,-10); 
                    }//translate            
                }//diff
            }//union
            //cut section
            if (is_print){
                if (is_left){
                    yCube(200,50,200,   0,-25,0);
                    //holes for M3
                    yCyl(1.9,20,    20,0,3,  90,0,0);
                    yCyl(3.6,5,    20,7,3,  90,0,0);
            
                    yCyl(1.9,20,    0,0,-45,  90,0,0);
                    yCyl(3.6,5,     0,7,-45,  90,0,0);
            
                    yCyl(1.9,20,    -47,0,-20,  90,0,0);
                    yCyl(3.6,5,     -47,6,-20,  90,0,0);
            
                    yCyl(1.9,20,    -47,0,-40,  90,0,0);
                    yCyl(3.6,5,     -47,6,-40,  90,0,0);
                } else {
                    yCube(200,50,200,   0,25,0);
                    //holes for M3
                    yCyl(1.9,20,    20,0,3,  90,0,0);
                    yCyl(3.6,5,    20,-7,3,  90,0,0);
            
                    yCyl(1.9,20,    0,0,-45,  90,0,0);
                    yCyl(3.6,5,     0,-7,-45,  90,0,0);
                
                    yCyl(1.9,20,    -47,0,-20,  90,0,0);
                    yCyl(3.6,5,     -47,-6,-20,  90,0,0);
            
                    yCyl(1.9,20,    -47,0,-40,  90,0,0);
                    yCyl(3.6,5,     -47,-6,-40,  90,0,0);
                }//if is_left
            }//is_print
        }//diff
        
        
        
        
        
        //chassis - use as separate part
        //yMinkCubeCyl(45,20,40,7,    -10,0,-92, 90,0,0, sx=3);           
        //yCyl(2,80, -70,0,-100, 90,0,0,sx=3);        
        /*
        yCyl(6,14, -70,-68,-100, 90,0,0);        
        yCyl(6,14, -70,68,-100, 90,0,0);        
        yMinkCylSphere(3,60,2,  -70,45,-92, 75,sx=3);
        yMinkCylSphere(3,60,2,  -70,-45,-92, -75,sx=3);
        yMinkCylSphere(3,41,2,  -70,0,-84.4, 90,sx=3);
        
        yCyl(6,14, 100,-38,-100, 90,0,0);        
        yCyl(6,14, 100,38,-100, 90,0,0);        
        yMinkCylSphere(3,30,2,  100,25,-92, 60,sx=3);
        yMinkCylSphere(3,30,2,  100,-25,-92, -60,sx=3);
        yMinkCylSphere(3,31,2,  100,0,-85.4, 90,sx=3);
        yMinkCylSphere(3,68,2,  70,0,-84.4, 92,0,90,sx=3);
        */
    }//transform
}//module

module fuselage_central(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
        translate([40,0,-5])       
        rotate([90,9,180])
            linear_extrude(height = 2, center = true, convexity = 10)
            import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm"); 
        translate([40,50,-5])       
        rotate([90,9,180])
            linear_extrude(height = 2, center = true, convexity = 10)
            import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm"); 
        
        yCyl(3,40, -0,53,-15, 0,0,0,sx=3);
        engine_A2212(60,0,0, 0,90,0);
        prop_6035(80,0,0, 0,90,0);
        
        //main
        difference(){
            yCyl(10,80, 0,0,-70, sx=5);
            yCyl(8,82, 0,0,-70, sx=5);
        }
        //wing support
        //front
        yCyl(5,100, -0,0,-30, 90,0,0,sx=3);
        //back
        difference(){
            yCube(100,2,10, -60,0,-37);
            yCyl(1.8,50,  -96.3,0,-37, 90,0,0);
            yCyl(1.8,50,  -102.4,0,-37, 90,0,0);    
        }//difference
        fuselage_centralplane_arc();  
        
        //main rotation axis
        yCyl(1.8,120,  0,0,-30, 90,0,0);
        
        
        //chassis
        yCyl(5,160, -50,0,-100, 90,0,0,sx=3);
        yCyl(5,80, 50,0,-100, 90,0,0,sx=3);
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

module fuselage_tail_connectors(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_connector();
        longeron_connector(0,-20);
        longeron_connector(0,20);
        longeron_connector(0,-40);
        yCube(45,4,0.8, 0,35,-1.6);
        yCube(45,4,0.8, 0,45,-1.6);
    }//transform
}//module
//4335mm
//4952mm
module wing_section_200x150mm_central(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        _length = 200;
                nervure_clark_150mm(0, 25,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);                
                nervure_clark_150mm(0,75, 2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm(0,-25,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm(0,-75,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                //nervure_clark_150mm_aeliron2(0,0,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);              
                //longerons
                //central
                longeron_central(0,0,-0.16,length=_length);
                longeron_central(-47.5,0,-0.13,length=_length, h=10.8);
                //yCyl(2,_length,     0,0,10,  90,90,0, sx=2,$fn=3);
                //front
                yCyl(2.5,_length,     39.4,0,0.3,  90,-30,0, sy=0.25);
                //back
                yCyl(0.6,_length,     -110.5,0,-0.6,  90,-187,0, sx=5,$fn=3);
                
	}//transform
}//module

//43373
module wing_section_200x150mm_aeliron2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        _length = 200;
                difference(){
                    union(){
                        nervure_clark_150mm_aeliron2(0, 25,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                        yCube(32,2,14,  -18,25,6);    
                    }//union
                    sg90_cut(-18,30,6  ,90,0,0);
                }//difference
                nervure_clark_150mm_aeliron2(0,-25,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm(0,75, 2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm(0,-97.5,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                //nervure_clark_150mm_aeliron2(0,0,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);              
                //longerons
                //central
                longeron_central(0,0,-0.16,length=_length);
                longeron_central(-47.5,0,-0.13,length=_length, h=10.8);
                //yCyl(2,_length,     0,0,10,  90,90,0, sx=2,$fn=3);
                //front
                yCyl(2.5,_length,     39.4,0,0.3,  90,-30,0, sy=0.25);
                //back
                yCyl(0.6,25,     -110.5,87.5,-0.6,  90,-187,0, sx=5,$fn=3);
                //sg90(-18,30,6  ,90,0,0);                
	}//transform
}//module


//1712mm
module wing_section_200x150mm_aeliron(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, nerv_w=1.4, length=164){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){        
                nervure_clark_150mm_aeliron(0, (length/10),2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm_aeliron(0, (length/5+length/10),2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm_aeliron(0, (2*length/5+length/10),2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm_aeliron(0, (-length/10),2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm_aeliron(0, (-length/5-length/10),2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm_aeliron(0, (-2*length/5-length/10),2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                
                //nervure_clark_150mm_aeliron2(0,0,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);              
                
                //longerons                
                //front
                //yCyl(2.5,164,     -57,-11.2,0.3,  90,-30,0, sy=0.25);
                //back
                yCyl(0.6,164,     -110.5,-0,-0.6,  90,-187,0, sx=5,$fn=3);
                //center
                //yCube(1.4,164,10,     -64,-11.2,4);
                longeron_aileron(-64,0,-0.1,length=length, h=8);    
                
	}//transform
}//module

//483mm
//nervure_clark_150mm(0,10,0);
module nervure_clark_150mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, nerv_w=0.75){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        difference(){
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                linear_extrude(height = nerv_w, center = true, convexity = 10)
                    import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");                
            
            yCyl(4,2,  29,0,1.5,  90,0,0,  1.5);
            yCyl(6,2,  12,0,4,  90,0,0,  1.5);
            yCyl(7,2,  -12,0,5,  90,0,0,  1.5);
            yCyl(6,2,  -39,0,5,  90,0,0,  2.2);  
            yCyl(2.9,2,  -72,0,3.3,  90,0,0,  2);
            yCyl(1.6,2,  -86,0,2,  90,0,0,  3);
        
            yCube(12,2,20,  28.7,0,-8.5, 0,1.8);
            yCube(18,2,20,  11.7,0,-6, 0,1.8);
            yCube(21,2,20,  -12.3,0,-5, 0,1.8);
            yCube(26.2,2,20,  -39,0,-5, 0,1.8);        
            yCube(11.7,2,20,  -72.3,0,-6.7, 0,1.8);
            yCube(9.6,2,20,  -86.3,0,-8, 0,1.8);          
            
            yCyl(2.3,3,  -59.5,0,3.8,  90,0,0); 
        }//difference
        
        translate([40,0,-5])       
        rotate([90,-1.4,180])
        linear_extrude(height = nerv_w*1.5, center = true, convexity = 10)
        {
            difference(){
                import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");
                offset(-1.2)
                    import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");
            }//difference
        }//linear_extrude        
	}//transform
}//module

//longeron_connector(-47,100,6, 90,0,90, h=10);
//longeron_connector(-47,100,26, 90,0,90);
module longeron_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0, h=13.7){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
        difference(){
            union(){    
                //yCube(19.4,9.4,0.45,  12.5,0,0);
                //yCube(19.4,9.4,0.45,  -12.5,0,0);
                yPoly(p=[[2.4,0],[0.38,1],[0.38,h-1],[2.4,h-0.1]], szz=45, px=-22.5, py=-6.2, pz=0.3,ry=90);
            }//union
            yCube(14,h/2,5,  14.5,0,0);
            yCube(14,h/2,5,  -14.5,0,0);
            yCyl(2.8,h*2, -2.5,0,0, 90,90,0, sx=0.4,$fn=6);        
            yCyl(2.8,h*2, 2.5,0,0, 90,90,0, sx=0.4,$fn=6);        
        }//difference
      
	}//transform
}//module



module longeron_central(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, h=13.7){
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

module longeron_aileron(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, h=13.7){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCyl(2.5,length,    0,0,0, 0,-90,90, sx=0.7, $fn=3);
        yCyl(2.5,length,    0,0,h, 0,90,90, sx=0.7, $fn=3);
        
        yCyl(2.5,h, 0,0,h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,(length/5),h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,(2*length/5),h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,-(length/5),h/2, , sx=0.4,$fn=6);        
        yCyl(2.5,h, 0,-(2*length/5),h/2, , sx=0.4,$fn=6);
    }//transform
}//module 

//mm
//nervure_clark_150mm_aeliron2();
module nervure_clark_150mm_aeliron2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, nerv_w=0.75){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        difference(){
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                union(){    
                linear_extrude(height = nerv_w, center = true, convexity = 10)
                    import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron2");                
                linear_extrude(height = nerv_w*1.5, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron2");
                        offset(-1)
                        import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron2");
                    }//difference
                }//linear_extrude                    
                }//union
            
        yCyl(4,2,  29,0,1.5,  90,0,0,  1.5);
        yCyl(6,2,  12,0,4,  90,0,0,  1.5);
        yCyl(7,2,  -12,0,5,  90,0,0,  1.5);
        yCyl(6,2,  -38,0,5,  90,0,0,  2.0);
        
        yCube(11.8,2,6,  28.9,0,-0.7, 0,1.8);
        yCube(17.8,2,7,  11.9,0,0.2, 0,1.8);
        yCube(20.8,2,8,  -12.1,0,1.3, 0,1.8);
        yCube(24,2,7,  -38.1,0,1.4, 0,1.8);        
            
        yCyl(7,3,  -59.5,0,3.8,  90,0,0);    
        }//difference
        
	}//transform
}//module

//nervure_clark_150mm_aeliron();
module nervure_clark_150mm_aeliron(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, nerv_w=0.75){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        difference(){
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                union(){    
                    linear_extrude(height = nerv_w, center = true, convexity = 10)
                        import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron");                
                    linear_extrude(height = nerv_w*1.5, center = true, convexity = 10)
                    {
                        difference(){
                            import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron");
                            offset(-1)
                                import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron");
                        }//difference
                    }//linear_extrude                    
                }//union
            
        
            yCyl(2.9,2,  -72,0,3.3,  90,0,0,  2);
            yCyl(1.6,2,  -86,0,2,  90,0,0,  3);
        
            yCube(11.5,2,5,  -72,0,1.25, 0,1.8);
            yCube(9.6,2,3.2,  -86.3,0,0.7, 0,1.8);   
            
            yCyl(2.3,3,  -59.5,0,3.8,  90,0,0);    
                
        }//difference
        
	}//transform
}//module
