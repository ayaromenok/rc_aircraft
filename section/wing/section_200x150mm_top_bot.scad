include <../../lib/lib2.scad>


wing_section_200x150mm();
module wing_section_200x150mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        _length = 110;
        difference(){
            union(){
                nervure_clark_150mm(nerv_w=1.99, sup_w=5);
                nervure_clark_150mm(0,50, sup_w=3);
                nervure_clark_150mm(0,-50);
                //longerons
                //central
                longeron_central(length=_length);
                //yCyl(2,_length,     0,0,10,  90,90,0, sx=2,$fn=3);
                //front
                yCyl(2,_length,     38.2,0,0,  90,-90,0);
                //back
                yCyl(2,_length,     -108,0,0,  90,-180,0, sx=2,$fn=3);
            }//union
            yCube(_length*2,_length*2,20, -40,0,-10);
        }//difference
                
	}//transform
}//module

module nervure_clark_150mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=0.75, sup_w=2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
        translate([40,0,-5])       
                rotate([90,-1.4,180])
                linear_extrude(height = nerv_w, center = true, convexity = 10)
                    import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");                
            
        yCyl(2.5,2,  29,0,3.5,  90,0,0,  2);
        yCyl(5,2,  12,0,6,  90,0,0,  2);
        yCyl(6,2,  -14,0,7,  90,0,0,  2);
        yCyl(5,2,  -37,0,6,  90,0,0,  2);
        yCyl(4,2,  -56,0,5,  90,0,0,  2);
        yCyl(3,2,  -72,0,4,  90,0,0,  2);
        yCyl(2,2,  -84,0,3,  90,0,0,  2);
        yCyl(1,2,  -94,0,2,  90,0,0,  3);            
        }//difference
        yCube(150,sup_w,0.7,    -35);
	}//transform
}//module
        
module longeron_central(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=210, h=13.7){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yPoly(p=[[0,0],[3,0],[0.38,2],[0.38,h-2],[3,h-0.3], [-3,h],[-0.38,h-2],[-0.38,2],[-3,0]], szz=length, py=length/2,rx=90);
            
            yCyl((h-4)/2,5, 0,h*0.9,h/2,  0,90,0, sy=2.2);
            yCyl((h-4)/2,5, 0,h*2.7,h/2,  0,90,0, sy=2.2);
            
            yCyl((h-4)/2,5, 0,-h*0.9,h/2,  0,90,0, sy=2.2);
            yCyl((h-4)/2,5, 0,-h*2.7,h/2,  0,90,0, sy=2.2);
        }
    }//transform
}//module
    