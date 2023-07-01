// 8-bit 8-to-1 multiplexer

`timescale 1ns/1ns

module mux_8_to_1(
    input [7:0] s0, s1, s2, s3, s4, s5, s6, s7,
    input [2:0] control,
    output [7:0] out
);

    wire [2:0] control_not;
    wire [7:0] c, c0, c1, c2, c3, c4, c5, c6, c7;
    wire [7:0] out_temp0, out_temp1, out_temp2, out_temp3, out_temp4, out_temp5, out_temp6, out_temp7;
    
    not not1[2:0] (control_not, control);
    and and1 (c[0], control_not[2], control_not[1], control_not[0]);
    and and2 (c[1], control_not[2], control_not[1], control[0]);
    and and3 (c[2], control_not[2], control[1], control_not[0]);
    and and4 (c[3], control_not[2], control[1], control[0]);
    and and5 (c[4], control[2], control_not[1], control_not[0]);
    and and6 (c[5], control[2], control_not[1], control[0]);
    and and7 (c[6], control[2], control[1], control_not[0]);
    and and8 (c[7], control[2], control[1], control[0]);

    buf buf1[7:0] (c0, c[0]);
    buf buf2[7:0] (c1, c[1]);
    buf buf3[7:0] (c2, c[2]);
    buf buf4[7:0] (c3, c[3]);
    buf buf5[7:0] (c4, c[4]);
    buf buf6[7:0] (c5, c[5]);
    buf buf7[7:0] (c6, c[6]);
    buf buf8[7:0] (c7, c[7]);

    and and9[7:0] (out_temp0, s0, c0);
    and and10[7:0] (out_temp1, s1, c1);
    and and11[7:0] (out_temp2, s2, c2);
    and and12[7:0] (out_temp3, s3, c3);
    and and13[7:0] (out_temp4, s4, c4);
    and and14[7:0] (out_temp5, s5, c5);
    and and15[7:0] (out_temp6, s6, c6);
    and and16[7:0] (out_temp7, s7, c7);

    or or1[7:0] (out, out_temp0, out_temp1, out_temp2, out_temp3, out_temp4, out_temp5, out_temp6, out_temp7);

endmodule