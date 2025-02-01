
//$vpr = [13, 0, 360*$t];

use <threads-library-by-cuiso-v1.scad>

$fn=200;

//pullo=27.5;
pullo=27;
  
kulma=150;
akseli=8;

module korkki() {
  difference() {
    union() {
      thread_for_screw_fullparm(diameter=pullo, length=12,pitch=1.8); 
      translate([0,0,-4])cylinder(d=38, h=4);
      translate([0,0,-17])cylinder(d1=22,d2=38,h=13);
      translate([0,-0.5,12]) rotate([kulma,0,0])  cylinder(d1=10,d2=10,h=30);
      translate([0,0,13]) rotate([150,0,180])  cylinder(d2=6,d1=10,h=32);
    }
    translate([8,-20,-24])cube([20,40,20]);
    translate([-28,-20,-24])cube([20,40,20]);
    translate([0,-0,0])cylinder(d1=17,d2=17, h=18);
    translate([0,0,13]) rotate([kulma,0,0]) cylinder(d=7,h=36);
    translate([0,0,13]) rotate([150,0,180]) cylinder(d=3,h=43);
    translate([0,0,-18])cylinder(d=akseli+0.5, h=29);
    translate([0,0,-18])cylinder(d=14, h=6);
  }
  difference(){
    translate([-9,-5.5,-2]) cube(([18,11.5,12]));
    translate([0,0,-9])cylinder(d=akseli+0.5, h=20);
  }
}

module tappi()
  difference(){
  union() {
    translate([0,0,-12]) cylinder(d=akseli,h=29);
    translate([0,0,16])thread_for_screw(diameter=akseli,length=19);
    translate([0,0,-18]) cylinder(d2=pullo-3,d1=pullo-13,h=6);
    translate([0,0,-12]) cylinder(d1=15,d2=16,h=2);
  }
  translate([0,0,-19])  thread_for_nut(diameter=3,length=56,usrclearance=0.1);
}

module mutteri(){
  difference(){
    union(){
      siz=22;
      cylinder(d=siz,h=15,$fn=6);
      rotate([0,0,30]) cylinder(d=siz,h=15,$fn=6);
    }
    thread_for_nut(diameter=akseli,length=18,usrclearance=0.1);
    cylinder(d=14,h=3);
  }
}

module koossa(){
  difference(){
    union(){
      rotate([180,0,0])korkki();
      translate([0,30,0])color("RED")tappi();
      translate([29,0,17])color("GREEN")mutteri();
    }
    // translate([0,-20,-21]) cube(100);
  }
}

module erillaan(){
      rotate([180,0,0])korkki();
      translate([27,0,6])color("RED")tappi();
      translate([20,22,-12])color("GREEN")mutteri();
}

//difference(){ korkki(); translate([0,0,-18]) cube(100);}
//koossa();
erillaan();

//korkki();
