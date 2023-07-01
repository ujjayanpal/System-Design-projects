`timescale 1ns/1ns

module CLA4_h(
    input [3:0] A, B,
    input Ci, 
	output [3:0] sum, 
    output Co, Cp, Pi, Gi);
    
    wire [3:0] carry, P, G, p_temp;
    wire [2:0] g_temp;
    wire g_temp2, g_temp31, g_temp32;

    //generate terms
    and (G[0],A[0],B[0]);
    and (G[1],A[1],B[1]);
    and (G[2],A[2],B[2]);
    and (G[3],A[3],B[3]);

    //propagate terms
    xor (P[0],A[0],B[0]);
    xor (P[1],A[1],B[1]);
    xor (P[2],A[2],B[2]);
    xor (P[3],A[3],B[3]);

    //carry terms

    //C1
    and (p_temp[0], P[0], Ci);
    or (carry[1],G[0],p_temp[0]);

    //C2
    and (p_temp[1], P[1], P[0], Ci);
    and (g_temp2,P[1],G[0]);
    or (carry[2], G[1],g_temp2,p_temp[1]);

    //C3
    and (p_temp[2], P[2], P[1], P[0], Ci);
    and (g_temp31,  P[2], P[1], G[0]);
    and (g_temp32, P[2], G[1]);
    or (carry[3], p_temp[2], g_temp31, g_temp32, G[2]);
    buf (Cp, carry[3]);

    //C4
    //higher order propagate and generate terms
    and (Pi, P[0], P[1], P[2], P[3]);
    and (g_temp[0], P[3], P[2], P[1], G[0]);
    and (g_temp[1], P[3], P[2], G[1]);
    and (g_temp[2], P[3], G[2]);
    or (Gi, g_temp[0], g_temp[1], g_temp[2], G[3]);
    and (p_temp[3], P[0], P[1], P[2], P[3], Ci);
    or (Co, p_temp[3], Gi);

    buf (carry[0],Ci);
    
    xor (sum[0],P[0],carry[0]);
    xor (sum[1],P[1],carry[1]);
    xor (sum[2],P[2],carry[2]);
    xor (sum[3],P[3],carry[3]);

endmodule
