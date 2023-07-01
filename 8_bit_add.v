`timescale 1ns/1ns

module bit_add_8(
    input [7:0] A, B,
    input Ci, 
	output [8:0] sum);

    wire cp1, cp2;
    wire c1, c2;

    CLA4 cl1 (A[3:0], B[3:0], 1'b0, sum[3:0], c1, cp1);
    CLA4 cl2 (A[7:4], B[7:4], c1, sum[7:4], c2, cp2);

    buf b1(sum[8], c2);

endmodule