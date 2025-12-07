module alu(
  input  [31:0] rs1,rs2,
    input  [3:0]  alu_op,
    output reg [31:0] result,
    output zero
);

  always @(*) begin
    case (alu_op)

      4'b0000: result = rs1 + rs2;       // ADD / ADDI
      4'b0001: result = rs1 - rs2;       // SUB
      4'b0010: result = rs1 & rs2;       // AND
      4'b0011: result = rs1 | rs2;       // OR
      4'b0100: result = rs1 ^ rs2;       // XOR

      default: result = 32'b0;

    endcase
  end

  assign zero = (result == 32'b0);

endmodule
