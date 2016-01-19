$fs = 1;
$fa = 1;

module ramps_mount() {
    import("../stl/ramps-mount.stl",convexity=5);
}

height = 12;

difference() {
    union() {
        translate([833, 128, -5.5]) ramps_mount();

        translate([7, 7, 0]) {          
            for(x=[5, 66], y=[5, 100]) {
                difference() {
                    translate([x, y, 0]) cylinder(r=3.5, h=height);
                    translate([x, y, 0]) cylinder(r=1.5, h=height);
                }
            } 
        }
        translate([67, -0.3, -0.05]) cube([11, 123.4, 3.5]);
    }
    for(x=[12,73], y=[12, 107]) {
        translate([x, y, -1]) cylinder(r=1.5, h=height+1);
    }
    
}


