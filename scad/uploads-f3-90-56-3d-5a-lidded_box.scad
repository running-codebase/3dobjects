// Parameterized box generator
// Written by Brad Koehn
// Requires OpenSCAD 2014.03 or newer

// box dimensions
// typically you want the height < length < width
box_length = 20; // x axis
box_width = 30;  // y axis
box_height = 10; // z axis

// width of all walls and lid
wall_width = 1.5;

// how far from the top of the box the lid notch should go
notch_height = 4;

// how deep into the wall the lid notch should go
notch_depth = wall_width / 2;

// diameter of button on lid; set to 0 for no button
button_diameter = box_length / 6;

// height of button on lid
button_height = wall_width / 2;

// the box
translate([0, 0, box_height / 2])
difference () {
	// our solid box
	cube([box_length, box_width, box_height], center = true);

	// remove the inside
	translate([0, 0, wall_width / 2])
		cube([box_length - wall_width * 2, box_width - wall_width * 2, box_height - wall_width], center = true);
	
	// remove notch for lid
	translate([0, 0, box_height / 2 - notch_height / 2])
		lid();

	// remove the unnecessary part of box where the lid slides in
	translate([0, wall_width / 2, box_height / 2 ])
		cube([box_length - wall_width * 2, box_width - wall_width, notch_height], center = true);
};


// the lid
translate([box_length + 4, 0, wall_width / 2]) 
	lid();

module lid() { 
	union() {
		polyhedron(
			points = [
				// top points, clockwise starting at max x, max y
				[box_length / 2 - wall_width, box_width / 2, notch_depth], // 0
				[box_length / 2 - wall_width, -(box_width / 2 - wall_width), notch_depth], // 1
				[-(box_length / 2 - wall_width), -(box_width / 2 - wall_width), notch_depth], // 2
				[-(box_length / 2 - wall_width), box_width / 2, notch_depth], // 3		

				// middle points, clockwise starting at max x, max y
				[box_length / 2 - wall_width + notch_depth, box_width / 2, 0], // 4
				[box_length / 2 - wall_width + notch_depth, -(box_width / 2 - wall_width + notch_depth), 0], // 5
				[-(box_length / 2 - wall_width  + notch_depth), -(box_width / 2 - wall_width + notch_depth), 0], // 6
				[-(box_length / 2 - wall_width  + notch_depth), box_width / 2, 0], // 7

				// bottom points, clockwise starting at max x, max y
				[box_length / 2 - wall_width, box_width / 2, -notch_depth], // 8
				[box_length / 2 - wall_width, -(box_width / 2 - wall_width), -notch_depth], // 9
				[-(box_length / 2 - wall_width), -(box_width / 2 - wall_width), -notch_depth], // 10
				[-(box_length / 2 - wall_width), box_width / 2, -notch_depth], // 11
			],
			faces = [
				[0, 1, 2, 3], // top face	

				[0, 4, 5, 1], // left top notch
				[1, 5, 6, 2], // back top notch
				[3, 2, 6, 7], // right top notch

				[4, 8, 9, 5], // left bottom notch
				[5, 9, 10, 6], // back botton notch
				[7, 6, 10, 11], // right bottom notch

				[11, 10, 9, 8], // bottom face

				[0, 3, 7, 11, 8, 4] // front face
			]
		);
	
		translate([0, box_width / 2 - button_diameter, wall_width / 2])
			cylinder(
				d = button_diameter,
				h = button_height
			);
	};
}



