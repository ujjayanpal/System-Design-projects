`timescale 1ns/1ns

module norme (xe,so,ze);

    wire cp;
    input wire so;
    input wire [3:0] xe;
    output wire [3:0] ze;
    wire co;
    wire [3:0] t;
    CLA4 c1(xe,4'b0000,1'b1,t,co, cp);
    b4_2_1mux b1(ze,t,xe,so);
    
endmodule
