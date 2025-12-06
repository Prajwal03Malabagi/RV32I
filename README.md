# RV32I
Block 1                  -----------------  Program counter-----------------------

Holds the address of the current instruction
The calculation of next_pc (increment by 4, branch/jump target) happens outside the PC module

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
