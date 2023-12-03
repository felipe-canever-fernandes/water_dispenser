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
		
		parameter SWITCH_COUNT = 10;
		parameter MAXIMUM_DIGIT_COUNT = 4;
		
		// Entradas

		input wire clock;
		input wire reset;
		
		// Di­gitos de 0 a 9
		input wire [SWITCH_COUNT - 1 : 0] switches;
		
		input wire button_add;
		input wire button_ok;
		input wire button_cancel;

		// A quantidade de agua em mL inserida
		output integer total_amount;
		
		integer i;
		reg has_added_digit;
		integer added_digit_count;
		
		
		initial begin
			total_amount = 0;
			added_digit_count = 0;
		end
		
		
		always @(posedge clock or posedge reset) begin
			if (reset == 1) begin
				total_amount = 0;
				added_digit_count = 0;
			end
			else begin
				// Se houver espaco no visor...
				if (added_digit_count < MAXIMUM_DIGIT_COUNT) begin
					has_added_digit = 0;
				
					// Passar por todos os interruptores.
					for (i = 0; i < SWITCH_COUNT; i = i + 1) begin
						// Se o interruptor estiver acionado...
						if (!has_added_digit && switches[i] == 1) begin
							// Adicionar o di­gito correspondente ao total.
							total_amount = total_amount * 10 + i;
							
							// Ignorar os interruptores mais significativos que este.
							has_added_digit = 1;
							// Registrar que mais um di­gito foi inserido.
							added_digit_count = added_digit_count + 1;
						end
					end
				end
			end
		end
endmodule
