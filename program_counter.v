module program_counter(clk,reset,ps,ns);
  input clk,rst;
  input [31:0]ns;
  output reg [31:0]c_pc;
  
  always @(posedge clk,negedge rst)
    begin
      if(rst)
        c_pc<=32'b0;
      else
        c_ps<=ns;
    end
endmodule
