
module wilson2_extruder_3mmbody() {
    translate([0, -190, 0]) {
        import("../stl/extruder-direct-drive-3mmbody.stl");
    } 
}

module wilson2_extruder_body() {
    // We need the idler and clamp from this
    difference() {
        translate([173, -190, -9]) {
            import("../stl/extruder-direct-drive.stl");
        }
        translate([-55, -25, -1]) cube([60, 65, 40]);
        translate([-10, -38, -1]) cube([20, 15, 40]);
        translate([-65, -26, -1]) cube([12, 14, 40]);
    }
}

// Hexagon
// 16mm outer ring, 5mm tall
// 12mm inner ring, 4.5mm tall
// 16mm outer ring
module hexagon_hotend() {
    color([0, 1, 0]) rotate([90, 0, 0]) {
        translate([0, 0, -5]) cylinder(r=2, h=5);
        cylinder(r=8.1, h=5);
        translate([0, 0, 5]) cylinder(r=6.1, h=4.5);
    }
}

$fa = 1;
$fs = 1;

difference() {
    translate([0, 0, 0]) wilson2_extruder_body();
    translate([-38.7, -14.5, 9.6]) hexagon_hotend();
}

difference() {
    wilson2_extruder_3mmbody();
    translate([-39.1, -39, 9.6]) rotate([0, 0, 180]) hexagon_hotend();
}
    


