module instruction_memory (
    input [3:0] address,
    output reg [15:0] instruction
);

    reg [15:0] memory [0:15];

    initial begin
        // Sample program:
        memory[0] = 16'b000_000_001_010_0000; // ADD R0 = R1 + R2
        memory[1] = 16'b001_011_000_010_0000; // SUB R3 = R0 - R2
        memory[2] = 16'b010_100_001_000_0000; // LOAD R4 = MEM[R1]
        // Add more instructions as needed
    end

    always @(*) begin
        instruction = memory[address];
    end
endmodule
