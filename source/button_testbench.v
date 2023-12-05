`timescale 10ns/1ns

module button_testbench;
  reg clock;
  reg button_value;
  
  wire button_was_pressed;
  
  button btn
  (
    .clock(clock),
    .button_value(button_value),
    
    .negative_edge_detected(button_was_pressed)
  );
  
  initial begin
    clock = 0;
    button_value = 1;
  end
  
  always #1 begin
    clock = ~clock;
  end
  
  initial begin
    #9 button_value = 0;
    #21 button_value = 1;
    
    #10 button_value = 0;
    #15 button_value = 1;
    
    #1 button_value = 0;
    #5 button_value = 1;
  end
endmodule

