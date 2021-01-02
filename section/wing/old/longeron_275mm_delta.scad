include <../../lib/lib2.scad>

longeron_T_275mm_delta(0,0,0, 0,180,45, 275);

module longeron_T_275mm_delta(px=0, py=0, pz=0, rx=0, ry=0, rz=0, l=275){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yCyl(5,l,  0,0,0,  0,90,0,$fn=3);
            yCyl(3.4,25,  -l/2,0,0.8,  0,90,0,$fn=3);
        }//difference
        yCyl(3,25,  l/2,0,1,  0,90,0,$fn=3);
        
	}//transform
}//module
