include <../lib/lib2.scad>

//FS_IA6B();

module FS_IA6B(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(47,26.2, 11);
        yCube(14,26.2,15.2, 17,0,2.1);
        yCube(9,18,8, 28,0,2.1);
	}//transform
}//module
