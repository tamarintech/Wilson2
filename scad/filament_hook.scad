$fs = 1;
$fa = 1;

module filament_holder_shape() {
    hull() {
    cylinder(r=2, h=15);
    translate([0, -14, 0]) cylinder(r=2, h=15);
    translate([5, -15, 0]) cylinder(r=2, h=15);
    }
    
    hull() {
    translate([3, -13, 0]) cylinder(r=5, h=15);
    translate([96, -38, 0]) cube([25, 28, 15]);
        //cylinder(r=10, h=15);
    }
}

module filament_holder_negative() {
    hull() {
    translate([3, -13, 0]) cylinder(r=1.5, h=15);
    translate([92, -34, 0]) cube([2, 20, 15]);
        //cylinder(r=10, h=15);
    }   
}

%translate([96, -34, -7.5]) cube([20, 20, 30]);


module filament_holder() {
    difference() {
        filament_holder_shape(); 
        translate([0, 0, 5]) color([1, 0, 0]) filament_holder_negative();

        // 2020 extrusion
        translate([96, -44, -7.5]) cube([20.3, 30, 32]);
    }
    
    
}

filament_holder();

// fingers

translate([97, -37, 0]) cylinder(r=3, h=15);
translate([115, -37, 0]) cylinder(r=3, h=15);
