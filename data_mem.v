module data_memory (
    input clk,
    input [7:0] address,
    output reg [7:0] data_out
);

    reg [7:0] memory [0:255];

    initial begin
        memory[1] = 8'd50; // Example data
    end

    always @(*) begin
        data_out = memory[address];
    end
endmodule
