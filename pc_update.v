module next_pc(
    input [31:0] c_pc,
    input [31:0] imm_b,
    input zero,
    input Branch,
    output [31:0] next_pc
);
    wire [31:0] pc_plus4;
    wire [31:0] branch_target;

    assign pc_plus4 = c_pc + 4;
    assign branch_target = c_pc + imm_b;

    // If branch instruction and condition met, take branch; else sequential
    assign next_pc = (Branch && zero) ? branch_target : pc_plus4;
endmodule
