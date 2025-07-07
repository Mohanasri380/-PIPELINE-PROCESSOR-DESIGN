module alu (
    input [7:0] a,
    input [7:0] b,
    input [2:0] alu_control,  // opcode
    output reg [7:0] result
);

    always @(*) begin
        case (alu_control)
            3'b000: result = a + b;  // ADD
            3'b001: result = a - b;  // SUB
            default: result = 0;
        endcase
    end
endmodule
