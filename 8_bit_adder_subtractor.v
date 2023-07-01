`timescale 1ns/1ns

module add_8bit(
    input [7:0] A, B,
    input Ci, control, sign,
    output [7:0] sum);

    wire dummy;
    wire [0:0] carry, carry1;
    wire [1:0] cp, cp1;

    wire [7:0] c, b_temp1, b_temp2, b_temp3, c_not, op2, op3;
    
    buf buf1[7:0] (c, control);
    not not1[7:0] (c_not, c);
    and and1[7:0] (b_temp1, B, c_not);
    not not2[7:0] (b_temp2, B);

    CLA4 cla1 (b_temp2[3:0], 4'b0000, 1'b1, op2[3:0], carry1[0], cp1[0]);
    CLA4 cla2 (b_temp2[7:4], 4'b0000, carry1[0], op2[7:4], dummy, cp1[1]);

    and and2 [7:0] (b_temp3, op2, c);
    or or1 [7:0] (op3, b_temp3, b_temp1);

    wire Co;
    CLA4 cla5 (A[3:0], op3[3:0], Ci, sum[3:0], carry[0], cp[0]);
    CLA4 cla6 (A[7:4], op3[7:4], carry[0], sum[7:4], Co, cp[1]);

endmodule
