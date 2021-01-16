include <../../lib/lib2.scad>
include <../../std/sg90.scad>
//M190 S20; set hotbed to 20C - add on 10-15 lyaer

//wing_section_200x150mm_outer();
wing_assembly();
module wing_assembly(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_alu_1000x10x2(-2,0,6.5,    90,0,90);
        
        wing_section_200x150mm_straight(0,125,0);
        wing_section_200x150mm_straight(0,-125,0);
        wing_section_200x150mm_straight(0,325,0);
        wing_section_200x150mm_straight(0,-325,0);
        wing_section_200x150mm_outer(0,525,0);
        wing_section_200x150mm_outer(0,-525,0, my=1);
    }//transform
}//module

module wing_section_200x150mm_outer(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        longeron_central_200mm();
        longeron_central_200mm(h=12.4, -30);
        //front longeron
        yCyl(2.3,200, 39.4,0,1.2,  90,60,0, sx=0.3);
        //back longeron s
        size=3; s_2=size/2; s_4=size/4;
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=175,px=-56,py=100,rx=90);
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=175,px=-56,py=-75, pz=10, rx=-90);
        
        //back longeron
        yCube(4,25,0.7,    -109,-87.5,0);
                
        nervure_clark_y_150mm_outer(0,35);
        nervure_clark_y_150mm_outer(0,-20);
        nervure_clark_y_150mm_outer2(0,98.5);        
        nervure_clark_y_150mm_outer2(0,-75);        
    }//transform
}//module

module wing_section_200x150mm_straight(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_central_200mm();
        longeron_central_200mm(h=12.4, -30);
        //front longeron
        yCyl(2.3,200, 39.4,0,1.2,  90,60,0, sx=0.3);
        //back longeron
        yCube(4,200,0.7,    -109,0,0);
        
        nervure_clark_y_150mm(0,25);
        nervure_clark_y_150mm(0,-25);
        nervure_clark_y_150mm(0,75);        
        nervure_clark_y_150mm(0,-75);
    }//transform
}//module

module nervure_clark_y_150mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=3, off=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        size_supp=2.5;//*2
        difference(){
        translate([40,0,0])       
                rotate([90,0,180])
                union(){    
                    linear_extrude(height = width/3, center = true, convexity = 10)
                        import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_main");                
                    linear_extrude(height = width, center = true, convexity = 10)
                    {
                        difference(){
                            import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_main");
                            offset(-off)
                                import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_main");
                        }//difference
                    }//linear_extrude                    
                }//union
            nervure_cut(15,5.5,     30,0,off);    
            nervure_cut(15,9,       15,0,off);    
            nervure_cut(20,10.5,    -2,0,off);    
            nervure_cut(20,10.2,    -22,0,off);    
            nervure_cut(20,8.5,     -42,0,off);    
            nervure_cut(20,6,       -62,0,off);    
            nervure_cut(20,2.5,     -82,0,off);            
        }//difference        
        
        yCyl(size_supp,8.5, 23.5,0,off, sy=0.4,$fn=6, cnt=false);
        yCyl(size_supp,10, 8,0,off, sy=0.4,$fn=6, cnt=false);
        yCyl(size_supp,11.5, -12,0,off, sy=0.4,$fn=6, cnt=false);
        yCyl(size_supp,10, -32,0,off, sy=0.4,$fn=6, cnt=false);
        yCyl(size_supp,8, -52,0,off, sy=0.4,$fn=6, cnt=false);
        yCyl(size_supp,5, -72,0,off, sy=0.4,$fn=6, cnt=false);
	}//transform
}//module

module nervure_clark_y_150mm_outer(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=3, off=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        difference(){
            nervure_clark_y_150mm();
            yCyl(5,10,  -60,0,4.8,  90,0,0);
            yCube(60,10,10,  -90,0,5);
        }
	}//transform
}//module


module nervure_clark_y_150mm_outer2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=3, off=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){                
        union(){
            nervure_clark_y_150mm();
            difference(){
                yCyl(4.8,width,  -61,0,4.7,  90,0,0);
                yCyl(1.8,width*2,  -61,0,4.7,  90,0,0);
            }
        }//union         
	}//transform
}//module

module nervure_cut(width=10, height=6, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=3){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){       
        h=height;
        h_2=height/2;
        h_4=height/4;
        w_2=width/2;
        w_4=width/4;
        yPoly(p=[[w_2,0],[w_2,h_2],[w_4,h],[-w_4,h], [-w_2,h_2],[-w_2,0]], szz=depth,py=depth/2,rx=90);
    }//transform
}//module

module longeron_alu_1000x10x2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(1000,10,2);
    }//transform
}//module

module longeron_central_200mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, h=13.2, size=4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //yCyl(size/2,length,    0,0,0, 0,-90,90, sx=0.9, $fn=6);
        //yCyl(size/2,length,    0,0,h, 0,90,90, sx=0.9, $fn=3);
        s_2=size/2;
        s_4=size/4;
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=length/2,rx=90);
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=-length/2,pz=h,rx=-90);
        
        translate([0,-length/2,0])
        for (i=[0:47.5:(length)]){
            yCyl(2.5,h, 0,i+5,h/2, sx=0.4,$fn=6);
        }
    }//transform
}//module