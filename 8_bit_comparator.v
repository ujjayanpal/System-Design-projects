`timescale 1ns/1ns

module comp_8bit (
    input [7:0] A, B,
    output [7:0] res);

    xor xor1[7:0] (res, A, B);

endmodule
