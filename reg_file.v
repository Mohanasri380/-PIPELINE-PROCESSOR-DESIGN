module register_file (
    input clk,
    input [2:0] read_reg1,
    input [2:0] read_reg2,
    input [2:0] write_reg,
    input [7:0] write_data,
    input reg_write,
    output [7:0] data1,
    output [7:0] data2
);

    reg [7:0] registers [0:7];

    assign data1 = registers[read_reg1];
    assign data2 = registers[read_reg2];

    always @(posedge clk) begin
        if (reg_write) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule
