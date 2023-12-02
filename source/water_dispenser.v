module water_dispenser
(
	x,
	y,
	
	z
);
	input x;
	input y;

	output z;

	or(z, x, y);
endmodule
