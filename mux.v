module write_back_mux(
    input [31:0] alu_result,
    input [31:0] mem_data,
    input MemToReg,
    output [31:0] write_data
);

assign write_data = (MemToReg) ? mem_data : alu_result;

endmodule
