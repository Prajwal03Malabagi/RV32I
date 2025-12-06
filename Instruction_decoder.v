module instruction_decoder(instruction,opcode,rd,fun3,rs1,rs2,fun7,imm_i,imm_s,imm_b,imm_u,imm_j);
  input [31:0]instruction;
  output [6:0]opcode;      // for general instruction without imm
  output [5:0]rd;
  output [2:0]fun3;
  output [5:0]rs2;
  output [5:0]rs1;
  output [7:0]fun7;
  
  // for instruction format which has immediate
  output imm_i;
  output imm_s;
  output imm_b;
  output imm_u;
  output imm_j;
  
  assign opcode=instruction[6:0];
  assign rd=instruction[11:7];
  assign fun3=instruction[14:12];
  assign rs1=instruction[19:15];
  assign rs2=instruction[24:20];
  assign fun3=instruction[31:25];
  
  assign imm_i={{20{instruction[31]}},instruction[31:20]};//imm is of 12 bit so padd at msb to make 32 bit
  assign imm_s={{20{instruction[31]}},instruction[31:25],instruction[11:7]};
  assign imm_b={{19{instruction[31]}},instruction[31],instruction[30:25],instruction[11:8],instruction[7],1'b0};//lsb is zero any way so no need use extra bit
  assign imm_u={{instruction[31:12]},12'b0};//we use only upper bit so make remaining bit zero at lsb
  assign imm_j={{11{instruction[31]}},instruction[31],instruction[30:21],instruction[20],instruction[19:12],1'b0};//lsb is zero any way so no need use extra bit
  
endmodule
                
