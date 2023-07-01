// 5-bit Borrow Lookahead Subtractor(BLS) 

`timescale 1ns/1ns

module BLS5(
    input [4:0] A, B,
	output Co,
    output [4:0] difference
);

// perform A - B and return the difference and the sign of the output
	wire [5:0] A_1, B_1;
	wire [5:0] B_not, P, G, temp;
	wire [6:0] carry;

	buf (A_1[5], 1'b0);
	buf (B_1[5], 1'b0);
	buf b1[4:0] (A_1[4:0], A);
	buf b2[4:0] (B_1[4:0], B);

    not not1[5:0] (B_not, B_1);

	and (G[0],A_1[0],B_not[0]);
	and (G[1],A_1[1],B_not[1]);
	and (G[2],A_1[2],B_not[2]);
	and (G[3],A_1[3],B_not[3]);
	and (G[4],A_1[4],B_not[4]);
	and (G[5],A_1[5],B_not[5]);

	xor (P[0],A_1[0],B_not[0]);
	xor (P[1],A_1[1],B_not[1]);
	xor (P[2],A_1[2],B_not[2]);
	xor (P[3],A_1[3],B_not[3]);
	xor (P[4],A_1[4],B_not[4]);
	xor (P[5],A_1[5],B_not[5]);

	buf (carry[0], 1'b1);
	
	and (temp[0], P[0], carry[0]); 
	or (carry[1], G[0], temp[0]);
	and (temp[1], P[1], carry[1]);
	or (carry[2], G[1], temp[1]);
	and (temp[2], P[2], carry[2]);
	or (carry[3], G[2], temp[2]);
	and (temp[3], P[3], carry[3]);
    or (carry[4], G[3], temp[3]);
	and (temp[4], P[4], carry[4]);
    or (carry[5], G[4], temp[4]);
	and (temp[5], P[5], carry[5]);
    or (carry[6], G[5], temp[5]);
	
	xor (difference[0],P[0],carry[0]);
	xor (difference[1],P[1],carry[1]);
	xor (difference[2],P[2],carry[2]);
	xor (difference[3],P[3],carry[3]);
	xor (difference[4],P[4],carry[4]);
	xor (Co,P[5],carry[5]);

endmodule

