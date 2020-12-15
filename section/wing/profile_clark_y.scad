include <../../lib/lib2.scad>
include <../../std/sg90.scad>
include <longeron_275mm.scad>

//15cm
//nervure_clark_150mm_std();
//nervure_clark_150mm_std(pz=0,rz=180,mx=1);
//nervure_clark_150mm_support();
//nervure_clark_150mm_support(pz=0,rz=180,mx=1);
nervure_clark_150mm_std_aileron(0,5);
nervure_clark_150mm_std_aileron(py=-5, pz=0,rz=180,mx=1);


module nervure_clark_150mm_std(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, h=1.2, w=1.2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])
    {
        difference(){
            union(){        
                translate([0,0,h-0.2])
                linear_extrude(height = h*2, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                        offset(-0.45)
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                    }//difference
                }//linear_extrude
                
                translate([0,0,-h/2+0.2])
                linear_extrude(height = 0.4, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                        offset(-2.0)
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                    }//difference
                }//linear_extrude
                yCube(4,3,0.7,  2.6, 4.8,-0.25,    0,0,22);
                yCube(4,4,0.7,  45,2.2,-0.25,    0,0,90);
                yCube(4,4,0.7,  20.3,13.1,-0.25,    0,0,12);
                yCube(4,4,0.7,  45,15.5,-0.25,    0,0,90);                
                yCube(3,0.7,2.4,  140,2.5,1,    0,0,90);
            }//union
        
            longeron_T_275mm_cut(0.7, 4.1,0,  -22,90,0);
            longeron_T_275mm_cut(45,0.5,0,  -90,90,0);
            longeron_T_275mm_cut(20,14.9,0, 78,90,0);
            longeron_T_275mm_cut(45,17.5,0,  90,90,0);    
            
            longeron_I_275mm_cut(149, 1.2,0,  90,90,0);
        }//difference
        
        
        //internal support - w - width 
        difference(){
            union(){
                yCube(17,0.7,h*2,  43,9,h/2,    0,0,90);
                yCube(17,0.7,h*2,  47,9,h/2,    0,0,90);
                yCyl((4+w),h*3,   45,9,h*1);
            }//union
            yCyl(4.2,20,    45,9,0);
        }//difference        
        
        yCube(w,17,0.7,   19.6,8,-0.25,   0,0,-30);
        yCube(w,17.5,0.7,   78,8.4,-0.25,   0,0,30);
        yCube(w,11.5,0.7,   105,5.9,-0.25,   0,0,-30);
        
        
        //sg90(67,8,0);
	}//transform
}//module


module nervure_clark_150mm_support(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, h=1.2, w=1.2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])
    {
        difference(){
            union(){        
                translate([0,0,h*2-0.2])
                linear_extrude(height = h*4, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                        offset(-1.6)
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                    }//difference
                }//linear_extrude
                
                translate([0,0,-h/2+0.4])
                linear_extrude(height = 0.8, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                        offset(-2.0)
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
                    }//difference
                }//linear_extrude
                yCube(4,3,0.7,  2.6, 4.8,-0.25,    0,0,22);
                yCube(4,4,0.7,  45,2.2,-0.25,    0,0,90);
                yCube(4,4,0.7,  20.3,13.1,-0.25,    0,0,12);
                yCube(4,4,0.7,  45,15.5,-0.25,    0,0,90);                
                yCube(3,0.7,2.4,  140,2.5,1,    0,0,90);
            }//union
        
            longeron_T_275mm_cut(0.7, 4.1,0,  -22,90,0);
            longeron_T_275mm_cut(45,0.5,0,  -90,90,0);
            longeron_T_275mm_cut(20,14.9,0, 78,90,0);
            longeron_T_275mm_cut(45,17.5,0,  90,90,0);    
            
            longeron_I_275mm_cut(149, 1.2,0,  90,90,0);
        }//difference
        
        
        //internal support - w - width 
        difference(){
            union(){
                yCube(17,2,h*4,  42,9,h*1.5,    0,0,90);
                yCube(17,2,h*4,  48,9,h*1.5,    0,0,90);
                yCyl((4+w),h*9,   45,9,h*4);
            }//union
            yCyl(4.2,h*20,    45,9,0);
        }//difference        
        
        yCube(w,17,0.7,   19.6,8,-0.25,   0,0,-30);
        yCube(w,17.5,0.7,   78,8.4,-0.25,   0,0,30);
        yCube(w,11.5,0.7,   105,5.9,-0.25,   0,0,-30);
        
        //support main
        difference(){
            yCyl(4,5,  45,-20,1.9);
            yCyl(2.3,7,  45,-20,2.5);
        }//diff
        yCube(19,2,h*4,  42,-9,h*1.5,    0,0,90);
        yCube(19,2,h*4,  48,-9,h*1.5,    0,0,90);
        
        yCube(29,1.4,h*2,  32,-9.7,h/2,    0,0,-45);
        yCube(29,1.4,h*2,  58,-9.7,h/2,    0,0,45);
        
        
        //support main
        translate([70,1,0]){
            difference(){
                yCyl(4,5,  45,-20,1.9);
                yCyl(2.3,7,  45,-20,2.5);
            }//diff
            yCube(19,2,h*2,  42,-9,h/2,    0,0,90);
            yCube(19,2,h*2,  48,-9,h/2,    0,0,90);
        
            yCube(29,1.4,h*2,  32,-9.7,h/2,    0,0,-45);
            yCube(29,1.4,h*2,  58,-9.7,h/2,    0,0,45);
        }//translate
	}//transform
}//module


module nervure_clark_150mm_std_aileron(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0, h=1.2, w=1.2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])
    {
        difference(){
            union(){        
                translate([0,0,h-0.2])
                linear_extrude(height = h*2, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm_aeliron");
                        offset(-0.45)
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm_aeliron");
                    }//difference
                }//linear_extrude
                
                translate([0,0,-h/2+0.2])
                linear_extrude(height = 0.7, center = true, convexity = 10)
                {
                    difference(){
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm_aeliron");
                        offset(-3.0)
                        import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm_aeliron");
                    }//difference
                }//linear_extrude
                
            }//union
            //longeron_T_275mm_cut(94.25, 6.1,0,  0,90,0);
            //longeron_T_275mm_cut(100,1.0,0,  -90,90,0);            
            //longeron_T_275mm_cut(100,12.2,0,  90,90,0);    
            longeron_I_275mm_cut(149, 1.2,0,  90,90,0);
        }//difference
        
        
        
        //sg90(67,8,0);
	}//transform
}//module