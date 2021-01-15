include <../../lib/lib2.scad>
//longeron_T_275mm(0,0,0, 0,0,45);
//longeron_I_275mm(0,0,0, 0,0,45);
//longeron_L_275mm();
//longeron_T_275mm_cut();
//longeron_I_275mm_cut();
//longeron_aeliron_200mm(-70.5,-70.5,-5.5,    90,0,45);

module longeron_aeliron_200mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        linear_extrude(height = 200, center = true, convexity = 10)
            import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm_aeliron_longeron");
        yCyl(1.2,220,   100,6.7,0);
    }//transform
}//module            
                        
module longeron_T_275mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
        yCube(275,2,0.7);
        difference(){
            yCube(275+3,0.7,2.5,   0,0,1.1);
        
            yCube(1.0,2,2.5,   0,0,2.5);
            yCube(1.0,2,2.5,   68.75,0,2.5);
            yCube(1.0,2,2.5,   68.75*2,0,2.5);
            yCube(1.0,2,2.5,   -68.75,0,2.5);
            yCube(1.0,2,2.5,   -68.75*2,0,2.5);
            yCube(1.2,2,2.5,   68.75*2+1,0,2.5);
            yCube(1.2,2,2.5,   -68.75*2-1,0,2.5);
        }//difference
        //adhesion
        yCyl(4,0.7, 275/2+5,0,0);
        yCyl(4,0.7, -275/2-5,0,0);
	}//transform
}//module

module longeron_T_275mm_cut(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(10,2.4,0.75);        
        yCube(10,1.1,1.6,   0,0,1.1);        
	}//transform
}//module

module longeron_I_275mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yCube(275+3,5,0.7);        
            
            yCube(3,2,2.5,   0.9,1.75,0);
            yCube(3,2,2.5,   68.75+0.9,1.75,0);
            yCube(3,2,2.5,   68.75*2-0.9,1.75,0);
            yCube(3,2,2.5,   -68.75+0.9,1.75,0);
            yCube(3,2,2.5,   -68.75*2+0.9,1.75,0);            
            
            yCube(1.2,2,2.5,   68.75*2+1,1.75,0);
            yCube(1.2,2,2.5,   -68.75*2-1,1.75,0);
        }//diff
            /*yCube(1.2,2,2.5,   0,1.75,0);
            yCube(1.2,2,2.5,   68.75,1.75,0);
            yCube(1.2,2,2.5,   68.75*2,1.75,0);
            yCube(1.2,2,2.5,   -68.75,1.75,0);
            yCube(1.2,2,2.5,   -68.75*2,1.75,0);            
        */
                //adhesion
        yCyl(4,0.7, 275/2+5,0,0);
        yCyl(4,0.7, -275/2-5,0,0);

	}//transform
}//module

module longeron_I_275mm_cut(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){   
            yCube(10,5,1.2);        
    }//transform
}//module            

module longeron_L_275mm(px=0, py=0, pz=0, rx=0, ry=0, rz=0, mx=0, my=0, mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        yCube(275,2,0.7);
        yCube(275,0.7,2.5,   0,-0.75,1.1);
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