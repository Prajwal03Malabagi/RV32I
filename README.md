# RV32I
Block 1                  -----------------  Program counter-----------------------

Holds the address of the current instruction(with respect to clock).
The calculation of next_pc (increment by 4, branch/jump target) happens outside the PC module.
->Every instruction fetch depends on the PC. Without it, you can’t get instructions from memory.


Block 2                 ---------------   Instruction Memory   --------------------------------

Holds all program instructions. The CPU reads a 32-bit instruction at the address specified by the PC.
input - address from program counter block
output - 32 bit instruction

How It Works

->The PC provides the address of the instruction to fetch.
->Instruction memory outputs the 32-bit instruction stored at that address.
->We use address[5:2] because instructions are word-aligned (4 bytes per instruction).

For a simple single-cycle CPU,No clock is strictly needed if the memory is combinational.

we need add the storage instruction manually, the value are given like 32'h002081b3. This value we got by refering the RISC V ISA ( Instruction Format) 
for ex : [31:25] funct7    (7 bits)
[24:20] rs2       (5 bits)
[19:15] rs1       (5 bits)
[14:12] funct3    (3 bits)
[11:7]  rd        (5 bits)
[6:0]   opcode    (7 bits)
the opcode- Each Instruction has different opcode, func3 & func7 depend which type of operation to be done, rs1 -value is 1, rs2- value is 2, rd- value is 3.


Block 3              --------------------- Instruction decoder or control unit--------------------

Instruction decoder performs 5 major tasks:

1️ Instruction Field Extraction - What operation to do
2️ Register File Read - Once we extract rs1 and rs2, we pass these addresses to the register file.
3️ Immediate Generation - ImmGen extracts and sign-extends the immediate according to the type.
4️ Control Signal Generation - Control unit checks only the opcode, and decides:
5️ Hazard Check (only in pipelined processors)

WHAT IS AN INSTRUCTION DECODER?

This block takes a 32-bit instruction (binary machine code)from instruction memory and extracts: opcode,rd,rs1,rs2,funct3,funct7 immediate value (depends on type). Now assign the the extracted to the instruction bit(input) according to ISA given Register Format and for the type which have immediate use the sign extention add extra bit to msb if msb is 1 add 1 if 0 add 0(make 32 bit)(for the type i & s), for the type(B & j lsb will be zero so why waste 1 extra bit so make lsb as 0 and then add remaining extra bit to msb) and for u type we use only upper bit so make remaining bit 0 at lsb.

note-> the opcode,rd,rs1,rs2,funct3,funct7 are the code for alu but immediate is a constant value so we make it 32 bit as alu is of 32-bit.

Block 4          ------------------------  Register  ----------------

Register File stores 32 registers (x0 to x31) Each register is 32 bits.


Block 1                   -------------       ALU        -------------------

The RV32I is the 32-bit RISC-V base integer instruction set, a foundational collection of around 40 fixed-length (32-bit) instructions for basic arithmetic (ADD, SUB, XOR, AND, OR), logical shifts (SLL, SRL, SRA), comparisons (SLT, SLTU), loads/stores (LB, LH, LW, SB, SH, SW), jumps (JAL, JALR), and branches (BEQ, BNE, BLT, BGE, BLTU, BGEU). It defines core operations for processors, with instructions categorized into R-type (registers), I-type (immediate), S-type (store), B-type (branch), U-type (upper immediate), and J-type (jump) formats, all 32 bits long. 

Key Categories & Examples:
Integer Arithmetic: ADD, SUB, AND, OR, XOR, SLT (Set Less Than), SLTU (Unsigned), SLL (Shift Left Logical), SRL (Shift Right Logical), SRA (Shift Right Arithmetic).
Control Flow: JAL (Jump and Link), JALR (Jump and Link Register), BEQ (Branch Equal), BNE (Branch Not Equal), BLT (Branch Less Than), BGE (Branch Greater or Equal).
Memory Access: LW (Load Word), SW (Store Word), LH (Load Halfword), SH (Store Halfword), LB (Load Byte), SB (Store Byte).
Immediate Operations: ADDI, SLTI, SLTIU, ANDI, ORI, XORI, SLLI, SRLI, SRAI, LUI (Load Upper Immediate).
System/Environment: ECALL (Environment Call), EBREAK (Environment Break), FENCE (Memory Fence). 

Core Concepts:
Registers: Uses 32 general-purpose 32-bit registers (x0-x31), with x0 hardwired to zero.
Instruction Formats: Fixed 32-bit length, using R, I, S, B, U, J formats for encoding operands.
Word Alignment: Instructions must align on 4-byte (32-bit) boundaries. 

You do NOT implement 40 ALU operations.
You only implement about 10–12 low-level hardware operations, and all instructions (ADD, ADDI, BEQ, LW, SW, etc.) get mapped onto these core ALU ops.

If you implement these 12 operations, your CPU will run all base instructions.

1. ADD

For: ADD, ADDI, LOAD, STORE, JALR, PC + Immediate

2. SUB

For: SUB, BRANCH (BEQ, BNE, BLT, BGE…)

3. AND

For: AND, ANDI

4. OR

For: OR, ORI

5. XOR

For: XOR, XORI

6. SLL (Shift Left Logical)

For: SLL, SLLI

7. SRL (Shift Right Logical)

For: SRL, SRLI

8. SRA (Shift Right Arithmetic)

For: SRA, SRAI (sign-extended right shift)

9. SLT (Set Less Than, signed)

For: SLT, SLTI

10. SLTU (Set Less Than Unsigned)

For: SLTU, SLTIU

11. PASS-THROUGH A (just forwarding)

Used sometimes for debugging or PC updates.

12. PASS-THROUGH B

Used in some designs for branch or immediate selection.
