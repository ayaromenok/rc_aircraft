include <../../lib/lib2.scad>
include <../../std/sg90.scad>
//M190 S20; set hotbed to 20C - add on 10-15 lyaer


//stabilizer_assembly();
//stab_central_section();
//stab_central_section_support(rx=180);
//stab_v_section_200x105mm_outer();//Right
//stab_v_section_200x105mm_outer(my=1);//Left
//stab_h_section_200x105mm_outer();//Left
//stab_h_section_200x105mm_outer(my=1);//RIght
//stab_h_elevator();
module stabilizer_assembly(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        stab_h_section_200x105mm_outer(0,106,0);
        stab_h_section_200x105mm_outer(0,-106,0, my=1);
        stab_h_elevator(0,106,0);
        stab_h_elevator(0,-106,0, my=1);
        stab_v_section_200x105mm_outer(-11,0,120, 90,0,0);
        stab_v_section_200x105mm_outer(-11,0,120, 90,0,0, mz=1);
        stab_h_elevator(4.5,-6,120, -90,0,-5, my=1);
        stab_central_section();
        stab_central_section_support();
    }//transform
}//module

module stab_central_section_support(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){ 
        yMinkCubeSphere(30,8,3, 1, 43,0,-1);
        yMinkCubeSphere(30,4,3, 1, 43,0,-10, 0,-45,0);
        yMinkCubeSphere(20,4,3, 1, 34,0,-10, 0,-90,0);
    }//transform
}//module
module stab_central_section(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){ 
        //longeron_alu_600x15x2(300,0,10, 90,0,0);
        translate([43,0,0])
        difference(){
            yMinkCubeSphere(54,8,20, 3, 0,0,10);
            yCube(56,2.6,16,  0,0,10);            
            yCyl(6,10,  -15,0,10,  90,22.5,0, $fn=8);
            yCyl(6,10,  0,0,10,  90,22.5,0, $fn=8);            
        }//difference
        yCyl(2,20,  38.5,12,1.8,  90,30, sx=0.5);
        yCyl(2,20,  38.5,-12,1.8,  90,30, sx=0.5);
        
        //vsrtical SG90
        difference(){
            yMinkCubeSphere(44,8,20, 3, 48,0,28);
            sg90_cut(50,0,31, 0,0,180);
            yCyl(5,20,  60,0,27 ,    90);
            yCube(10,2,50,  25,0,28);
        }
        
        difference(){
            union(){    
                //horizontal
                yMinkCubeCyl(5,9,52,  1,  15,0,4.5,  90);        
                yMinkCubeCyl(5,7.5,52,  1,  -22,0,3.75,  90);        
                //vertical
                yMinkCubeCyl(11,9,40, 2.5,   12.5,0,20);
                yMinkCubeCyl(11,7,40, 2.5,   -16,0,20);        
                //fuselage
                yMinkCubeSphere(42,6,20, 1.5, -2,0,10);
            }//union
            
                //horizontal
                longeron_central_80mm(h=9, size=3,  15);
                longeron_central_80mm(h=7.5, size=3,  -22);
                //lighter
                /*
                //back longeron
                yCyl(3.2,30,  10,8,4.5,  00,90,0, $fn=12);
                yCyl(3.2,30,  10,15,4.5,  0,90,0, $fn=12);
                yCyl(3.2,30,  10,22,4.5,  0,90,0, $fn=12);
                yCyl(3.2,30,  10,-8,4.5,  00,90,0, $fn=12);
                yCyl(3.2,30,  10,-15,4.5,  0,90,0, $fn=12);
                yCyl(3.2,30,  10,-22,4.5,  0,90,0, $fn=12);
                //back longeron
                yCyl(2.5,30,  -34,4,3.5,  00,90,0, $fn=12);
                yCyl(2.5,30,  -10,10,3.5,  00,90,0, $fn=12);
                yCyl(2.5,30,  -10,16,3.5,  0,90,0, $fn=12);
                yCyl(2.5,30,  -10,22,3.5,  0,90,0, $fn=12);
                yCyl(2.5,30,  -10,-4,3.5,  00,90,0, $fn=12);
                yCyl(2.5,30,  -10,-10,3.5,  00,90,0, $fn=12);
                yCyl(2.5,30,  -10,-16,3.5,  0,90,0, $fn=12);
                yCyl(2.5,30,  -10,-22,3.5,  0,90,0, $fn=12);
                */
            //vertical    
                longeron_central_80mm(h=5, size=4.2,    12.5,0,59,  rx=90);
                longeron_central_80mm(h=4.5, size=4.2,  -16,0,59,   rx=90);
                longeron_central_80mm(h=5, size=4.2,    12.5,0,59,  rx=-90);
                longeron_central_80mm(h=4.5, size=4.2,  -16,0,59,   rx=-90);
            //
            sg90_cut(-3,-1,4, -90);
            //yCube(50,50,50, 0,0,-25);
        }//difference
        
