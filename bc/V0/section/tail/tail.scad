include <../../lib/lib2.scad>
include <../../std/sg90.scad>
include <../../std/engine_A2212.scad>
include <../../std/prop_6035.scad>
//M190 S20; set hotbed to 20C - add on 10-15 lyaer
///*

fuselage_tail_p2();

tailplane_150x100mm(0,-89,0, nerv_w=1.4);//R
tailplane_150x100mm(0,89,0, my=1, nerv_w=1.4);//L
tail_elevator_150x100mm(8,-100,0, nerv_w=1.4); //R
tail_elevator_150x100mm(8,100,0, my=1, nerv_w=1.4);//L

fin_150x100mm(0,0,75,    90,0,0, my=1);
fin_150x100mm(0,0,75,    -90,0,0 );
//*/
/*
longeron_connector(0,-15,0, 0,0,0, h=10);
longeron_connector(0,0,0, 0,0,0, h=10);
longeron_connector(0,15,0, 0,0,0);
longeron_connector(0,30,0, 0,0,0);

yCube(30,2,0.7,     0,-25,-1);
yCube(30,2,0.7,     0,-30,-1);
////*/

module fuselage_tail_p2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])    
    {
        longeron_central(0,0,0, 0,90,90);       
	}//transform
}//module        
        
module fin_150x100mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])
    scale([0.66,0.66,0.5])
    {
        _length = 200;
                nervure_clark_150mm_aeliron2(0, 25,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);                
                nervure_clark_150mm_aeliron2(0,-35,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_fin_150mm(0,75, 2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_fin_150mm(0,-97.5,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                
                //longerons
                //central
                longeron_central(0,0,-0.16,length=_length);
                longeron_central(-47.5,0,-0.13,length=_length, h=10.8);                
                //front
                yCyl(2.5,_length,     39.4,0,0.3,  90,-30,0, sy=0.25);
                
	}//transform
}//module

//43373
module tailplane_150x100mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])
    scale([0.66,0.75,0.66])
    {
        _length = 200;
                nervure_clark_150mm_aeliron2(0, 25,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);                
                nervure_clark_150mm_aeliron2(0,-35,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm(0,75, 2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                nervure_clark_150mm(0,-97.5,2.5, ry=-1.2,sz=0.88, nerv_w=nerv_w);
                
                //longerons
                //central
                longeron_central(0,0,-0.16,length=_length);
                longeron_central(-47.5,0,-0.13,length=_length, h=10.8);                
                //front
                yCyl(2.5,_length,     39.4,0,0.3,  90,-30,0, sy=0.25);
                
	}//transform
}//module


//1712mm
module tail_elevator_150x100mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, nerv_w=1.4, length=164){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])
    scale([0.8,0.75,0.66])    {        
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


//nervure_clark_150mm(0,10,0);
module nervure_clark_fin_150mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, nerv_w=0.75){
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
            
            yCyl(2.3,3,  -59.5,0,-1,  90,0,0, sy=1.5); 
        }//difference
        
        
        translate([40,0,-5])       
        rotate([90,-1.4,180]){
            difference(){
                linear_extrude(height = nerv_w*1.5, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");
                        offset(-1.2)
                            import(file = "../wing/dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");
                    translate([99.5,0,0])
                        circle(2.3);
                    }//difference
                }//linear_extrude        
          }//difference
            
        }//translate
	}//transform
}//module
module longeron_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0, h=13.7){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        scale([0.66,0.75,0.66])
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