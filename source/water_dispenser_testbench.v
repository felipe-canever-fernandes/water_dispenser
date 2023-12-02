`timescale 1ms/1us

module water_dispenser_testbench;
  parameter SWITCH_COUNT = 10;
  
  reg clock;
	reg reset;
	
	reg [SWITCH_COUNT - 1 : 0] switches;
	
	reg button_add;
	reg button_ok;
	reg button_cancel;
  
  wire integer total_time;
  
  water_dispenser dispenser
  (
    .clock(clock),
	  .reset(reset),
	
	  .switches(switches),
	
	  .button_add(button_add),
	  .button_ok(button_ok),
	  .button_cancel(button_cancel),
	
	  .total_time(total_time)
  );
  
  initial begin
    clock = 0;
	  reset = 0;
	
	  switches = 0;
	
	  button_add = 0;
	  button_ok = 0;
	  button_cancel = 0;
  end
  
  always #1 begin
    clock = ~clock;
  end
  
  initial begin
    #9;
    
    // 1
    switches[1] = 1;
    button_add = 1;
    
    #1;
    
    switches[1] = 0;
    button_add = 0;
    
    #1;
    
    // 9
    switches[9] = 1;
    button_add = 1;
    
    #1;
    
    switches[9] = 0;
    button_add = 0;
    
    #1;
    
    // 9
    switches[9] = 1;
    button_add = 1;
    
    #1;
    
    switches[9] = 0;
    button_add = 0;
    
    #1;
    
    // 3
    switches[3] = 1;
    button_add = 1;
    
    #1;
    
    switches[3] = 0;
    button_add = 0;
    
    #1;
    
    //
    switches[5] = 1;
    button_add = 1;
    
    #1;
    
    switches[5] = 0;
    button_add = 0;
  end
endmodule
