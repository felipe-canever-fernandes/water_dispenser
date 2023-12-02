`timescale 1ms/1us

module water_dispenser_testbench;
  reg clock;
  wire integer counter;
  
  water_dispenser dispenser
  (
    .clock(clock),
    .counter(counter)
  );
  
  initial begin
    clock = 0;
    
    forever begin
      #1;
      clock = ~clock;
    end
  end
endmodule
