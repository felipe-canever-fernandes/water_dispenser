`timescale 10ns/1ns

module counter_testbench;
  localparam CLOCK_PERIOD_IN_NS = 20;
  
  localparam COUNTER_TIME_IN_NS = 360;
  localparam MAXIMUM_COUNT = COUNTER_TIME_IN_NS / CLOCK_PERIOD_IN_NS;
  
  localparam BIT_COUNT = 32;
  
  reg clock;
  reg reset;
  reg is_enabled;
  
  wire [BIT_COUNT - 1 : 0] count;
  
  counter
  #(
    .BIT_COUNT(BIT_COUNT)
  )
  c
  (
    .clock(clock),
    .reset(reset),
    
    .count(count)
  );
  
  initial begin
    clock = 0;
    reset = 0;
    is_enabled = 1;
  end
  
  always #1 begin
    clock = ~clock;
  end
  
  initial begin
    #10;
    reset = 1;
    #5;
    reset = 0;
    
    #10;
    reset = 1;
    #5;
    reset = 0;
    
    wait(count == MAXIMUM_COUNT);
    reset = 1;
    #5;
    reset = 0;
  end
endmodule

