module ex_wb (
    input clk,
    input [7:0] result_in,
    input [2:0] rd_in,
    input       reg_write_in,
    output reg [7:0] result_out,
    output reg [2:0] rd_out,
    output reg       reg_write_out
);

    always @(posedge clk) begin
        result_out     <= result_in;
        rd_out         <= rd_in;
        reg_write_out  <= reg_write_in;
    end
endmodule
