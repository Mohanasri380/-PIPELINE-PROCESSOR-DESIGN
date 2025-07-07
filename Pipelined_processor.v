module pipelined_processor (
    input clk
);

    // --- IF Stage ---
    reg [3:0] pc = 0;
    wire [15:0] instruction;

    instruction_memory imem (
        .address(pc),
        .instruction(instruction)
    );

    wire [15:0] if_id_instruction;
    if_id if_id_reg (
        .clk(clk),
        .instruction_in(instruction),
        .instruction_out(if_id_instruction)
    );

    // --- ID Stage ---
    wire [2:0] opcode = if_id_instruction[15:13];
    wire [2:0] rd     = if_id_instruction[12:10];
    wire [2:0] rs1    = if_id_instruction[9:7];
    wire [2:0] rs2    = if_id_instruction[6:4];

    wire [7:0] reg_data1, reg_data2;

    register_file regfile (
        .clk(clk),
        .read_reg1(rs1),
        .read_reg2(rs2),
        .write_reg(wb_rd),
        .write_data(wb_result),
        .reg_write(wb_write_enable),
        .data1(reg_data1),
        .data2(reg_data2)
    );

    // ID/EX pipeline register
    wire [2:0] id_ex_opcode, id_ex_rd;
    wire [7:0] id_ex_rs1_data, id_ex_rs2_data;

    id_ex id_ex_reg (
        .clk(clk),
        .opcode_in(opcode),
        .rs1_data_in(reg_data1),
        .rs2_data_in(reg_data2),
        .rd_in(rd),
        .opcode_out(id_ex_opcode),
        .rs1_data_out(id_ex_rs1_data),
        .rs2_data_out(id_ex_rs2_data),
        .rd_out(id_ex_rd)
    );

    // --- EX Stage ---
    wire [7:0] alu_result;
    alu alu_unit (
        .a(id_ex_rs1_data),
        .b(id_ex_rs2_data),
        .alu_control(id_ex_opcode),
        .result(alu_result)
    );

    // For LOAD, memory read from rs1 (used as address)
    wire [7:0] mem_data;
    data_memory dmem (
        .clk(clk),
        .address(id_ex_rs1_data),
        .data_out(mem_data)
    );

    // MUX for ALU vs LOAD result
    wire [7:0] ex_result = (id_ex_opcode == 3'b010) ? mem_data : alu_result;
    wire ex_write_enable = 1'b1; // Always write back (simplified)

    // EX/WB pipeline register
    wire [7:0] wb_result;
    wire [2:0] wb_rd;
    wire wb_write_enable;

    ex_wb ex_wb_reg (
        .clk(clk),
        .result_in(ex_result),
        .rd_in(id_ex_rd),
        .reg_write_in(ex_write_enable),
        .result_out(wb_result),
        .rd_out(wb_rd),
        .reg_write_out(wb_write_enable)
    );

    // Increment PC every clock (simplified no stalls)
    always @(posedge clk) begin
        pc <= pc + 1;
    end

endmodule
