module water_dispenser
(
	clock,
	counter
);
		input wire clock;
		output integer counter;
		
		initial begin
			counter = 0;
		end
		
		always @(posedge clock) begin
			counter = counter + 1;
		end
endmodule
