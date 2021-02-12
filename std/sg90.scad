include <../lib/lib2.scad>

//sg90();
//sg90_cut(0,20,0);

module sg90(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    color("darkblue")
	{
	    yCube(23,12.5,22.5);
        
        yCyl(12.3/2,4.5,              5.35,0,13.5);
        yCyl(6.5/2,4.5,              -1,0,13.5);
        yCyl(4.9/2,3.5,              5.35,0,17.5);
        
        difference(){
            yCube(32.2,12.3,2.5,    0,0,7.5);
            yCyl(1,10,              13.75,0,7.5);
            yCyl(1,10,              -13.75,0,7.5);
        }//dif
	}//transform
}//module


module sg90_cut(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    color("lightblue")
	{
	    yCube(23.7,12.9,23);
        
        yCyl(12.9/2,4.5,              5.35,0,13.5);
        yCyl(7.2/2,4.5,              -1,0,13.5);
        yCyl(5.7/2,3.5,              5.35,0,17.5);
        
        yCube(32.8,12.9,2.7,    0,0,7.5);
        yCyl(1.2,20,              13.75,0,7.5);
        yCyl(1.2,20,              -13.75,0,7.5);
        
	}//transform
}//module
