`timescale 1ms/1us

module water_dispenser_testbench;
  reg clock;
  reg reset;
  
  wire integer counter;
  
  water_dispenser dispenser
  (
    .clock(clock),
    .reset(reset),
    
    .counter(counter)
  );
  
  initial begin
    clock = 0;
    reset = 0;
  end
  
  always #1 begin
    clock = ~clock;
  end
  
  always #10 begin
    reset = 1;
    #1;
    reset = 0;
  end
endmodule
