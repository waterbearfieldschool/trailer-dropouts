// CSG.scad - Basic example of CSG usage


width = 30;
//height = 45; -- for the shorter one
height=55;
//mount_x = 30;
mount_y = 15;
mount_width=7;
mount_height=12;
dropout_width=10;
dropout_height=20;
rounded_radius=5;

mount_dy=13.5;

mount_buffer=10;
mount_x=width/2-mount_buffer;

screw_radius=2;
screw_height=height/2-screw_radius;
//screw_x=dropout_width*2;
screw_x=width/2-2*screw_radius;

projection() difference() {
   
    //translate([5,5,0])
    minkowski() {
        cube([width,height,1],center=true);
        cylinder(r=rounded_radius,h=1.4,center=true);
    }
    
    
    //ruler
    //translate([10,0,0])
    //cube([mount_width,37,30],center=true);
    
    
    /*

    //attempt at upper
    union() {
        
        translate([mount_x,mount_dy/2+mount_width/2,0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);
        
        translate([mount_x,mount_dy/2+mount_height/2,0])
        cube([mount_width,mount_height-mount_width,30],center=true);
        
        translate([mount_x,mount_dy/2+mount_height-mount_width/2,0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);

    }
    
    //attempt at lower
    union() {
        
        translate([mount_x,-(mount_dy/2+mount_width/2),0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);
        
        translate([mount_x,-(mount_dy/2+mount_height/2),0])
        cube([mount_width,mount_height-mount_width,30],center=true);
        
        translate([mount_x,-(mount_dy/2+mount_height-mount_width/2),0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);

    }
    
    
    // left hand
    
    //attempt at upper
    union() {
        
        translate([-mount_x,mount_dy/2+mount_width/2,0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);
        
        translate([-mount_x,mount_dy/2+mount_height/2,0])
        cube([mount_width,mount_height-mount_width,30],center=true);
        
        translate([-mount_x,mount_dy/2+mount_height-mount_width/2,0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);

    }
    
    //attempt at lower
    union() {
        
        translate([-mount_x,-(mount_dy/2+mount_width/2),0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);
        
        translate([-mount_x,-(mount_dy/2+mount_height/2),0])
        cube([mount_width,mount_height-mount_width,30],center=true);
        
        translate([-mount_x,-(mount_dy/2+mount_height-mount_width/2),0])
        cylinder(h=10,r=mount_width/2,center=true,$fn=100);
        
    }
    
    
    */
    
    
    
    // dropout
    
    //neck
    union() {
    translate([0,-height/2+dropout_height/2-rounded_radius,0])
    //rotate([0,0,45])
    cube([dropout_width,dropout_height,30],center=true);
    
    //head
    translate([0,-height/2+dropout_height-rounded_radius,0])
    cylinder(h=10,r=dropout_width/2,center=true,$fn=100); 
        
        
        
    // screw mounts
        //left
    translate([-screw_x,screw_height,0])
    cylinder(h=10,r=screw_radius,center=true,$fn=100); 
        
            //left
    translate([screw_x,screw_height,0])
    cylinder(h=10,r=screw_radius,center=true,$fn=100); 
              
    }
    
    
    //reduce upper
    
  
    
    }
    
    /*
     //screw boundary TEST
    color("green")
    translate([0,-height/2+dropout_height-rounded_radius,0])
    cylinder(h=10,r=10,center=true,$fn=100); 
    */
    
    
    /*
     //pipe boundary TEST
    color("red")
    translate([width,screw_height,0])
    cube([60,17,30],center=true);
    */
    

echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
