module instruction_memory(input [31:0]address,output [31:0]instruction);
  
  reg [31:0]mem[0:15];
  
  always @(*)
    begin
      	memory[0]  = 32'h00500093; // ADDI x1, x0, 5
        memory[1]  = 32'h00a00113; // ADDI x2, x0, 10
        memory[2]  = 32'h002081b3; // ADD x3, x1, x2
        memory[3]  = 32'h40110233; // SUB x4, x2, x1
        memory[4]  = 32'h0021a2b3; // AND x5, x1, x2
        memory[5]  = 32'h0021b333; // OR x6, x1, x2
        memory[6]  = 32'h0021c3b3; // XOR x7, x1, x2
    end
  assign instruction=memory[address[5:2]];//Memory in Verilog is indexed by word, not byte so we divide the byte address by 4 it means first 2 bits are zeros
endmodule
