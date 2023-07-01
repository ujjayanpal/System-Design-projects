// given two floating point numbers, add them

`timescale 1ns/1ns

module fp_adder(
    input [11:0] X, Y,
    output [11:0] Z
);

    wire [3:0] K, XE, YE, ZE;
    wire [6:0] ZM;
    wire [7:0] P, Q, Q_temp;
    wire [8:0] SM;

    assign XE = X[10:7];
    assign YE = Y[10:7];
    assign P[7] = 1'b1;
    assign P[6:0] = X[6:0];
    assign Q_temp[7] = 1'b1;
    assign Q_temp[6:0] = Y[6:0];

    generate_exponent_difference gen1 (XE, YE, K);

    align_mantissa align1 (Q_temp, K, Q);

    bit_add_8 adder1 (P, Q, 1'b0, SM);
    bit7_2_1_mux mux1 (SM[7:1], SM[6:0], SM[8], ZM);

    norme norm1 (XE, SM[8], ZE);

    assign Z[11] = 1'b0;
    assign Z[10:7] = ZE;
    assign Z[6:0] = ZM;

endmodule





