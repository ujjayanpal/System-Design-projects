// 4-bit Borrow Lookahead Subtractor(BLS) 

`timescale 1ns/1ns

module BLS4(
    input [3:0] A, B,
    output [3:0] difference
);

// perform A - B and return the difference and the sign of the output

	wire [3:0] B_1, P, G, temp;
    wire [4:0] carry;

    not not1[3:0] (B_1, B);

	and (G[0],A[0],B_1[0]);
	and (G[1],A[1],B_1[1]);
	and (G[2],A[2],B_1[2]);
	and (G[3],A[3],B_1[3]);

	xor (P[0],A[0],B_1[0]);
	xor (P[1],A[1],B_1[1]);
	xor (P[2],A[2],B_1[2]);
	xor (P[3],A[3],B_1[3]);

	buf (carry[0], 1);
	
	and (temp[0], P[0], carry[0]); 
	or (carry[1], G[0], temp[0]);
	and (temp[1], P[1], carry[1]);
	or (carry[2], G[1], temp[1]);
	and (temp[2], P[2], carry[2]);
	or (carry[3], G[2], temp[2]);
	and (temp[3], P[2], carry[2]);
    or (carry[4], G[3], temp[3]);
	
	xor (difference[0],P[0],carry[0]);
	xor (difference[1],P[1],carry[1]);
	xor (difference[2],P[2],carry[2]);
	xor (difference[3],P[3],carry[3]);

endmodule

