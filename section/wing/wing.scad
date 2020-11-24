include <../../lib/lib2.scad>
include <section_275x150mm.scad>

wing();
module wing(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        yCyl(4,1000,    0,45,9,  0,90,0,clr="blue");
        wing_section_275x150mm(275/2,0,0);
        wing_section_275x150mm_central();
        wing_section_275x150mm(-275*3/2,0,0);
	}//transform
}//module
