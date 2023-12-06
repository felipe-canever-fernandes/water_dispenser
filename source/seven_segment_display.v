module seven_segment_display
(
	value,
	display
);

	input [15:0] value;
	output reg [7:0] display;
	
	always @(value) begin
		case (value)
			//					   0123 456.
			0:	display <=	8'b1100_0000;
			1:	display <=	8'b1111_1001;
			2: display <=  8'b1010_0100;
			3: display <=  8'b1011_0000;
			4: display <=  8'b1001_1001;
			5: display <=  8'b1001_0010;
			6: display <=  8'b1000_0010;
			7: display <=  8'b1111_1000;
			8: display <=  8'b1000_0000;
			9: display <=  8'b1001_0000;
			default: display <= 8'b1111_1111;
		endcase
	end

endmodule
