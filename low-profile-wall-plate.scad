/*

 Low profile parametric wall plate

*/

screw_hole_x = 84;

screw_outer_diameter = 6;

screw_inner_diameter = 3;

opening_outer_diameter = 60;

opening_inner_diameter = 50;

inner_plate_thickness = 2;

quality = 60;

$fn = quality;

draw_inner_plate();

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