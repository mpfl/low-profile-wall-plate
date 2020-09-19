/*

 Low profile parametric wall plate

*/

screw_hole_x = 84;

screw_outer_diameter = 6;

screw_inner_diameter = 3;

screw_head_height = 2;

opening_outer_diameter = 60;

opening_inner_diameter = 50;

inner_plate_thickness = 2;

outer_plate_thickness = 1.2;

quality = 60;

$fn = quality;

draw_outer_plate();

module draw_outer_plate() {
    linear_extrude(inner_plate_thickness + outer_plate_thickness + screw_head_height)
        outer_plate_outline();
}

module draw_inner_plate() {
    linear_extrude(inner_plate_thickness)
        difference() {
            inner_plate_outline();
            circle(d = screw_inner_diameter);
            translate([screw_hole_x,0,0])
                circle(d = screw_inner_diameter);
            translate([screw_hole_x/2,0,0])
                circle(d = opening_inner_diameter);
        }
}

module inner_plate_outline() {
    hull() {
        circle(d = screw_outer_diameter);
        translate([screw_hole_x,0,0])
            circle(d = screw_outer_diameter);
        translate([screw_hole_x/2,0,0])
            circle(d = opening_outer_diameter);
    }    
}

module outer_plate_outline() {
    offset(r = outer_plate_thickness)
        inner_plate_outline();
}