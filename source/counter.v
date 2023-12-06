module counter
#(
	parameter BIT_COUNT
)
(
	clock,
	reset,
	
	count
);
	input wire clock;
	input wire reset;
	
	output reg [BIT_COUNT - 1 : 0] count;
	
	always @(posedge clock or posedge reset) begin
		if (reset == 1) begin
			count <= 0;
		end
		else begin
			count <= count + 1;
		end
	end
endmodule
