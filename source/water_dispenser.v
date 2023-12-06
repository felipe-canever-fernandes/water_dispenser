module water_dispenser
(
	clock,
	reset,
	
	switches,
	
	button_add,
	button_ok,
	button_cancel,
	
	total_amount
);
		// Constantes
		
		localparam CLOCK_PERIOD_IN_NS = 20;
		
		localparam SWITCH_COUNT = 10;
		localparam MAXIMUM_DIGIT_COUNT = 4;
		
		localparam MAXIMUM_VOLUME_IN_ML = 9999;
		
		localparam COUNTER_BIT_COUNT = $clog2(MAXIMUM_VOLUME_IN_ML);
		
		localparam TIMER_TIME_IN_NS = 160;
		
		// Entradas

		input wire clock;
		input wire reset;
		
		// Di­gitos de 0 a 9
		input wire [SWITCH_COUNT - 1 : 0] switches;
		
		input wire button_add;
		input wire button_ok;
		input wire button_cancel;
		
		// Saidas

		// A quantidade de agua em mL inserida
		output integer total_amount;
		
		
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
		
		wire [COUNTER_BIT_COUNT - 1 : 0] count;
		reg should_reset_counter;
		
		counter
		#(.BIT_COUNT(COUNTER_BIT_COUNT))
		timer
		(
			.clock(clock),
			.reset(should_reset_counter),
			
			.count(count)
		);
		
		localparam READING_INPUT = 1'b0;
		localparam DISPENSING = 1'b1;
		
		reg current_state;
		
		
		initial begin
			current_state <= READING_INPUT;
		
			total_amount <= 0;
			added_digit_count <= 0;
		end
		
		
		always @(posedge clock or posedge reset) begin
			if (reset == 1) begin
				current_state <= READING_INPUT;
			
				total_amount <= 0;
				added_digit_count <= 0;
			end
			else begin
				case (current_state)
					READING_INPUT:
						if (button_cancel_was_pressed) begin
							total_amount <= 0;
							added_digit_count <= 0;
						end
						else if (button_ok_was_pressed && total_amount > 0) begin
							current_state <= DISPENSING;
							should_reset_counter = 1;
						end
						// Se o botão for pressionado e houver espaco no visor...
						else if (button_add_was_pressed && added_digit_count < MAXIMUM_DIGIT_COUNT) begin
							has_added_digit = 0;
						
							// Passar por todos os interruptores.
							for (i = 0; i < SWITCH_COUNT; i = i + 1) begin
								// Se o interruptor estiver acionado...
								if (!has_added_digit && switches[i] == 1) begin
									// Adicionar o di­gito correspondente ao total.
									total_amount <= total_amount * 10 + i;
									
									// Ignorar os interruptores mais significativos que este.
									has_added_digit = 1;
									// Registrar que mais um di­gito foi inserido.
									added_digit_count <= added_digit_count + 1;
								end
							end
						end
					DISPENSING:
						begin
							should_reset_counter = 0;
						
							if (count >= TIMER_TIME_IN_NS / CLOCK_PERIOD_IN_NS) begin
								total_amount <= 0;
								current_state <= READING_INPUT;
							end
						end
				endcase
			end
		end
endmodule
