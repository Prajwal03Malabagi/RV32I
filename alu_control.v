module alu_control(opcode,fun3,fun7,alu_op);
  input [6:0]opcode;
  input [2:0]fun3;
  input [6:0]fun7;
  output reg [3:0]alu_op;
  
  always @(*)
    begin
      case(opcode)
         7'b0110011: begin   // R-type
        case (funct3)
          3'b000: alu_op = (funct7 == 7'b0100000) ? 4'b0001 : 4'b0000; // SUB : ADD
          3'b111: alu_op = 4'b0010; // AND
          3'b110: alu_op = 4'b0011; // OR
          3'b100: alu_op = 4'b0100; // XOR
          default: alu_op = 4'b0000;
        endcase
      end

      7'b0010011: begin  // I-type (ADDI)
        case (funct3)
          3'b000: alu_op = 4'b0000; // ADDI → ADD
          default: alu_op = 4'b0000;
        endcase
      end

      default: alu_op = 4'b0000;

    endcase
  end

endmodule
