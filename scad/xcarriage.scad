// TamarinTech 2015
// CC-BY-SA

bearing_outer_diameter = 19.4;
bearing_inner_diameter = 10;
bearing_height = 29;
carriage_width = 58;
carriage_height = 75.5;
carriage_depth = 19.5;
mounting_screw_diameter = 4.6;

module bearing() {
    difference() {
      cylinder(r=(bearing_outer_diameter/2), h=bearing_height);
      translate([0, 0, -0.1]) cylinder(r=(bearing_inner_diameter/2), h=bearing_height+0.2);
    }
}

module rod_guides() {
  %color([0, 1, 1]) translate([-25, 0, -5]) cylinder(r=(bearing_inner_diameter/2), h=carriage_width+10, $fn=25);

  %color([0, 1, 1]) translate([25, 0, -5]) cylinder(r=(bearing_inner_diameter/2), h=carriage_width+10, $fn=25);
}

module mounting_plate() {
    // flat plate
    translate([-(carriage_height/2), 10, 0]) cube([carriage_height, 5, carriage_width]);
    
    // small enforcing plate, belt return path
    difference() {
        translate([-14.5, -4.5, 14.5]) cube([28, 14.5, 32.5]);
        translate([-8, -3, 13]) cube([16, 13, 34.5]);
    }
}

module belt_holder() {
    translate([0, 0, 0]) {
        rotate([90, 0, 0]) {   
            translate([0, 5, 0]) cylinder(r=4, h=13, $fn=20);
            translate([-4, 0, 0]) cube([8, 5, 13]);
            translate([0, 7.5, 13]) cylinder(r=7.5, h=1.5);
            translate([-7.5, 0, 13]) cube([15, 7, 1.5]);
        }
    }

}

module belt_holders() {
    translate([5, 10, 0]) {
        belt_holder();
        translate([0, 0, carriage_width]) rotate([0, 180, 0]) belt_holder();
    }
}

module bearing_holders() {
    translate([(carriage_height/2)-(bearing_outer_diameter+6), 0, 0]) {
      difference() {
        union() {
          translate([0, 0, 0]) cube([bearing_outer_diameter+6, 10, carriage_width]);
          difference() {
            // Right cylinder
            translate([(bearing_outer_diameter+6)/2, 0, 0]) cylinder(r=(bearing_outer_diameter+6)/2, h=carriage_width);
            translate([(bearing_outer_diameter-10)/2, -20, -0.1]) cube([15, 20, carriage_width+0.2]);
          }
        }
        translate([(bearing_outer_diameter+6)/2, 0, -0.2]) cylinder(r=(bearing_outer_diameter)/2, h=carriage_width+0.4);           
      }      
    }
        
    // Left cylinder
    translate([-(carriage_height/2), 0, 0]) {
      difference() {
        union() {
          translate([0, 0, 0]) cube([bearing_outer_diameter+6, 10, carriage_width]);
          difference() {
            translate([(bearing_outer_diameter+6)/2, 0, 0]) cylinder(r=(bearing_outer_diameter+6)/2, h=carriage_width);
            translate([(bearing_outer_diameter-10)/2, -20, -0.1]) cube([15, 20, carriage_width+0.2]);
          }
        }
        translate([(bearing_outer_diameter+6)/2, 0, -0.2]) cylinder(r=(bearing_outer_diameter)/2, h=carriage_width+0.4);
      }
    }   

}

module mounting_screw_pattern() {
    
    rotate([90, 0, 0]) {
        cylinder(r=mounting_screw_diameter/2, h=40, $fn=30);
        translate([0, 23, 0]) cylinder(r=mounting_screw_diameter/2, h=40, $fn=30);
        
        translate([23, 0, 0]) {
            cylinder(r=mounting_screw_diameter/2, h=40, $fn=30);
            translate([0, 23, 0]) cylinder(r=mounting_screw_diameter/2, h=40, $fn=30);
        }
    }
}

difference() {
    union() {
        rod_guides();
        mounting_plate();
        bearing_holders();
        translate([1, 0, 0]) belt_holders();
    }
    translate([-11.5, 20, 20.5]) mounting_screw_pattern();
}



%color([1, 1, 0]) translate([-25, 0, 0]) bearing();
%color([1, 1, 0]) translate([-25, 0, bearing_height]) bearing();
%color([1, 1, 0]) translate([25, 0, 0]) bearing();
%color([1, 1, 0]) translate([25, 0, bearing_height]) bearing();

