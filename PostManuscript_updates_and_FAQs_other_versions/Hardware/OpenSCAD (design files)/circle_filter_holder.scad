/*
    
    With this code you can make a filter holder to attach it to the lens focus wheel used for the camera in the FluoPi project.
    
    Isaac Núñez 2020 (CC BY 4.0; https://creativecommons.org/licenses/by/4.0/) 
 
*/

////////////////
// Parameters //


rf = 12.6;   //filter radius
side_thick = 1 ;
filter_thick = 3;
filter_free_space = 0.5; // in z axis, between the filter and the lens 
bottom_thick = 0.8; //the layer that support the filter
sheet = 1; // sheet tickness to support the filter

ri = rf-sheet; // internal hole radius
re = rf +side_thick; // External radius

h_fs = filter_thick +filter_free_space + bottom_thick; //base filter support heigh

// HQ camera
r_hq = 15; // HQ camera radius
h_ring = 3; // Height of the ring attached to the camera

// Clamp support system for waveshare camera
h_clam = 2;
free_clam_space = 10;
angles1 = [0,120,240];
angles2 = [15,135,255];

h_WS = h_fs + h_clam; // for waveshare


///////////////////
// RPI V2 camera //
///////////////////

RPIV2_cam_x = 25 + 0.5 ; // 0.5 mm of error
RPIV2_cam_y = 24 + 0.5;  // 0.5 mm of error
RPIV2_cam_z = 6; //Lens height over the PCB

h_ext = 2; // external height to cover the PCB
e_tick = 1; // enclosure tickness

scw_r = 1; //screw radius
len_xy = 8.5; // lens base X and Y wide
lbd = 5; // lens distance from bottom
V2_scw_b = 9.25;  // distance from bottom to screw hole center
V2_scw_s = 2; // distance from side to screw hole center


V2_h_clam = 1.5;
V2_fc_space = 6;
V2_angles = [0,120,240];

h_V2 = h_fs + V2_h_clam; // for RPI_V2


////////////////////////////////////

module clam_space(length, wide, thickness, angles){

    for(ang = angles){
       rotate([0,0,ang])
       translate([length/2, 0, 0])
       cube([length, wide, thickness], center = true);
    }
}



////////////////////////
// Create the holder //

module filter_support(h){
    difference(){
        linear_extrude(height = h, center = true, convexity = 10, twist = 0,$fn = 100)
        circle(re);
        
        //filter space
        translate([0,0,bottom_thick])
        linear_extrude(height = h, center = true, convexity = 10, twist = 0,$fn = 100)
        circle(rf);
        
        //Central hole    
        translate([0,0,-bottom_thick])       linear_extrude(height = h, center = true, convexity = 10, twist = 0,$fn = 100)
        circle(ri);
    }
}

module fsup_WS_clamp(h){
    difference(){
        
        filter_support(h);
        
        // Clamp system
        translate([0,0,h/2-h_clam/2 - h_clam/4]) 
        clam_space(re*1.5, free_clam_space ,h_clam/2, angles1);

        translate([0,0,h/2-0.8*h_clam/2.1])  
        intersection() {

            clam_space(re*1.5, free_clam_space ,h_clam*0.8, angles1);

            clam_space(re*1.5, free_clam_space ,h_clam*0.8, angles2);
        }
    }
}

module fsup_HQ(h){
    
    r_hqc = r_hq + 0.1; // plus lossenes correction 
    h_total = h + bottom_thick + h_ring;
    re_hqe = r_hqc+side_thick; // external radius HQ enclosure
    t_ur = re_hqe - re; // thickness of the union ring 
    
    difference(){
        union(){
            filter_support(h);
            
            //union "ring"
            translate([0,0,h/2-bottom_thick])
            rotate_extrude(convexity = 5, $fn = 100)
            translate([re,0,0])
            polygon(points=[[0,0],[0,bottom_thick],[t_ur,bottom_thick]]);
            
            //ring attached to HQ camera
            translate([0,0,(h+h_ring)/2])
            difference(){
                cylinder(h=h_ring, r=r_hqc+side_thick, $fn=100, center =true);
                cylinder(h=h_ring, r=r_hqc, $fn=100, center =true);
            }
            }
    //central hole
    translate([0,0,bottom_thick+h/2])         
    cylinder(h=h_total, r=rf, $fn=100, center =true);  
    }

}

module fsup_rpiv2(h){
    difference(){
        
        filter_support(h);
        
        // Clamp system
        translate([0,0,h/2-V2_h_clam/2 ]) 
        clam_space(re*1.5, V2_fc_space ,V2_h_clam, V2_angles);

        
    }
}

// Uncomment the module you wanna generate
//fsup_WS_clamp(h_WS);
//filter_support(h_WS);
//fsup_HQ(h_fs);
fsup_rpiv2(h_V2);
