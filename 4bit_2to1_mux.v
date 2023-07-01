`timescale 1ns/1ns

module bit4_2to1_mux(ze,a,b,so);
    input wire  [3:0] a;
    input wire  [3:0] b;
    input wire so;
    output wire [3:0] ze;
    wire [3:0] t1,t2,t3,t4;
    wire te1,te2;
    not (te1,so);
    buf b1[3:0](t1,so);
    buf b2[3:0](t2,te1);
    and a1 [3:0] (t3,a,t1);
    and a2 [3:0] (t4,b,t2);
    or o1 [3:0] (ze,t3,t4);

endmodule