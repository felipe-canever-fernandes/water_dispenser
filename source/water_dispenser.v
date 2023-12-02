module water_dispenser
(
	clock,
	reset,
	
	switches,
	
	button_add,
	button_ok,
	button_cancel,
	
	total_time
);
		parameter SWITCH_COUNT = 10;
		parameter MAXIMUM_DIGIT_COUNT = 4;
		

		input wire clock;
		input wire reset;
		
		input wire [SWITCH_COUNT - 1 : 0] switches;
		
		input wire button_add;
		input wire button_ok;
		input wire button_cancel;

		
		output integer total_time;
		
		integer i;
		reg has_added_digit;
		integer added_digit_count;
		
		
		initial begin
			total_time = 0;
			added_digit_count = 0;
		end
		
		
		always @(posedge clock or posedge reset) begin
			if (reset == 1) begin
				total_time = 0;
				added_digit_count = 0;
			end
			else begin
				// Se houver espaço no visor...
				if (added_digit_count < MAXIMUM_DIGIT_COUNT) begin
					has_added_digit = 0;
				
					// Passar por todos os interruptores.
					for (i = 0; i < SWITCH_COUNT; i = i + 1) begin
						// Se o interruptor estiver acionado...
						if (!has_added_digit && switches[i] == 1) begin
							// Adicionar o dígito correspondente ao total.
							total_time = total_time * 10 + i;
							
							// Ignorar os interruptores mais significativos que este.
							has_added_digit = 1;
							added_digit_count = added_digit_count + 1;
						end
					end
				end
			end
		end
endmodule
