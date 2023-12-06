module water_dispenser
#(parameter NS_PER_ML = 64'd1000000)
(
	clock,
	reset,
	
	switches,
	
	button_add,
	button_ok,
	button_cancel,
	
	current_state,
	total_amount_in_ml,
	
	display0,
	display1,
	display2,
	display3
);
		localparam CLOCK_PERIOD_IN_NS = 20;
		
		localparam SWITCH_COUNT = 10;
		localparam MAXIMUM_DIGIT_COUNT = 4;
		
		localparam MAXIMUM_VOLUME_IN_ML = 9999;

		input wire clock;
		input wire reset;
		
		input wire [SWITCH_COUNT - 1 : 0] switches;
		
		input wire button_add;
		input wire button_ok;
		input wire button_cancel;
		
		output reg current_state;
		output integer total_amount_in_ml;
		
		
		integer i;
		reg has_added_digit;
		integer added_digit_count;
		
		wire button_add_was_pressed;
		
		button btn_add
		(
			.clock(clock),
			.reset(reset),
			
			.button_value(button_add),
			
			.negative_edge_detected(button_add_was_pressed)
		);
		
		wire button_cancel_was_pressed;
		
		button btn_cancel
		(
			.clock(clock),
			.reset(reset),
			
			.button_value(button_cancel),
			
			.negative_edge_detected(button_cancel_was_pressed)
		);
		
		wire button_ok_was_pressed;
		
		button btn_ok
		(
			.clock(clock),
			.reset(reset),
			
			.button_value(button_ok),
			
			.negative_edge_detected(button_ok_was_pressed)
		);
		
		reg should_reset_counter;
		reg is_timer_enabled;
		wire [64 - 1 : 0] count;
		
		counter
		#(.BIT_COUNT(64))
		timer
		(
			.clock(clock),
			.reset(should_reset_counter),
			.is_enabled(is_timer_enabled),
			
			.count(count)
		);
		
		reg [15:0] value0;
		output [7:0] display0;
		
		reg [15:0] value1;
		output [7:0] display1;
		
		reg [15:0] value2;
		output [7:0] display2;
		
		reg [15:0] value3;
		output [7:0] display3;
		
		seven_segment_display ssd0
		(
			.value(value0),
			.display(display0)
		);
		
		seven_segment_display ssd1
		(
			.value(value1),
			.display(display1)
		);
		
		seven_segment_display ssd2
		(
			.value(value2),
			.display(display2)
		);
		
		seven_segment_display ssd3
		(
			.value(value3),
			.display(display3)
		);
		
		localparam READING_INPUT = 1'b0;
		localparam DISPENSING = 1'b1;
		
		always @(posedge clock or posedge reset) begin	
			if (reset == 1) begin
				current_state <= READING_INPUT;
				
				is_timer_enabled <= 0;
			
				total_amount_in_ml <= 0;
				added_digit_count <= 0;
			end
			else begin
				case (current_state)
					READING_INPUT:
						if (button_cancel_was_pressed) begin
							total_amount_in_ml <= 0;
							added_digit_count <= 0;
						end
						else if (button_ok_was_pressed && total_amount_in_ml > 0) begin
							current_state <= DISPENSING;
							should_reset_counter = 1;
						end
						else if (button_add_was_pressed && added_digit_count < MAXIMUM_DIGIT_COUNT) begin
							has_added_digit = 0;
						
							for (i = 0; i < SWITCH_COUNT; i = i + 1) begin
								if (!has_added_digit && switches[i] == 1) begin
									total_amount_in_ml <= total_amount_in_ml * 10 + i;
									
									has_added_digit = 1;
									
									if (total_amount_in_ml != 0) begin
										added_digit_count <= added_digit_count + 1;
									end
								end
							end
						end
					DISPENSING:
						begin
							should_reset_counter = 0;
							is_timer_enabled <= 1;
						
							if (button_cancel_was_pressed || count >= total_amount_in_ml * NS_PER_ML / CLOCK_PERIOD_IN_NS) begin
								total_amount_in_ml <= 0;
								added_digit_count <= 0;
								
								is_timer_enabled <= 0;
								
								current_state <= READING_INPUT;
							end
						end
				endcase
			end
		end
		
		always @(total_amount_in_ml) begin
			value3 = total_amount_in_ml / 1000;
			value2 = (total_amount_in_ml - value3 * 1000) / 100;
			value1 = (total_amount_in_ml - value3 * 1000 - value2 * 100) / 10;
			value0 = (total_amount_in_ml - value3 * 1000 - value2 * 100 - value1 * 10);
		end
endmodule
