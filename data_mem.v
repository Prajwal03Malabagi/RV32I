module data_memory(
    input clk,
    input mem_read,
    input mem_write,
    input [31:0] addr,
    input [31:0] write_data,
    output reg [31:0] read_data
);//addr is result from alu and write data is rs2

  reg [31:0] dmem [0:255];   // 256 words = 1KB RAM

  // READ (asynchronous)
  always @(*) begin
    if (mem_read)
      read_data = dmem[addr[9:2]];  
    else
      read_data = 32'b0;
  end

  // WRITE (synchronous)
  always @(posedge clk) begin
    if (mem_write)
      dmem[addr[9:2]] <= write_data;
  end

endmodule
