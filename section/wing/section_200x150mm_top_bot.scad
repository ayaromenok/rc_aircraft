include <../../lib/lib2.scad>

//v0 - 2400mm - 7.1g //langeron 110mm
//v1 - 1825mm - 5.4g //langeron 110mm
//v2 - 1817mm - 5.4g //langeron 110mm
//v21 - 2730mm - 8.0g//langeron 200mm
//M190 S20; set hotbed to 20C - add on 10-15 lyaer

//wing_section_200x150mm_v1();
//wing_section_200x150mm_v2();
wing_section_200x150mm_v21();

module wing_section_200x150mm_v1(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        _length = 110;
        difference(){
            union(){
                nervure_clark_150mm_v1();
                nervure_clark_150mm_v1(0,50);                
                nervure_clark_150mm_v1(0,-50);
                //nervure_clark_150mm_v1(0,100);
                //nervure_clark_150mm_v1(0,-100);
                //longerons
                //central
                longeron_central_v1(length=_length);
                //yCyl(2,_length,     0,0,10,  90,90,0, sx=2,$fn=3);
                //front
                yCyl(2,_length,     38.2,0,0,  90,-90,0);
                //back
                yCyl(1,_length,     -109.5,0,0,  90,-180,0, sx=3,$fn=3);
            }//union
            yCube(_length*2,_length*2,20, -40,0,-10);
        }//difference
                
	}//transform
}//module

module wing_section_200x150mm_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        _length = 110;
        difference(){
            union(){
                nervure_clark_150mm_v2();
                nervure_clark_150mm_v2(0,50);
                nervure_clark_150mm_v2(0,-50);
                //longerons
                //central
                longeron_central_v2(length=_length);                
                //front
                yCyl(2,_length,     38.2,0,0,  90,-90,0);
                //back
                yCyl(1,_length,     -109.5,0,0,  90,-180,0, sx=3,$fn=3);
            }//union
            yCube(_length*2,_length*2,20, -40,0,-10);
        }//difference
                
	}//transform
}//module

module wing_section_200x150mm_v21(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        _length = 200;
        difference(){
            union(){
                nervure_clark_150mm_v1(0, 25);                
                nervure_clark_150mm_v1(0,75);
                nervure_clark_150mm_v1(0, -25);              
                nervure_clark_150mm_v1(0,-75);
                //nervure_clark_150mm_v1(0,-100);
                //longerons
                //central
                longeron_central_v2(length=_length);
                //yCyl(2,_length,     0,0,10,  90,90,0, sx=2,$fn=3);
                //front
                yCyl(2,_length,     38.2,0,0,  90,-90,0);
                //back
                yCyl(1,_length,     -109.5,0,0,  90,-180,0, sx=3,$fn=3);
            }//union
            yCube(_length*2,_length*2,20, -40,0,-10);
        }//difference
                
	}//transform
}//module

module nervure_clark_150mm_v1(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=0.75, sup_w=2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                linear_extrude(height = nerv_w, center = true, convexity = 10)
                    import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");                
            
        yCyl(2.5,2,  29,0,3.5,  90,0,0,  2);
        yCyl(4.6,2,  12,0,6,  90,0,0,  2);
        yCyl(5.6,2,  -13,0,7,  90,0,0,  2);
        yCyl(5,2,  -36,0,6.3,  90,0,0,  2);
        yCyl(3.6,2,  -56,0,5,  90,0,0,  2);
        yCyl(2.4,2,  -72,0,4,  90,0,0,  2);
        yCyl(1.6,2,  -84,0,3,  90,0,0,  2);
        yCyl(1,2,  -94,0,2,  90,0,0,  3);            
        }//difference
        yCube(150,nerv_w*3,1.1,    -35);        
	}//transform
}//module

module nervure_clark_150mm_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=0.75, sup_w=2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        yCube(150,sup_w,1.1,    -35);
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                linear_extrude(height = sup_w, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                        offset(-1.5)
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                    }//difference
                }//linear_extrude
        yCube(3,0.75,15,   28,0,0);
        yCube(3,0.75,22,   15,0,0);            
        yCube(3,0.75,25,   -25,0,0);        
        yCube(3,0.75,22,   -50,0,0);
        yCube(3,0.75,14,   -75,0,0);        
	}//transform
}//module

module longeron_central_v1(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=210, h=13.7){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yPoly(p=[[0,0],[2,0],[0.38,1],[0.38,h-1],[2,h-0.3], [-3,h],[-0.38,h-1],[-0.38,1],[-3,0]], szz=length, py=length/2,rx=90);
            
            yCyl((h-4)/2,5, 0,h*0.9,h/2,  0,90,0, sy=2.2);
            yCyl((h-4)/2,5, 0,h*2.7,h/2,  0,90,0, sy=2.2);
            
            yCyl((h-4)/2,5, 0,-h*0.9,h/2,  0,90,0, sy=2.2);
            yCyl((h-4)/2,5, 0,-h*2.7,h/2,  0,90,0, sy=2.2);
        }
    }//transform
}//module

module longeron_central_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=210, h=13.7){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yPoly(p=[[0,0],[2,0],[0.38,1],[0.38,h-1],[2,h-0.3], [-3,h],[-0.38,h-1],[-0.38,1],[-3,0]], szz=length, py=length/2,rx=90);            
            yCube(5,20,10,  0,12.5,7);
            yCube(5,20,10,  0,37.5,7);
            yCube(5,20,10,  0,62.5,7);
            yCube(5,20,10,  0,87.5,7);
            
            yCube(5,20,10,  0,-12.5,7);
            yCube(5,20,10,  0,-37.5,7);
            yCube(5,20,10,  0,-62.5,7);
            yCube(5,20,10,  0,-87.5,7);
        }//difference
        
    }//transform
}//module    