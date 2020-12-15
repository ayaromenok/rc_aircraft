include <../lib/lib2.scad>
//engine_A2212();
module engine_A2212(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        yCyl(3,37.5,    0,0,6.5);
        difference(){
            yCyl(14,24.5);
            yCyl(1,10,  9.3,0,-10); 
            yCyl(1,10,  -9.3,0,-10); 
            yCyl(1,10,  0,7.8,-10); 
            yCyl(1,10,  0,-7.8,-10); 
        }
	}//transform
}//module
