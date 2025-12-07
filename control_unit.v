module control_unit(
    input [6:0] opcode,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
  output reg [3:0] alu_op,
    output reg Branch
);

always @(*) begin
    // Default values
    RegWrite = 0;
    MemRead  = 0;
    MemWrite = 0;
    MemToReg = 0;
    ALUOp    = 4'b0000;
    Branch   = 0;

    case(opcode)
        7'b0110011: begin  // R-type
            RegWrite = 1;
            ALUOp    = 4'b0010; // Example code for ALU to decode ADD/SUB/AND/OR
            MemToReg = 0;
        end
        7'b0010011: begin  // I-type (ADDI etc.)
            RegWrite = 1;
            ALUOp    = 4'b0011;
            MemToReg = 0;
        end
        7'b0000011: begin  // Load (LW)
            RegWrite = 1;
            MemRead  = 1;
            MemToReg = 1;   // Select memory output
            ALUOp    = 4'b0000; // ADD for address calculation
        end
        7'b0100011: begin  // Store (SW)
            MemWrite = 1;
            ALUOp    = 4'b0000; // ADD for address calculation
        end
        7'b1100011: begin  // Branch (BEQ/BNE)
            Branch = 1;
            ALUOp  = 4'b0001; // SUB to check zero flag
        end
        default: begin
            // NOP or unsupported opcode
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 0;
            MemToReg = 0;
            ALUOp    = 4'b0000;
            Branch   = 0;
        end
    endcase
end

endmodule
