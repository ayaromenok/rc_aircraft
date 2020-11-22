include <../../lib/lib2.scad>
include <../../std/sg90.scad>

profile_clark_y_15cm();

module profile_clark_y_15cm(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        linear_extrude(height = 5, center = true, convexity = 10)
            import(file = "dxf/profile_clark_y.dxf", layer="clark_y_15cm");
        yCyl(4.2,20,    45,8,0);
        sg90(67,8,0);
	}//transform
}//module
