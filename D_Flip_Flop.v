`timescale 1ns/1ns

module dff (
    input d, clk, enable,
    output q
);
    reg q;

    always @(posedge clk)
        if(enable==1)
            begin
                q = d;
            end
    
endmodule