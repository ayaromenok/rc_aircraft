include <../../lib/lib2.scad>
include <../../std/sg90.scad>

//15cm
nervure_std();

module nervure_std(px=0, py=0, pz=0, rx=0, ry=0, rz=0, h=1.2, w=1.2){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
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
        
        
        //internal support - w - width 
        difference(){
            union(){
                //yCube(w,17,h,   45,9,0,   0,0,0);
                //yCube(w,54,h,   48,8,0,   0,0,-75);
                yCube(w,28,h,   45,8.7,0,   0,0,55);
                yCube(w,28,h,   45,8.7,0,   0,0,-55);
                yCyl((4+w),h*3,   45,9,h*1);
            }//union
            yCyl(4.2,20,    45,9,0);
        }//difference
        
        ;
        yCube(w,17,h,   20,8,0,   0,0,-30);
        yCube(w,17.5,h,   78,8.4,0,   0,0,30);
        yCube(w,11.5,h,   105,5.9,0,   0,0,-30);
        
        
        //sg90(67,8,0);
	}//transform
}//module
