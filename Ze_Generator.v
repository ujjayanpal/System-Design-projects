`timescale 1ns/1ns

module Ze_generate(
    input [3:0] XE, YE, 
    input s,
    output OF, 
    output [3:0] ZE
);

    wire [4:0] sum;
    wire [4:0] ZE1, ZE2;
    wire Co1, Co2, Co, ZEo;
    wire temp1, temp2, temp3, temp4;


    CLA4_2 cla1 (XE, YE, 1'b0, sum);
    BLS5 bls1 (sum, 5'b00111, Co1, ZE1);
    BLS5 bls2 (sum, 5'b00110, Co2, ZE2);

    bit4_2to1_mux mux1 (ZE, ZE2[3:0], ZE1[3:0], s);
    bit1_2to1_mux mux2 (Co2, Co1, s, Co);
    bit1_2to1_mux mux3 (ZE2[4], ZE1[4], s, ZEo);

    or (temp1, ZEo, Co);
    or (temp2, ZE[0], ZE[1], ZE[2], ZE[3]);
    and (temp3, ZE[0], ZE[1], ZE[2], ZE[3]);
    not (temp4, temp2);
    or (OF, temp1, temp3, temp4);

endmodule




