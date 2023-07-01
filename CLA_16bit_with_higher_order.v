`timescale 1ns/1ns

module CLA_16bit(
    input [15:0] A, B,
    input Ci, control, sign,
    output [15:0] sum,
    output Co, OF);

    wire dummy;
    wire [2:0] carry, carry1, carry_g;
    wire [3:0] cp, cp1, Pi, Gi;
    wire C8, C12, C16;
    wire[8:0] c_temp;

    wire [15:0] c, b_temp1, b_temp2, b_temp3, c_not, b_not, op2, op3;
    
    buf buf1[15:0] (c, control);
    not not1[15:0] (c_not, c);
    and and1[15:0] (b_temp1, B, c_not);
    not not2[15:0] (b_temp2, B);

    CLA4 cla1 (b_temp2[3:0], 4'b0000, 1'b1, op2[3:0], carry1[0], cp1[0]);
    CLA4 cla2 (b_temp2[7:4], 4'b0000, carry1[0], op2[7:4], carry1[1], cp1[1]);
    CLA4 cla3 (b_temp2[11:8], 4'b0000, carry1[1], op2[11:8], carry1[2], cp1[2]);
    CLA4 cla4 (b_temp2[15:12], 4'b0000, carry1[2], op2[15:12], dummy, cp1[3]);

    and and2[15:0] (b_temp3, op2, c);
    or or1[15:0] (op3, b_temp3, b_temp1);

    CLA4_h cla5 (A[3:0], op3[3:0], Ci, sum[3:0], carry[0], cp[0], Pi[0], Gi[0]);
    CLA4_h cla6 (A[7:4], op3[7:4], carry[0], sum[7:4], carry[1], cp[1], Pi[1], Gi[1]);

    and (c_temp[0], Pi[1], Gi[0]);
    and (c_temp[1], Pi[1], Pi[0], Ci);
    or (C8, c_temp[0], c_temp[1], Gi[1]);

    CLA4_h cla7 (A[11:8], op3[11:8], C8, sum[11:8], carry[2], cp[2], Pi[2], Gi[2]);

    and (c_temp[2], Pi[2], Gi[1]);
    and (c_temp[3], Pi[2], Pi[1], Gi[0]);
    and (c_temp[4], Pi[2], Pi[1], Pi[0], Ci);
    or (C12, c_temp[2], c_temp[3], c_temp[4], Gi[2]);

    CLA4_h cla8 (A[15:12], op3[15:12], C12, sum[15:12], Co, cp[3], Pi[3], Gi[3]);

    and (c_temp[5], Pi[3], Gi[2]);
    and (c_temp[6], Pi[3], Pi[2], Gi[1]);
    and (c_temp[7], Pi[3], Pi[2], Pi[1], Gi[0]);
    and (c_temp[8], Pi[3], Pi[2], Pi[1], Pi[0], Ci);
    or (Co, c_temp[6], c_temp[7], c_temp[8], Gi[3]);

    wire of_temp1, of_temp2, of_temp3, of_temp4, s_not;

    not (s_not, sign);
    buf (of_temp1, Co);
    xor (of_temp2, cp[3], Co);
    and (of_temp3, s_not, of_temp1);
    and (of_temp4, sign, of_temp2);
    or (OF, of_temp3, of_temp4);

endmodule
