
rotate([-90,0,0])difference () {
	union(){
		cube ([110,50,16], center = true);
		translate([0,0,20])cube ([20,20,40], center = true);
	}
	union() {
		translate([0,10,0])union() {
			cube ([10,50,10], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([-20,10,0])union() {
			cube ([10,50,10], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([-40,10,0])union() {
			cube ([10,50,10], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([20,10,0])union() {
			cube ([10,50,10], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([40,10,0])union() {
			cube ([10,50,10], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}

		//top cylinder hole to hold pins
			translate([0,21,0])rotate([0,90,0])cylinder(h = 150, r = 2, center = true);

	}
}




