module id_ex (
    input clk,
    input [2:0] opcode_in,
    input [7:0] rs1_data_in,
    input [7:0] rs2_data_in,
    input [2:0] rd_in,
    output reg [2:0] opcode_out,
    output reg [7:0] rs1_data_out,
    output reg [7:0] rs2_data_out,
    output reg [2:0] rd_out
);

    always @(posedge clk) begin
        opcode_out     <= opcode_in;
        rs1_data_out   <= rs1_data_in;
        rs2_data_out   <= rs2_data_in;
        rd_out         <= rd_in;
    end
endmodule
