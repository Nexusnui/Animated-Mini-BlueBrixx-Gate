//Stud Tolerance added to the radius of a stud
st = 0.1; // .025

// include vent holes
include_vents = true;

/* [Curve Quality] */
// minimum angle for a fragment
$fa=2;
// minimum size of a fragment
$fs=0.6;

/* [Screen Offset Correction] */
//Correction of screen position on x axis.
screw_x_corr=0; // .025
//Correction of screen position on y axis.
screw_y_corr=0; // .025

module __Customizer_Limit__ () {}  // Hide following assignments from Customizer.

//Brick Variables names:
brick_b_u = 1.6;
brick_s_d = 3*brick_b_u;
brick_h = 6  * brick_b_u;
brick_p_h = 2 * brick_b_u;
brick_g_u = 5 * brick_b_u;

//Brick Variables as functions forexternal use:
function brick_base_unit(size=1) = brick_b_u*size;
function brick_stud_diameter(size=1) = brick_s_d*size;
function brick_heigth(size=1) = brick_h*size;
function brick_plate_heigth(size=1) = brick_p_h*size;
function brick_grid_unit(studs=1) = brick_g_u*studs;


gate_outer_d = 63.8;
screen_h = 8.7+0.1;
housing_h = brick_heigth();
housing_inner_d =52.4;
housing_bottom = housing_h-screen_h;

screw_dist = 23.93;
screw_x1 = -21.27;
screw_x2 = 15.73;
screw_y2 = 14.10;
screw_y3 = -14.90;
screw_shaft_d = 2+0.6;
echo(housing_inner_d);



module translate_brick(pos){
    b_g_x = pos[0] * brick_g_u;
    b_g_y = pos[1] * brick_g_u;
    if (is_num(pos[2])){
        b_g_z = pos[2] * brick_p_h;
        translate([ b_g_x, b_g_y, b_g_z])children();
    }else{
        translate([ b_g_x, b_g_y, 0])children();
    }
}

module stud(center=false,stud_tolerance=brick_st){
    if(center){
        cylinder(d=brick_s_d+stud_tolerance*2,h = brick_b_u);      
    }else{
        translate_brick([0.5,0.5,0])cylinder(d=brick_s_d+stud_tolerance*2,h = brick_b_u);
    }
}

module housing(){
difference(){
union(){
cylinder(d=gate_outer_d,h=housing_h);

translate([0,-0.2,0])translate_brick([1.5,-4,1.75])rotate([-90,0,0])cylinder(h=brick_heigth(),d2=brick_grid_unit(),d1=brick_stud_diameter(1.25));
translate([0,-0.2,0])translate_brick([-1.5,-4,1.75])rotate([-90,0,0])cylinder(h=brick_heigth(),d2=brick_grid_unit(),d1=brick_stud_diameter(1.25));
}
translate([0,-0.2,0])translate_brick([1.5,-4,1.75])rotate([-90,0,0])cylinder(h=brick_heigth()+0.4,d=brick_base_unit(2)+0.15);
translate([0,-0.2,0])translate_brick([-1.5,-4,1.75])rotate([-90,0,0])cylinder(h=brick_heigth()+0.4,d=brick_base_unit(2)+0.15);

translate([0,0,housing_bottom])cylinder(d=housing_inner_d,h=screen_h+0.01);

translate([screw_x_corr,screw_y_corr,0])screw_holes();


translate([-brick_grid_unit(),-gate_outer_d/2,0])cube([brick_grid_unit(2),brick_grid_unit(),brick_plate_heigth(2)+housing_bottom]);

translate([-brick_grid_unit(),-housing_inner_d/2-1,0])cube([brick_grid_unit(2),3,housing_h]);


translate([0,0,housing_bottom+brick_plate_heigth(0.75)])cylinder(d1=gate_outer_d-3,h=5,d2=housing_inner_d);
translate([0,0,housing_bottom])cylinder(d=gate_outer_d-3,h=brick_plate_heigth(0.75));

if (include_vents){
difference(){
cylinder(d=brick_grid_unit(3),h=housing_bottom);
cylinder(d=brick_grid_unit(2.75),h=housing_bottom);
rotate([0,0,120+90])translate_brick([0,-0.25,0])cube([brick_grid_unit(2.5),brick_grid_unit(0.5),housing_bottom]);
rotate([0,0,-120+90])translate_brick([0,-0.25,0])cube([brick_grid_unit(2.5),brick_grid_unit(0.5),housing_bottom]);
rotate([0,0,90])translate_brick([0,-0.25,0])cube([brick_grid_unit(2.5),brick_grid_unit(0.5),housing_bottom]);
}

difference(){
cylinder(d=brick_grid_unit(2),h=housing_bottom);
cylinder(d=brick_grid_unit(1.75),h=housing_bottom);
rotate([0,0,120-90])translate_brick([0,-0.25,0])cube([brick_grid_unit(2.5),brick_grid_unit(0.5),housing_bottom]);
rotate([0,0,-120-90])translate_brick([0,-0.25,0])cube([brick_grid_unit(2.5),brick_grid_unit(0.5),housing_bottom]);
rotate([0,0,-90])translate_brick([0,-0.25,0])cube([brick_grid_unit(2.5),brick_grid_unit(0.5),housing_bottom]);
}
}

}


cut_studs();

}



module cut_studs(){
difference(){
union(){
translate_brick([3,0,3])stud(false,st);
translate_brick([-4,0,3])stud(false,st);

translate_brick([3,-1,3])stud(false,st);
translate_brick([-4,-1,3])stud(false,st);

translate_brick([0,3,3])stud(false,st);
translate_brick([-1,3,3])stud(false,st);

translate_brick([0,-4,3])stud(false,st);
translate_brick([-1,-4,3])stud(false,st);

translate_brick([2,2,3])stud(false,st);
translate_brick([-3,2,3])stud(false,st);

translate_brick([2,-3,3])stud(false,st);
translate_brick([-3,-3,3])stud(false,st);

translate_brick([3,-2,3])stud(false,st);
translate_brick([-4,-2,3])stud(false,st);

translate_brick([3,1,3])stud(false,st);
translate_brick([-4,1,3])stud(false,st);

translate_brick([1,3,3])stud(false,st)
translate_brick([-2,3,3])stud(false,st);

translate_brick([1,-4,3])stud(false,st)
translate_brick([-2,-4,3])stud(false,st);
translate_brick([-2,-4,3])stud(false,st);
translate_brick([-2,3,3])stud(false,st);
}

translate_brick([0,0,3])cylinder(d=housing_inner_d,h=housing_h+0.01);

translate_brick([0,0,3])difference(){
cylinder(d=gate_outer_d+brick_stud_diameter(),h=housing_h);
cylinder(d=gate_outer_d,h=housing_h);
}
translate([-brick_grid_unit(),-housing_inner_d/2-1,brick_plate_heigth(3)])cube([brick_grid_unit(2),3,housing_h]);


}

}

module screw_holes(){
    translate([screw_x1,0,0])cylinder(d=screw_shaft_d,h=housing_bottom+0.01);
translate([screw_x2,screw_y2,0])cylinder(d=screw_shaft_d,h=housing_bottom+0.01);
translate([screw_x2,screw_y3,0])cylinder(d=screw_shaft_d,h=housing_bottom+0.01);
}

housing();