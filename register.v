module register(clk,rst,rs1,rs2,rd,write_en,write_data,read_data1,read_data2);
  input clk,rst,write_en;
  input [4:0]rs1,rs2,rd;
  input [31:0]write_data;
  output [31:0]read_data1,read_data2;
  
  reg [31:0]mem[31:0];
  
  assign read_data1=(rs1)?mem[rs1]:32'b0;
  assign read_data2=(rs2)?mem[rs2]:32'b0;
  
  always @(posedge clk,posedge rst)
    begin
      if(rst)
        for(i=0;i<16;i=i+1)
          mem[i]<=0;
      else
        if(write_en && rd!=5'd0)
        	mem[rd]<=write_data;
    end
endmodule
