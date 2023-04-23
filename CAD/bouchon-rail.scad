$fa = 6;
$fs = 0.5;

fa_small = 6;   
fs_small = 0.2;

include <MinkowskiRound.scad>

module int_plug(l = 10) {
	translate([0, 0, 0])
		linear_extrude(height = l) import("coupe-rail-led.dxf", layer="int_plug");
};

module ext_plug(l = 10) {
	translate([0, 0, -l])
		linear_extrude(height = l) import("coupe-rail-led.dxf", layer="ext_plug");
};

module plug(l_i = 10, l_e = 10) {
	minkowskiRound(1, 1, enable=1) {
	    union() {
		int_plug(l = l_i);
		ext_plug(l = l_e);
	    }
	}
}

difference() {
	plug();
	translate([10, -2, -5]) rotate([-90, 0, 0])
	    cylinder(d = 3.2, h = 20, center=false);
	translate([10, 6.3 - 1, -5]) rotate([-90, 0, 0])
	    cylinder(d = 6, h = 20, center=false);
}
