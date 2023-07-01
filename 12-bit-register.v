`timescale 1ns/1ns

module reg_12_bit (
    input [11:0] d_in, 
    input clk, enable,
    output [11:0] q
);
    dff ff[11:0] (d_in[11:0], clk, enable, q[11:0]);

endmodule