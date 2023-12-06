module button
(
	clock,
	reset,
	
	button_value,
	
	negative_edge_detected
);
	input clock;
	input reset;
	
	input button_value;
	
	output reg negative_edge_detected;

	reg previous_button_value;

	always @(posedge clock or posedge reset) begin
		if (reset == 1)
			negative_edge_detected <= 0;
		else begin
			if (previous_button_value == 1 && button_value == 0)
				negative_edge_detected <= 1;
			else
				negative_edge_detected <= 0;
				
			previous_button_value <= button_value;
		end
	end
endmodule
