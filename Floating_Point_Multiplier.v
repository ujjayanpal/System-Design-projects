`timescale 1ns/1ns

module fp_multiplier(
    input [11:0] X, Y, 
    output [11:0] Z
);

    wire Xs, Ys, Zs, s;
    wire [3:0] Xe, Ye, Ze;
    wire [7:0] Xm ,Ym;
    wire [6:0] Zm;
    wire [15:0] Ztemp;

    buf (Xs, X[11]);
    buf (Ys, Y[11]);
    buf buf1[3:0] (Xe, X[10:7]);
    buf buf2[3:0] (Ye, Y[10:7]);
    buf buf3[6:0] (Xm[6:0], X[6:0]);
    buf buf4[6:0] (Ym[6:0], Y[6:0]);
    buf buf5 (Xm[7], 1'b1);
    buf buf6 (Ym[7], 1'b1);

    xor (Zs, Xs, Ys);
    
    unsigned_mult16 mult1 (Xm, Ym, Ztemp, s);
    bit7_2to1_mux mux1 (Ztemp[14:8], Ztemp[13:7], s, Zm);

    wire OF;
    Ze_generate gen1 (Xe, Ye, s, OF, Ze);
    buf b1(Z[11],Zs);
    buf b2 [3:0](Z[10:7],Ze);
    buf b3 [6:0](Z[6:0], Zm);


endmodule

