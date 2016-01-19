$fa = 1;
$fs = 1;

mountinghole = 8;
fansize = 40;
distance_fan_mount = 31.5;

module screw_pattern() {
    for(x=[4.1, 35.6], y=[4.1, 35.6]) {
        translate([x, y, -0.5]) cylinder(r=1.6, h=6);
    }
}

module fan_duct() {
    hull() {
        for(x=[4.1, 35.6], y=[4.1, 35.6]) {
            translate([x, y, 0]) cylinder(r=4, h=8);
        }

        translate([7, 0, 0]) cube([fansize-14, 3, 8]);
        translate([7, fansize-3, 0]) cube([fansize-14, 3, 4]);
        
        translate([0, 7, 0]) cube([3, fansize-14, 8]);
        translate([fansize-3, 7, 0]) cube([3, fansize-14, 8]);
        
        translate([8, 7, 35]) rotate([0, 45, 0]) cube([6, fansize-14, 4]);
    }
}

module fan_duct_negative() {
    hull() {
        for(x=[6.1, 33.6], y=[6.1, 33.6]) {
            translate([x, y, 0]) cylinder(r=4, h=8);
        }

        translate([7, 2, 0]) cube([fansize-14, 3, 8]);
        translate([7, fansize-3-2, 0]) cube([fansize-14, 3, 8]);
        
        translate([2, 7, 0]) cube([3, fansize-14, 4]);
        translate([fansize-3-2, 7, 0]) cube([3, fansize-14, 8]);
        
        translate([8.65, 8, 36]) rotate([0, 50, 0]) cube([6, fansize-16, 2]);
    }
}

module extruder_mount() {
    translate([fansize, fansize/2-8, 0]) {
        difference() {
            union() {
                cube([4, 16, 8]);
                translate([4, 16, 4]) rotate([90, 0, 0]) cylinder(r=4, h=16);
            }
            translate([4, 18, 4]) rotate([90, 0, 0]) cylinder(r=1.6, h=20);
            
            translate([0, 4.5, -0.1]) cube([16, 7, 8.2]);
        }
    }

}

difference() {
    fan_duct();
    
    fan_duct_negative();
    
    screw_pattern();

}

difference() {
    for(x=[4.1, 35.6], y=[4.1, 35.6]) {
        translate([x, y, 0]) cylinder(r=4, h=8);
    }
    screw_pattern();
}

extruder_mount();