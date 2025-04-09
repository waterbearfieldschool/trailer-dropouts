// CSG.scad - Basic example of CSG usage

conduit_diameter=18;

//overall object width and height
width = 45;
height = 60+conduit_diameter;

dropout_width=10;
dropout_height=20;
rounded_radius=5;

//ubolt variables
u_left_x=-15;
u_left_y=10;
u_height=12;
u_width=7;

bolt_hole_diam=5;

nut_buffer=5;

u_horizontal_spacing=width-nut_buffer;
u_vertical_spacing=26;

//u_vertical_centerline=13;
u_vertical_centerline=height/2-u_vertical_spacing/2-nut_buffer;


u_nut_diam=11;

c_res=100;

viz=0;


module ubolt_hole (x,y,width,height) {
    
     //head
    translate([x,y+height/2-width/2,0])
    cylinder(h=10,r=width/2,center=true,$fn=c_res); 
    
   // translate([x,y+height-width/2,0])
    //cube([width,width,30],center=true);
    
        //neck
        translate([x,y,0])
            cube([width,height-width,10],center=true);
    
        //bottom
    translate([x,y-height/2+width/2,0])
    cylinder(h=10,r=width/2,center=true,$fn=c_res); 
    
    
    //translate([x,y-height+width/2,0])
    //cube([width,width,30],center=true);
    
}

module ubolt_nut_viz(x,y,radius) {
    
    // visualize the nut
    color("green",alpha=.2)
    translate([x,y,3])
cylinder(h=2,r=11/2,center=true,$fn=c_res);
    
}



if (viz) {
    
    
//visualize the skewer nut

color("red",alpha=.2)
translate([0,-height/2+dropout_height-rounded_radius,3])
cylinder(h=2,r=20/2,center=true,$fn=100); 
    
    
//visualize the ubolt bolts

ubolt_nut_viz(-u_horizontal_spacing/2,u_vertical_spacing/2+u_vertical_centerline,u_nut_diam/2);

ubolt_nut_viz(-u_horizontal_spacing/2,-u_vertical_spacing/2+u_vertical_centerline,u_nut_diam/2);

ubolt_nut_viz(u_horizontal_spacing/2,u_vertical_spacing/2+u_vertical_centerline,u_nut_diam/2);

ubolt_nut_viz(u_horizontal_spacing/2,-u_vertical_spacing/2+u_vertical_centerline,u_nut_diam/2);

// visualize the conduit
color("blue",alpha=.1)
translate([0,u_vertical_centerline,-conduit_diameter/2])
rotate([0,90,0])
cylinder(h=100,r=conduit_diameter/2,center=true,$fn=c_res); 
}



projection() difference() {
    
    
   
    // body
    //translate([5,5,0])
    
    minkowski() {
        cube([width,height,1],center=true);
        cylinder(r=rounded_radius,h=1.4,center=true);
    }
    
    //upper strap
    upper_middle = u_vertical_centerline + conduit_diameter/2;
    translate([0,upper_middle,0])
    cube([16,2,10],center=true);
    
    //lower strap
    lower_middle = u_vertical_centerline - conduit_diameter/2;
    translate([0,lower_middle,0])
    cube([16,2,10],center=true);

    
    // left bolt
    translate([-u_horizontal_spacing/2,u_vertical_centerline,0])
    cylinder(r=bolt_hole_diam/2,h=5,center=true,$fn=c_res);
    // right bolt
     translate([u_horizontal_spacing/2,u_vertical_centerline,0])
    cylinder(r=bolt_hole_diam/2,h=5,center=true,$fn=c_res);
    
    
    //upper left
     ubolt_hole(-u_horizontal_spacing/2,u_vertical_spacing/2+u_vertical_centerline,u_width,u_height);
    
    //lower left
     ubolt_hole(-u_horizontal_spacing/2,-u_vertical_spacing/2+u_vertical_centerline,u_width,u_height);

    //upper right
    ubolt_hole(u_horizontal_spacing/2,u_vertical_spacing/2+u_vertical_centerline,u_width,u_height);
    //lower right
     ubolt_hole(u_horizontal_spacing/2,-u_vertical_spacing/2+u_vertical_centerline,u_width,u_height);

    
    // dropout
    
    //neck
    union() {
    translate([0,-height/2+dropout_height/2-rounded_radius,0])
    //rotate([0,0,45])
    cube([dropout_width,dropout_height,30],center=true);
    
    //head
    translate([0,-height/2+dropout_height-rounded_radius,0])
    cylinder(h=10,r=dropout_width/2,center=true,$fn=c_res); 
                 
    } 
    
    }
    
