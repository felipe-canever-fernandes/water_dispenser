module water_dispenser
(
	clock,
	reset,
	
	counter
);
		input wire clock;
		input wire reset;
		
		output integer counter;
		
		initial begin
			counter = 0;
		end
		
		always @(posedge clock or posedge reset) begin
			if (reset == 1) begin
				counter = 0;
			end
			else begin
				counter = counter + 1;
			end
		end
endmodule
