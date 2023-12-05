`timescale 10ns/1ns

module water_dispenser_testbench;
  localparam SWITCH_COUNT = 10;
  
  reg clock;
	reg reset;
	
	reg [SWITCH_COUNT - 1 : 0] switches;
	
	reg button_add;
	reg button_ok;
	reg button_cancel;
  
  wire integer total_amount;
  
  water_dispenser dispenser
  (
    .clock(clock),
	  .reset(reset),
	
	  .switches(switches),
	
	  .button_add(button_add),
	  .button_ok(button_ok),
	  .button_cancel(button_cancel),
	
	  .total_amount(total_amount)
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
    #9;
    
    // 1
    switches[1] = 1;
    button_add = 0;
    
    #10;
    
    switches[1] = 0;
    button_add = 1;
    
    #5;
    
    // 9
    switches[9] = 1;
    button_add = 0;
    
    #9;
    
    switches[9] = 0;
    button_add = 1;
    
    #6;
    
    // 9
    switches[9] = 1;
    button_add = 0;
    
    #7;
    
    switches[9] = 0;
    button_add = 1;
    
    #8;
    
    // 3
    switches[3] = 1;
    button_add = 0;
    
    #15;
    
    switches[3] = 0;
    button_add = 1;
    
    #5;
    
    //
    switches[5] = 1;
    button_add = 0;
    
    #12;
    
    switches[5] = 0;
    button_add = 1;
    
    #9;
    
    button_cancel = 1;
    #9;
    button_cancel = 0;
    
    #15;
    
    
    // 1
    switches[1] = 1;
    button_add = 0;
    
    #10;
    
    switches[1] = 0;
    button_add = 1;
    
    #5;
    
    // 9
    switches[9] = 1;
    button_add = 0;
    
    #9;
    
    switches[9] = 0;
    button_add = 1;
    
    #6;
    
    // 9
    switches[9] = 1;
    button_add = 0;
    
    #7;
    
    switches[9] = 0;
    button_add = 1;
    
    #8;
  
    
    button_cancel = 1;
    #11;
    button_cancel = 0;
    
    #7;
    
    button_ok = 0;
    #8;
    button_ok = 1;
    
    #7
    
    
    // 3
    switches[3] = 1;
    button_add = 0;
    
    #15;
    
    switches[3] = 0;
    button_add = 1;
    
    #5;
    
    //
    switches[5] = 1;
    button_add = 0;
    
    #12;
    
    switches[5] = 0;
    button_add = 1;
    
    
    #10;
    
    button_ok = 0;
    #8;
    button_ok = 1;
    
    #8;
    
    // 1
    switches[1] = 1;
    button_add = 0;
    
    #10;
    
    switches[1] = 0;
    button_add = 1;
    
    #5;
    
    // 9
    switches[9] = 1;
    button_add = 0;
    
    #9;
    
    switches[9] = 0;
    button_add = 1;
  end
endmodule
