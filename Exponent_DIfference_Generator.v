// given the exponent bits of the two flosting point numbers, generate their absolute difference 
// and also a bit signifying which of them is greater

`timescale 1ns/1ns

module generate_exponent_difference(
    input [3:0] XE, YE,
    output [3:0] XE_YE
);

    BLS4 bls1 (XE, YE, XE_YE);

endmodule