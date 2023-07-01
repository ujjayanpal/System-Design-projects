`timescale 1ns/1ps

module csa(sum,carry,OF,op1,op2,op3);
    input wire[15:0] op1,op2,op3;
    output wire[15:0] sum,carry;
    output wire OF;
    full_adder fa1 (sum[0],carry[1],op1[0],op2[0],op3[0]);
    full_adder fa2 (sum[1],carry[2],op1[1],op2[1],op3[1]);
    full_adder fa3 (sum[2],carry[3],op1[2],op2[2],op3[2]);
    full_adder fa4 (sum[3],carry[4],op1[3],op2[3],op3[3]);
    full_adder fa5 (sum[4],carry[5],op1[4],op2[4],op3[4]);
    full_adder fa6 (sum[5],carry[6],op1[5],op2[5],op3[5]);
    full_adder fa7 (sum[6],carry[7],op1[6],op2[6],op3[6]);
    full_adder fa8 (sum[7],carry[8],op1[7],op2[7],op3[7]);
    full_adder fa9 (sum[8],carry[9],op1[8],op2[8],op3[8]);
    full_adder fa10 (sum[9],carry[10],op1[9],op2[9],op3[9]);
    full_adder fa11 (sum[10],carry[11],op1[10],op2[10],op3[10]);
    full_adder fa12 (sum[11],carry[12],op1[11],op2[11],op3[11]);
    full_adder fa13 (sum[12],carry[13],op1[12],op2[12],op3[12]);
    full_adder fa14 (sum[13],carry[14],op1[13],op2[13],op3[13]);
    full_adder fa15 (sum[14],carry[15],op1[14],op2[14],op3[14]);
    full_adder fa16 (sum[15],OF,op1[15],op2[15],op3[15]);
    buf buf1(carry[0],1'b0);
endmodule