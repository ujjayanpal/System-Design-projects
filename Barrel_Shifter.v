// Given a n-bit number, perform right shift operation by k-times

`timescale 1ns/1ns

module barrel_shift(
    input [7:0] A,
    input [2:0] k,
    output [7:0] shifted_A
);

    wire [7:0] s1, s2, s3, s4, s5, s6, s7;

    assign s1[7] = 1'b0;
    assign s1[6:0] = A[7:1];
    assign s2[7:6] = 2'b00;
    assign s2[5:0] = A[7:2];
    assign s3[7:5] = 3'b000;
    assign s3[4:0] = A[7:3];
    assign s4[7:4] = 4'b0000;
    assign s4[3:0] = A[7:4];
    assign s5[7:3] = 5'b00000;
    assign s5[2:0] = A[7:5];
    assign s6[7:2] = 6'b000000;
    assign s6[1:0] = A[7:6];
    assign s7[7:1] = 7'b0000000;
    assign s7[0] = A[7];

    mux_8_to_1 mux1 (A, s1, s2, s3, s4, s5, s6, s7, k, shifted_A);

endmodule

