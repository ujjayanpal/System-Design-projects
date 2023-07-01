`timescale 1ns/1ns

module CLA4(
	input [3:0] A, B,
	input Ci,
	output [3:0] sum,
	output Co, Cp);
	    
	wire [3:0] B, carry, P, G, temp;

	and (G[0],A[0],B[0]);
	and (G[1],A[1],B[1]);
	and (G[2],A[2],B[2]);
	and (G[3],A[3],B[3]);

	xor (P[0],A[0],B[0]);
	xor (P[1],A[1],B[1]);
	xor (P[2],A[2],B[2]);
	xor (P[3],A[3],B[3]);

	buf (carry[0],Ci);
	
	and (temp[0],P[0],carry[0]); 
	or (carry[1],G[0],temp[0]);
	and (temp[1],P[1],carry[1]);
	or (carry[2],G[1],temp[1]);
	and (temp[2],P[2],carry[2]);
	or (carry[3],G[2],temp[2]);
	and (temp[3],P[2],carry[2]);
    or (Co,G[3],temp[3]);

	buf (Cp, carry[3]);
	
	xor (sum[0],P[0],carry[0]);
	xor (sum[1],P[1],carry[1]);
	xor (sum[2],P[2],carry[2]);
	xor (sum[3],P[3],carry[3]);
endmodule
