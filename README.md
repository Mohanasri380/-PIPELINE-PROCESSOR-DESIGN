# -PIPELINE-PROCESSOR-DESIGN
COMPANY:CODTECH IT SOLUTIONS

NAME:KUMMITHA MOHANA SRI

INTERN ID:CT08DL279

DOMAIN:VLSI

DURATION:8 WEEKS

MENTOR:NEELA SANTHOSH KUMAR

#DESCRIPTION

📘 Project Title: 4-Stage Pipelined Processor Using Verilog

🔧 Tools Used

Design Tool: Vivado (Xilinx Design Suite)

Simulation: Vivado Behavioral Simulation

Language: Verilog HDL


The aim of this project is to design, implement, and simulate a 4-stage pipelined processor capable of executing three basic instructions: ADD, SUB, and LOAD. The processor architecture mimics a simplified RISC-like pipeline to demonstrate instruction-level parallelism and performance improvement through pipelining.




🏗 Pipeline Stages

Stage	Name	Function

1	IF (Instruction Fetch)	Fetch instruction from memory using PC
2	ID (Instruction Decode)	Decode instruction & read registers
3	EX (Execute)	Perform ALU operations or memory access
4	WB (Write Back)	Write result back to destination register


🔢 Instruction Format (16-bit Custom ISA)

Field	Bits	Description

Opcode	[15:13]	3-bit operation code
RD	[12:10]	Destination register (3 bits)
RS1	[9:7]	Source register 1 (3 bits)
RS2/Addr	[6:4]	Source register 2 or address
Reserved	[3:0]	Unused / immediate (optional)


Example Instructions:

ADD R0, R1, R2 → R0 = R1 + R2 (Opcode = 000)

SUB R3, R0, R2 → R3 = R0 - R2 (Opcode = 001)

LOAD R4, [R1] → R4 = Memory[R1] (Opcode = 010

📦 Modules Implemented

Module Name	Function

instruction_memory.v	Stores 16-bit instructions
register_file.v	8 general-purpose 8-bit registers
alu.v	Performs ADD and SUB operations
data_memory.v	256 bytes of memory for LOAD
if_id.v	IF → ID pipeline register
id_ex.v	ID → EX pipeline register
ex_wb.v	EX → WB pipeline register
pipelined_processor.v	Top-level integration of all modules
tb_pipelined_processor.v	Testbench with clock and simulation

📈 Pipeline Execution Example

Clock Cycle	IF	ID	EX	WB

Cycle 0	ADD	-	-	-
Cycle 1	SUB	ADD	-	-
Cycle 2	LOAD	SUB	ADD	-
Cycle 3	-	LOAD	SUB	ADD
Cycle 4	-	-	LOAD	SUB
Cycle 5	-	-	-	LOAD


✅ Conclusion

This project demonstrates the fundamental concept of instruction pipelining in processor design. By separating instruction execution into stages and allowing overlap, throughput is improved. The simulation confirms correct data flow, pipeline stage isolation, and register write-back behavior.

