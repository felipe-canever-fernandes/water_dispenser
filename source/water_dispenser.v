module water_dispenser
#(parameter NS_PER_ML = 100)
(
	clock,
	reset,
	
	switches,
	
	button_add,
	button_ok,
	button_cancel,
	
	current_state,
	total_amount_in_ml
);
		localparam CLOCK_PERIOD_IN_NS = 20;
		
		localparam SWITCH_COUNT = 10;
		localparam MAXIMUM_DIGIT_COUNT = 4;
		
		localparam MAXIMUM_VOLUME_IN_ML = 9999;
		
		localparam COUNTER_BIT_COUNT = $clog2(MAXIMUM_VOLUME_IN_ML);

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
		wire [COUNTER_BIT_COUNT - 1 : 0] count;
		
		counter
		#(.BIT_COUNT(COUNTER_BIT_COUNT))
		timer
		(
			.clock(clock),
			.reset(should_reset_counter),
			.is_enabled(is_timer_enabled),
			
			.count(count)
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
endmodule
