module counter
#(
	parameter BIT_COUNT
)
(
	clock,
	reset,
	is_enabled,
	
	count
);
	input wire clock;
	input wire reset;
	input wire is_enabled;
	
	output reg [BIT_COUNT - 1 : 0] count;
	
	always @(posedge clock or posedge reset) begin
		if (reset == 1) begin
			count <= 0;
		end
		else if (is_enabled == 1) begin
			count <= count + 1;
		end
	end
endmodule
