include <../../lib/lib2.scad>
include <../../std/sg90.scad>
include <longeron_275mm.scad>

//15cm
//nervure_clark_150mm_std();
//nervure_clark_150mm_std(pz=0,rz=180,mx=1);

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
        
        
        //yCube(3,2.4,h*2,  0,0,h/2,    0,0,0);
        //internal support - w - width 
        difference(){
            union(){
                //yCube(w,17,h,   45,9,0,   0,0,0);
                //yCube(w,54,h,   48,8,0,   0,0,-75);
                //yCube(w,28,h,   45,8.7,0,   0,0,55);
                //yCube(w,28,h,   45,8.7,0,   0,0,-55);
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
