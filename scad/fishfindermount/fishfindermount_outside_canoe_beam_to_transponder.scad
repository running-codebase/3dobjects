
rotate([90,0,0])difference() {
	union() {
		cube ([140,7,20], center = true); //Base shape
		translate([50,0,0])cube ([40,7,40], center = true); //Transponder mount section
		//translate([70,0,0])rotate([90,0,0])cylinder(h = 7, r = 10, center = true);	
		translate([-70,0,0])rotate([90,0,0])cylinder(h = 7, r = 10, center = true);	
	}
	union() {
		//Holes
		//translate([70,-10,0])rotate([90,0,0])cylinder(h = 40, r = 4, center = true);
		translate([50,-10,-7.5])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);		
		translate([50,-10, 7.5])rotate([90,0,0])cylinder(h = 40, r = 2, center = true);		
		translate([-70,-10,0])rotate([90,0,0])cylinder(h = 40, r = 4, center = true);	
	} 
}
