// 8-bit 2-to-1 multiplexer

`timescale 1ns/1ns

module bit8_2to1_mux(
    input [7:0] s0, s1,
    input control,
    output [7:0] out
);

    wire [7:0] c, c_not, out_temp0, out_temp1;
    
    buf buf1[7:0] (c, control);
    not not1[7:0] (c_not, c);

    and and1[7:0] (out_temp0, s0, c_not);
    and and2[7:0] (out_temp1, s1, c);

    or or1[7:0] (out, out_temp0, out_temp1);

endmodule