`timescale 1ms/1us

module water_dispenser_testbench;
  reg x;
  reg y;
  
  wire z;
  
  reg [1:0] i;
  reg [1:0] j;
  
  water_dispenser dispenser
  (
    .x(x),
    .y(y),
    
    .z(z)
  );
  
  initial begin
    for (i = 0; i <= 1; i = i + 1) begin
      for (j = 0; j <= 1; j = j + 1) begin
        $display("%b, %b", i, j);
        
        x = i;
        y = j;
        
        #1;
      end 
    end
  end
endmodule
