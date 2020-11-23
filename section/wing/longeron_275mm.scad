include <../../lib/lib2.scad>
//longeron_T_275mm();
//longeron_I_275mm();
//longeron_L_275mm();
module longeron_T_275mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(275,2,0.45);
        difference(){
            yCube(275,0.45,2.5,   0,0,1.1);
        
            yCube(0.6,2,2.5,   0,0,2.5);
            yCube(0.6,2,2.5,   68.75,0,2.5);
            yCube(0.6,2,2.5,   68.75*2,0,2.5);
            yCube(0.6,2,2.5,   -68.75,0,2.5);
            yCube(0.6,2,2.5,   -68.75*2,0,2.5);
        }//difference
	}//transform
}//module

module longeron_I_275mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(275,3,0.45);        
	}//transform
}//module

module longeron_L_275mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        yCube(275,2,0.45);
        yCube(275,0.45,2.5,   0,-0.75,1.1);
	}//transform
}//module
/*
difference(){
    union(){
        h=1.2;
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
    }//union
    yCube(150,30,10,    78,15,0);
}
*/