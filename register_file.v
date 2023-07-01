`timescale 1ns/1ns

module register_file (
    input[2:0] read_addr1, read_addr2, write_addr,
    input [11:0] data_in,
    input write_en, clk,
    output [11:0] read_out1, read_out2
);

    wire [11:0] reg_read [7:0];
    wire [7:0] reg_write_en, temp_reg_write_en;
    wire [7:0] in_write_en;

    decoder d1 (write_addr, temp_reg_write_en);
    buf b1[7:0] (in_write_en[7:0], write_en);
    and a1[7:0] (reg_write_en, temp_reg_write_en, in_write_en);

    reg_12_bit register0 (data_in, clk, reg_write_en[0], reg_read[0]);
    reg_12_bit register1 (data_in, clk, reg_write_en[1], reg_read[1]);
    reg_12_bit register2 (data_in, clk, reg_write_en[2], reg_read[2]);
    reg_12_bit register3 (data_in, clk, reg_write_en[3], reg_read[3]);
    reg_12_bit register4 (data_in, clk, reg_write_en[4], reg_read[4]);
    reg_12_bit register5 (data_in, clk, reg_write_en[5], reg_read[5]);
    reg_12_bit register6 (data_in, clk, reg_write_en[6], reg_read[6]);
    reg_12_bit register7 (data_in, clk, reg_write_en[7], reg_read[7]);

    mux_8_to_1_12bit mux1 (reg_read[0], reg_read[1], reg_read[2], reg_read[3], reg_read[4], reg_read[5], reg_read[6], reg_read[7], read_addr1, read_out1);
    mux_8_to_1_12bit mux2 (reg_read[0], reg_read[1], reg_read[2], reg_read[3], reg_read[4], reg_read[5], reg_read[6], reg_read[7], read_addr2, read_out2);
    
endmodule