`timescale 1ns/1ns

module bit7_2_1_mux(
    input [6:0] op1,
    input [6:0] op2,
    input sl, 
	output [6:0] fin);

    wire [6:0] temp1, temp2; 
    buf buf1[6:0] (temp1, sl);

    wire [6:0] temp5;
    wire slnot;
    not(slnot, sl);
    buf buf2[6:0] (temp5, slnot);

    wire [6:0] temp3, temp4;
    and a1[6:0] (temp3, op1, temp1);
    and a2[6:0] (temp4, op2, temp5); 

    or o1[6:0] (fin, temp3, temp4);

endmodule