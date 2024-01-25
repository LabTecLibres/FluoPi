/*
    With this code you can make a focus wheel extension for the M12 lenses used in the FluoPi project.
    
    Isaac Núñez 2020 (CC BY 4.0; https://creativecommons.org/licenses/by/4.0/) 
 
*/


use <threadlib/threadlib.scad>

////////////////////////////////////
//  Parameters  //

// This values have to be the same as in the filter holder to be compatibles
rf = 12.6; //filter radius
side_thick = 1*1.2 ; // 1.2 times to let enter the clamp
h_clam = 2; // just the clamp height
h_junct = 0.5; // junction heigh to enter in the wheel groove.
hc = h_clam + h_junct; // total clamp piece height.
thick_frac = 0.6 ; // heigh space left in the groove to let enter the clamp overhangs. (it has to be a value between [0,1], as is defined as a fraction of clamp heigh)
free_clamp_space = 4.2; // wide of each of the parts without the clamp.
angles1 = [0,120,240]; // degrees where to left the free clamp spaces.


// until here

///////////////
//wheel values

re_wheel = 16; //wheel external radii
ri_wheel = 14; // wheel internal radii
sup_tick = 1; // superior thickness
w_thick = h_clam + sup_tick; // wheel height (z axis)
nt = 20; // number of thoot
//thoot_size = 5; //

///////////////////////
// M12 junction ring //

M12_ri = 7+0.15 ; // 0.1 of extra space error
M12_side_thick = 1.2; // thickness of the ring attached to the M12 lens
jring_h = w_thick + 2; // 

M12_re = M12_ri + M12_side_thick;

rb = rf-1;
re = rf +side_thick;

///////////////////
/// RPI V2 ////////

//sensor lens
sL_ri = 4.5/2; // internal radius
sL_re = 5.4/2+0.3; // external radius. 0.1 looseness
sL_h = 1.5; // heigh
sL_a = 360/8 + 1; //angle of the clamps. 5 degrees of looseness.

sL_reb = 7.3/2 + 0.5; // sensor lens base external radius. 0.5 error.

lens_shift = 1.5; // lens shift attachment in the z axis. (as this value increase the lens junction will be farther the wheel)

V2_side_thick = 1.2; // thickness of the ring attached to the V2 lens

thread_h = 5.5; // thread height
thread_ri = 6; // thread internal radius
thread_size = "M16"; //  thread to use in the focus knob and camera enclosure junction.
specs = thread_specs(str(thread_size, "-ext"));
pitch = specs[0];
turns = thread_h/pitch - 1; // turns of the thread to reach the desired heigh.


//////////////
// Moldules //

module clamp_space(length, wide, thickness, angles){

    for(ang = angles){
       rotate([0,0,ang])
       translate([length/2, 0, 0])
       cube([length, wide, thickness], center = true);
    }
}

module wheel(){
    // to create the wheel
    tooth_ang = 360/nt; //angle per each gear tooth
    end_ang = 360 - tooth_ang;
    
    tw = sin(tooth_ang/2)*ri_wheel;
    tr = cos(tooth_ang/2)*ri_wheel;
    th = re_wheel - tr;
    
    union(){
        // Wheel 
        translate([0,0,w_thick/2])
        cylinder(h=w_thick, r=ri_wheel, $fn=100, center =true);
        
        // gear teeth
        for(ang = [0:tooth_ang:end_ang]){
        rotate([0,0,ang])
        translate([0,tr,w_thick/2])
        linear_extrude(height = w_thick, center = true, convexity = 2, twist = 0)
        polygon(points=[[tw,0],[-tw,0],[0,th]]);
        }
        /*
// in this case the spikes starts from center.            polygon(points=[[0,-re_wheel*3/4],[0,re_wheel*3/4],[re_wheel,0]]);
        }
        */

    }
}


module clamp(){
    /* this is the "negative" clamp estructure. It is used for substract it from the wheel (and properly left the space for the filter support attachment).
    */
    
    tfc = 1-thick_frac; // the complementary space heigh to create the negative.
    
    difference(){
        
        //base cylinder
        cylinder(h=hc, r=re, $fn=120, center =true);
        //central hole
        cylinder(h=hc*1.1, r=rf, $fn=120, center =true);
        
        //clamp overhangs space
        translate([0,0,hc/2-h_clam*(1-tfc) - h_clam*tfc/2])  
        clamp_space(re*1.5, free_clamp_space ,h_clam*tfc, angles1); // re multiplied by 1.5 just to ensure the holes are well done.
     
    }

}

module WS_camera(test){
    
    if(test == true){
        
        // M12 junction test
        difference(){
            cylinder(h=jring_h, r=M12_re, $fn=100, center =true);
            cylinder(h=jring_h*1.5, r=M12_ri, $fn=100, center =true);
        }
           
    }
    
    else{
        difference(){
            union(){ 
                
                wheel();
                
                // M12 ring junction
                translate([0,0,jring_h/2])
                cylinder(h=jring_h, r=M12_re, $fn=100, center =true);
            }
            
            // central hole
            translate([0,0,w_thick/2])
            cylinder(h=jring_h*1.5, r=M12_ri, $fn=100, center =true); 
            
            // Groove for the clamp
            translate([0,0,hc/2]) 
            clamp();
        }
    }
    
}

module rpiv2_lens(){
    /* 
    RPI V2 camera lens structure. It is used as a negative to create the focus knob.
    */   
    union(){
        //base cone
        translate([0,0,sL_h/2])
        cylinder(h=sL_h, r1=sL_ri, r2 = sL_re, $fn=120, center =true);
        
        // clamps
        for (a =[0,1,2,3]){
            rotate([0,0,a*90])
            rotate_extrude(angle = sL_a,convexity = 5, $fn = 500)
            polygon( points=[[0,0],[sL_re,0],[sL_re,sL_h],[0,sL_h]] );
        }
        
    }
}

module lens_remover_test(){
    // This module is just to test if the key part of the focus knob is working (it could fail due the printer definition capacity)
    
    difference(){
        // cilinder
        translate([0,0,sL_h/2])
        cylinder(h=sL_h, r=sL_re+3, $fn=120, center =true);
        //RPIV2 Lens
        rpiv2_lens();
    }
}

module RPIV2_camera(test){
    if(test == true){
        
        lens_remover_test();
    }
    
    else{
        union(){
            difference(){
                // Focus wheel
                wheel();
                
                //hole for the lens junction
                translate([0,0,w_thick/2])
                cylinder(h=w_thick, r=sL_reb, $fn=120, center =true);
                
                
                // Groove for the clamp
                translate([0,0,hc/2]) 
                clamp();
            }
            
            // union to lens piece
            translate([0,0,lens_shift])
            difference(){
                
                translate([0,0,sL_h/2])
                cylinder(h=sL_h, r=sL_reb, $fn=120, center =true);
                
                rpiv2_lens();
                
                //internal hole
                translate([0,0,sL_h/2])
                cylinder(h=sL_h, r=sL_ri, $fn=120, center =true);
                
            }
            /*
            // external thread
            translate([0,0,w_thick])
            difference(){
                translate([0,0,pitch/2])
                bolt(thread_size, turns=turns, higbee_arc=30);
                
                //internal cylinder space
                cylinder(h=200, r=thread_ri, $fn=120, center =true);
            }
            */
        }
    }
    
}
///////////////////////////
// Create the focus knob //
///////////////////////////

// Uncomment to generate the different versions of the module

//WS_camera();
//wheel();
//clamp();
//rpiv2_lens();
//lens_remover_test();
RPIV2_camera();



