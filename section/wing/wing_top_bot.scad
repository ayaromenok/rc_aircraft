include <../../lib/lib2.scad>
//M190 S20; set hotbed to 20C - add on 10-15 lyaer

//wing_section_200x150mm(nerv_w=1);
//nervure_clark_150mm_v2(ry=-1.8);
//longeron_connector();


//4638mm
module wing_section_200x150mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=0.75){
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
                    import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");                
            
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
        linear_extrude(height = nerv_w*2, center = true, convexity = 10)
        {
            difference(){
                import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");
                offset(-1)
                    import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm");
            }//difference
        }//linear_extrude        
	}//transform
}//module


module longeron_connector(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        h=12.4;
        difference(){
            union(){    
                yCube(19.4,9.4,0.45,  12.5,0,0);
                yCube(19.4,9.4,0.45,  -12.5,0,0);
                yPoly(p=[[1.4,0],[0.38,1],[0.38,h-1],[1.4,h-0.1]], szz=45, px=-22.5, py=-6.2, pz=0.3,ry=90);
            }//union
            yCube(17,7,5,  12.5,0,0);
            yCube(17,7,5,  -12.5,0,0);
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


//mm
nervure_clark_150mm_aeliron2();
module nervure_clark_150mm_aeliron2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, nerv_w=0.75){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        difference(){
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                union(){    
                linear_extrude(height = nerv_w, center = true, convexity = 10)
                    import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron2");                
                linear_extrude(height = nerv_w*3, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron2");
                        offset(-1)
                        import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron2");
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

nervure_clark_150mm_aeliron();
module nervure_clark_150mm_aeliron(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, nerv_w=0.75){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        difference(){
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                union(){    
                linear_extrude(height = nerv_w, center = true, convexity = 10)
                    import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron");                
                linear_extrude(height = nerv_w*3, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron");
                        offset(-1)
                        import(file = "dxf/profile_clark_y_v2.dxf", layer="clark_y_15cm_aeliron");
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
