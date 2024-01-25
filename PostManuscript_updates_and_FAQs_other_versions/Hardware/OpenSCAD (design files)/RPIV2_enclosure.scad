/*
    With this code you can make an adaptor enclosure to attach the ambar filter over the raspberry camera V2. 
    I is used in the FluoPi project.
    
    Isaac Núñez 2024 (CC BY 4.0; https://creativecommons.org/licenses/by/4.0/) 
 
*/


////////////////////////////////////
//  Parameters  //


/// Armor parameters
xy_thick = 1.5 ; // wall thickness in x and y axis
z_thick = 1; // wall thickness in z axis

arms_z = 1.5 ; // arms to screw heigh 
scwhst = 0.5; // screw hole support thickness in r axis

///////////////////
// RPI V2 camera //
///////////////////

RPIV2_cam_x = 25 + 1 ; // 1mm of error
RPIV2_cam_y = 24; 
RPIV2_cam_z = 1 + 0.1; // PCB thickness, 0.1 mm of error


sb_ys = 0.5; // sensor base looseness space in y axis. To generate a non-simetrical looseness.

RPIV2_sensor_x = 8.5; // sensor base length (8.5 mm). Use minimal or any losseness (we want it to be tight around the base to helping support it realted the zoom twist movements).
RPIV2_sensor_y = 8.5; // Deep
RPIV2_sensor_z = 3; // sensor base heigh, just the square part (without the lens cylindrical base).
sxyloos = 0.3; // sensor xy looseness

RPIV2_sensor_bottom = 5; // distance from sensor square to PCB bottom (the side with the cable)

//sensor conector to PCB
sc_z = 1.5 + 0.5; // heigh. Give to it a good looseness (0.5).

sc_y1 = 3; // section closer to sensor.
sc_y2 = 5; // section closer to border
sc_x1 = 2; // section sticking out from the edge

//sensor lens
sL_re = 5.4/2+0.3; // external radius. 0.1 looseness
sL_h = 1.5; // heigh


V2_hold_x =(RPIV2_cam_x - RPIV2_sensor_x)/2 - 0.3;    // space between camera border and sensor base. 0.3 the security factor
V2_hold_y = 12.5 - 0.2;  // space between border and PCB first obstacle (sensor base or electronic componentes). 0.2 security value. Use value = 12.5 to attach with screws or 7 to not use them.
V2_lens_y = RPIV2_sensor_y/2 + RPIV2_sensor_bottom; // distance of the center of the lens to the bottom of the PCB (the side with the cable)

V2_scw_r = 1;   // camera screw radious (M2)
V2_scw_b = 9.2;  // distance from bottom to screw hole center
V2_scw_s = 1.75; // distance from side to screw hole center
V2_scw_f = 2; // distance from front (opposite side of the cable connector) to screw hole center
V2_cshc = 10.75; // PCB center to screw hole center

V2_cch = 2.8; // cable conector thickness
V2_ccx = 22; // cable conector wide (x axis)
V2_ccy = 5.5; // cable conector deep (y axis)




module sensor_space(){
    union(){
        // Sensor base
        translate([0,0,RPIV2_sensor_z/2])
        cube([RPIV2_sensor_x+sxyloos,RPIV2_sensor_y+sxyloos,RPIV2_sensor_z], center=true);
        
        //sensor connection to PCB, aligned portion
        translate([0,(RPIV2_sensor_y+sc_y1+sc_y2)/2,sc_z/2])
        cube([RPIV2_sensor_x,sc_y1+sc_y2,sc_z], center=true);
        //sensor connection to PCB, sticking out portion
        translate([-(RPIV2_sensor_x+sc_x1)/2,(RPIV2_sensor_y+sc_y2)/2+sc_y1,sc_z/2])
        cube([sc_x1,sc_y2,sc_z], center=true);
                
    }
    
}

module armor(){
    // to generate the RPIv2 armor
    
    acx1 = RPIV2_sensor_x+sxyloos + 2*xy_thick; // armor cube 1 x
    acy1 = RPIV2_sensor_y + xy_thick; // armor cube 1 y
    acz1 = RPIV2_sensor_z; // armor cube 1 z
    
    
    acy2 = sc_y1; // armor cube 2 y
    acz2 = sc_z + z_thick; // armor cube 2 z
    
    acx3 = acx1 + sc_x1; // armor cube 2 y
    acy3 = sc_y2+2*xy_thick; // armor cube 2 y
    
    difference(){
        
        // armor base estructure
        union(){
            //Sensor base armor
            translate([0, -xy_thick/2, acz1/2])
           cube([acx1 , acy1+sxyloos , acz1], center = true);
            //cable armor
            translate([0, (RPIV2_sensor_y+acy2)/2, acz2/2])
           cube([acx1, acy2, acz2], center = true);
            // conection to PCB armor
            translate([-sc_x1/2, (RPIV2_sensor_y+acy3)/2+acy2-xy_thick, acz2/2])
           cube([acx3, acy3, acz2], center = true);
            
            // screw supports
            xdispa = V2_cshc/2; //  x displacement arms
            xdisps = V2_cshc; //  x displacement screw supports 
            arms_y = 2*(V2_scw_r+scwhst); // arms wide in y axis
            scwsr = V2_scw_r+scwhst; // screw support radius
            
            for(a = [-1 ,1 ]){
                difference(){
                    union(){
                        // arms to screw
                        translate([a*xdispa,0, arms_z/2])
                       cube([V2_cshc, arms_y , arms_z], center = true);
                        
                        //Screw supports
                        translate([a*(xdisps),0,arms_z/2])
                        cylinder(h=arms_z, r=scwsr, $fn=100, center =true);
                    }
                    //screw holes
                    translate([a*(xdisps),0,arms_z/2])
                    cylinder(h=arms_z, r=V2_scw_r, $fn=100, center =true);
                }
                
            }
        }
        
        // Sensor elements space
        sensor_space();
    }
    
    
    
}

module filter_support(h){
    union(){
        // filter support ring
        difference(){
            cylinder(h=h, r=re, $fn=120, center =true);
            // filter space
            translate([0,0,bottom_thick])
            cylinder(h=h, r=rf, $fn=120, center =true);
            //central hole    
            translate([0,0,-bottom_thick])    cylinder(h=h, r=ri, $fn=120, center =true);   
        }
        
        //lens attach
        // ring
        translate([0,0,(h+fat)/2])
        difference(){
            cylinder(h=fat, r=re, $fn=120, center =true);
            cylinder(h=fat, r=sL_re, $fn=120, center =true);
        }
        // union to lens piece
        translate([0,0,h/2])
        difference(){
            translate([0,0,sL_h/2])
            cylinder(h=sL_h, r=sL_re+3, $fn=120, center =true);
            lens();
        }
    }
    
}

//filter_support(h_fs);
//sensor_space();
armor();