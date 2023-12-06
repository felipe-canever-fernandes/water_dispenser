`timescale 10ns/1ns

module water_dispenser_testbench;
  localparam SWITCH_COUNT = 10;
  
  reg clock;
	reg reset;
	
	reg [SWITCH_COUNT - 1 : 0] switches;
	
	reg button_add;
	reg button_ok;
	reg button_cancel;
  
  wire current_state;
  wire integer total_amount_in_ml;
  
  water_dispenser
  #(.NS_PER_ML(1))
  dispenser
  (
    .clock(clock),
	  .reset(reset),
	
	  .switches(switches),
	
	  .button_add(button_add),
	  .button_ok(button_ok),
	  .button_cancel(button_cancel),
	
	   .current_state(current_state),
	  .total_amount_in_ml(total_amount_in_ml)
  );
  
  initial begin
    clock = 0;
	  reset = 0;
	
	  switches = 0;
	
	  button_add = 1;
	  button_ok = 1;
	  button_cancel = 1;
  end
  
  always #1 begin
    clock = ~clock;
  end
  
  initial begin
    // Inicializacao
    reset = 1;
    # 7;
    reset = 0;
    
    // Numero maximo de digitos
    
    // 1
    #15;
    switches[3] = 1;
    #14;
    button_add = 0;
    #9;
    button_add = 1;
    #8;
    switches[3] = 0;
    
    // 2
    #5;
    switches[1] = 1;
    #14;
    button_add = 0;
    #9;
    button_add = 1;
    #8;
    switches[1] = 0;
    
    // 3
    #10;
    switches[9] = 1;
    #6;
    button_add = 0;
    #20;
    button_add = 1;
    #10;
    switches[9] = 0;
    
    // 4
    #13;
    switches[0] = 1;
    #5;
    button_add = 0;
    #10;
    button_add = 1;
    #4;
    switches[0] = 0;
    
    // 5 - deve ser ignorado
    #9;
    switches[6] = 1;
    #11;
    button_add = 0;
    #12;
    button_add = 1;
    #5;
    switches[6] = 0;
    
    // 6 - deve ser ignorado
    #9;
    switches[4] = 1;
    #11;
    button_add = 0;
    #12;
    button_add = 1;
    #5;
    switches[4] = 0;
    
    // Zerar quantidade
    #8;
    button_cancel = 0;
    #14;
    button_cancel = 1;
    
    // Se mais de um digito estiver pressionado,
    // inserir o menor
    
   
// 8, (3), 6
   
#5;
    switches[8] = 1;
    #5;
    switches[3] = 1;
    #5;
    switches[6] = 1;
    #11;
    button_add = 0;
    #12;
    button_add = 1;
    #7;
    switches[8] = 0;
    #5;
    switches[3] = 0;
    #5;
    switches[6] = 0;
    
   
// 9, 5, (0)
   
#5;
    switches[9] = 1;
    #5;
    switches[5] = 1;
    #5;
    switches[0] = 1;
    #11;
    button_add = 0;
    #12;
    button_add = 1;
    #7;
    switches[9] = 0;
    #5;
    switches[5] = 0;
    #5;
    switches[0] = 0;
    
    // Zerar quantidade
    #4;
    button_cancel = 0;
    #14;
    button_cancel = 1;
    
    // Nao deve tentar despejar 0 ml
    
    // 0
    #5;
    switches[0] = 1;
    #14;
    button_add = 0;
    #9;
    button_add = 1;
    #8;
    switches[0] = 0;
    
    // 0
    #12;
    switches[0] = 1;
    #5;
    button_add = 0;
    #6;
    button_add = 1;
    #7;
    switches[0] = 0;
    
    // OK
    #7;
    button_ok = 0;
    #8;
    button_ok = 1;
    
    // Despejar 640 ml
    
    // 6
    #15;
    switches[6] = 1;
    #14;
    button_add = 0;
    #9;
    button_add = 1;
    #8;
    switches[6] = 0;
    
    // 4
    #5;
    switches[4] = 1;
    #14;
    button_add = 0;
    #9;
    button_add = 1;
    #8;
    switches[4] = 0;
    
    // 0
    #10;
    switches[0] = 1;
    #6;
    button_add = 0;
    #12;
    button_add = 1;
    #10;
    switches[0] = 0;
    
    // OK
    #15;
    button_ok = 0;
    #13;
    button_ok = 1;
    
    // Cancelar
    #25;
    button_cancel = 0;
    #5;
    button_cancel = 1;
    
    // Despejar 1380 ml
    
    // 1
    #15;
    switches[1] = 1;
    #14;
    button_add = 0;
    #9;
    button_add = 1;
    #8;
    switches[1] = 0;
    
    // 3
    #5;
    switches[3] = 1;
    #14;
    button_add = 0;
    #9;
    button_add = 1;
    #8;
    switches[3] = 0;
    
    // 8
    #10;
    switches[8] = 1;
    #6;
    button_add = 0;
    #12;
    button_add = 1;
    #10;
    switches[8] = 0;
    
    // 0
    #10;
    switches[0] = 1;
    #6;
    button_add = 0;
    #12;
    button_add = 1;
    #10;
    switches[0] = 0;
    
    // OK
    #15;
    button_ok = 0;
    #13;
    button_ok = 1;
    
    // Pressionar outros botoes nao deve interromper o processo
    
     // 8
    #10;
    switches[8] = 1;
    #6;
    button_add = 0;
    #12;
    button_add = 1;
    #10;
    switches[8] = 0;
    
    // 0
    #10;
    switches[0] = 1;
    #6;
    button_add = 0;
    #12;
    button_add = 1;
    #10;
    switches[0] = 0;
    
    // OK
    #15;
    button_ok = 0;
    #13;
    button_ok = 1;
  end
endmodule
