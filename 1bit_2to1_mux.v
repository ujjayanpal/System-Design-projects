`timescale 1ns/1ns

module bit1_2to1_mux(
    input A, B, s,
    output C
);

    wire s_not, temp1, temp2;
    not (s_not, s);
    and (temp1, s, A);
    and (temp2, s_not, B);
    or (C, temp1, temp2);


endmodule