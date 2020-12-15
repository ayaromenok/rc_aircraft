include <../lib/lib2.scad>

ESC_30A();

module ESC_30A(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCube(54,26,8.5);
	}//transform
}//module
