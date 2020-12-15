include <../lib/lib2.scad>

//prop_6035();

module prop_6035(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yCyl(6,10);
            yCyl(3,12);
        }
        yCube(3*25.4,17,1,  3*25.4/2,0,0,   15);
        yCube(3*25.4,17,1,  -3*25.4/2,0,0,   -15);
	}//transform
}//module
