include <../../lib/lib2.scad>
include <profile_clark_y.scad>
include <longeron_275mm.scad>

stub();
module stub(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_T_275mm(275/2, 0.5,4,  -68,0,0);
        longeron_I_275mm(275/2, 149.6,1.2,  0,0,0);
        longeron_T_275mm(275/2, 45,0.38,  0,0,0);
        longeron_T_275mm(275/2, 20,14.9,  192,0,0);
        longeron_T_275mm(275/2, 45,17.5,  180,0,0);
        //longeron_T_275mm(275/2, 85,20,  180,0,0);
        
        nervure_clark_150mm_std(0,0,0,  90,0,90);
        nervure_clark_150mm_std(68.75,0,0,  90,0,90, mz=1);
        nervure_clark_150mm_std(68.75*2,0,0,  90,0,90, mz=1);
        nervure_clark_150mm_std(68.75*3,0,0,  90,0,90, mz=1);
        nervure_clark_150mm_std(68.75*4,0,0,  90,0,90, mz=1);
	}//transform
}//module