        //elevator
        //sg90(-3,-1,4, -90);        
        //rudder
        //sg90(50,0,31, 0,0,180);
    }//transform
}//module

module stab_v_section_200x105mm_outer(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        longeron_central_200mm(h=5, size=3,  23.5);
        longeron_central_200mm(h=4.5, size=3,  -5);
        //front longeron
        yCube(3,200,0.7, 39.2,0,0.35);
                        
        nervure_clark_y_105mm_half_outer(0,35);
        nervure_clark_y_105mm_half_outer(0,-20);
        nervure_clark_y_105mm_half_outer(0,98.5);        
        nervure_clark_y_105mm_half_outer(0,-75);   
       
        //rudder holders
        difference(){
            yTube(4,1.8,3, -12,-75,0,  90,0,0);
            yCube(10,5,5, -12,-75,-2.5,  90,0,0);
        }//diff
        yCube(5,3,3, -7,-75,1.5,  0,0,0);
        difference(){
            yTube(4,1.8,3, -12,98.5,0,  90,0,0);
            yCube(10,5,5, -12,98.5,-2.5,  90,0,0);
        }//diff
        yCube(5,3,3, -7,98.5,1.5,  0,0,0);
    }//transform
}//module

module stab_h_elevator(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        longeron_aeliron_170mm(h=6.4,-30.5,12);
        //back longeron
        yCube(4,170,0.7,    -64,12,0.35);        
                            
        nervure_clark_y_105mm_aeliron(0,35);
        nervure_clark_y_105mm_aeliron(0,-20);
        nervure_clark_y_105mm_aeliron(0,95.5);
        nervure_clark_y_105mm_aeliron(0,-72);
        
        //driver
        difference(){
            yCyl(1.5,19,  -28,-72,14.5, sx=2,$fn=4);        
            yCyl(0.7,10,   -28,-72,10, 90);
            yCyl(0.7,10,   -28,-72,13, 90);
            yCyl(0.7,10,   -28,-72,16, 90);
            yCyl(0.7,10,   -28,-72,19, 90);
            yCyl(0.7,10,   -28,-72,22, 90);            
        }//diff
    }//transform
}//module


module stab_h_section_200x105mm_outer(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        longeron_central_200mm(h=9, size=3,  15);
        longeron_central_200mm(h=7.5, size=3,  -22);
        //front longeron
        yCyl(1.7,200, 39.6,0,0.9,  90,60,0, sx=0.3);
                        
        nervure_clark_y_105mm_outer(0,35);
        nervure_clark_y_105mm_outer(0,-20);
        nervure_clark_y_105mm_outer2(0,98.5);        
        nervure_clark_y_105mm_outer2(0,-75);                
    }//transform
}//module


module nervure_clark_y_105mm_half_outer(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=2.5, off=1.1){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        size_supp=1.75;//*2
        difference(){
        translate([40,0,0])       
                rotate([90,0,180])
                union(){    
                    linear_extrude(height = width/3, center = true, convexity = 10)
                        scale([0.7,0.5,0.7])
                        import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_stab_vert2");                
                    linear_extrude(height = width, center = true, convexity = 10)
                    {
                        difference(){
                            scale([0.7,0.5,0.7])
                            import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_stab_vert2");
                            offset(-off)
                                scale([0.7,0.5,0.7])
                                import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_stab_vert2");
                        }//difference
                    }//linear_extrude                    
                }//union
            nervure_cut(15,2,       30,0,off);    
            nervure_cut(15,3.5,    15,0,off);    
            nervure_cut(13,3,    1.5,0,off);    
        }//difference   
        yCyl(size_supp,4, 23.5,0,off, sy=0.4,$fn=6, cnt=false);
        yCyl(size_supp,4, 8,0,off, sy=0.4,$fn=6, cnt=false);               
	}//transform
}//module

