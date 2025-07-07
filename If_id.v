module if_id (
    input clk,
    input [15:0] instruction_in,
    output reg [15:0] instruction_out
);

    always @(posedge clk) begin
        instruction_out <= instruction_in;
    end
endmodule
