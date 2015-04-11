
difference () {
	union() {
		cube ([110,50,15], center = true); //Base shape

		translate([0,0,25])cube ([20,50,40], center = true); //Outline of circular mount
//		translate([0,0,25])rotate([0,90,0])cylinder(h = 20, r = 25, center = true);//Outline of circular mount
	}


	union() {
		//magnet holes
		translate([0,10,0])union() {
			cube ([10,50,6], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([-20,10,0])union() {
			cube ([10,50,6], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([-40,10,0])union() {
			cube ([10,50,6], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([20,10,0])union() {
			cube ([10,50,6], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}
		translate([40,10,0])union() {
			cube ([10,50,6], center = true);
			translate([0,-20,0])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);	
		}

		//top cylinder hole to hold pins
			translate([0,21,0])rotate([0,90,0])cylinder(h = 150, r = 2, center = true);

		//wingnut hole
		translate([0,0,27])rotate([0,90,0])cylinder(h = 50, r = 4, center = true);//Outline of circular mount

	}
}