module nervure_clark_y_105mm_aeliron(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=2.5, off=1.1){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        union(){
            difference(){
                nervure_clark_y_105mm();
                yCube(100,10,20,  22,0,4.5);
            }//difference
            difference(){
                yCyl(3.5,width,  -28,0,3.5,  90,0,0);
                yCyl(1.6,width*2,  -28,0,3.5,  90,0,0);
            }//difference
        }//union 
	}//transform
}//module

//nervure_clark_y_105mm();
module nervure_clark_y_105mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=2.5, off=1.1){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        size_supp=1.75;//*2
        difference(){
        translate([40,0,0])       
                rotate([90,0,180])
                union(){    
                    linear_extrude(height = width/3, center = true, convexity = 10)
                        scale([0.7,0.7,0.7])
                        import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_main");                
                    linear_extrude(height = width, center = true, convexity = 10)
                    {
                        difference(){
                            scale([0.7,0.7,0.7])
                            import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_main");
                            offset(-off)
                                scale([0.7,0.7,0.7])
                                import(file = "../dxf/profile_clark_y.dxf", layer="clark_y_main");
                        }//difference
                    }//linear_extrude                    
                }//union
            nervure_cut(15,3.8,    30,0,off);    
            nervure_cut(15,6.5,    15,0,off);    
            nervure_cut(15,6.5,    0.5,0,off);    
            nervure_cut(15,5.9,    -14,0,off);    
            nervure_cut(15,4,      -29,0,off);    
            nervure_cut(15,1.3,    -44,0,off);                
        }//difference        
        
        yCyl(size_supp,6.5, 23.5,0,off, sy=0.6,$fn=6, cnt=false);
        yCyl(size_supp,8, 8,0,off, sy=0.6,$fn=6, cnt=false);
        yCyl(size_supp,8, 15,0,off, sy=0.6,$fn=6, cnt=false);
        yCyl(size_supp,7, -7,0,off, sy=0.6,$fn=6, cnt=false);
        yCyl(size_supp,6, -22,0,off, sy=0.6,$fn=6, cnt=false);
        yCyl(size_supp,3.5, -37,0,off, sy=0.6,$fn=6, cnt=false);        
       
	}//transform
}//module


module nervure_clark_y_105mm_outer(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=3, off=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){        
        difference(){
            nervure_clark_y_105mm();
            yCyl(3.5,10,  -27,0,3.5,  90,0,0);
            yCube(60,10,10,  -57,0,4.9);
        }//diff
	}//transform
}//module

//nervure_clark_y_105mm_outer2();
module nervure_clark_y_105mm_outer2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, width=3, off=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){                
        union(){
            difference(){
                nervure_clark_y_105mm();
                yCube(60,10,10,  -58,0,4.5);
            }//difference
            difference(){
                yCyl(3.5,width,  -28,0,3.5,  90,0,0);
                yCyl(1.8,width*2,  -28,0,3.5,  90,0,0);
            }//difference
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


module longeron_aeliron_170mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=170, h=7.2, size=2.5){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        s_2=size/2;
        s_4=size/4;
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=length/2,rx=90);
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=-length/2,pz=h,rx=-90);
        
        translate([0,-length/2,0])
        for (i=[0:57:(length)]){
            yCyl(2.5,h, 0,i+25,h/2, sx=0.4,$fn=6);
        }
    }//transform
}//module


module longeron_alu_600x15x2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, nerv_w=1.4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(600,15,2);
    }//transform
}//module


module longeron_central_80mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=80, h=13.2, size=4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //yCyl(size/2,length,    0,0,0, 0,-90,90, sx=0.9, $fn=6);
        //yCyl(size/2,length,    0,0,h, 0,90,90, sx=0.9, $fn=3);
        s_2=size/2;
        s_4=size/4;
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=length/2,rx=90);
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=-length/2,pz=h,rx=-90);
        
        translate([0,-length/2,0])
        for (i=[0:35:(length)]){
            yCyl(2.5,h, 0,i+5,h/2, sx=0.4,$fn=6);
        }
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
        for (i=[0:52:(length)]){
            yCyl(2.5,h, 0,i+5,h/2, sx=0.4,$fn=6);
        }
    }//transform
}//module
