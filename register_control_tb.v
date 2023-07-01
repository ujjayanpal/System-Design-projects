`timescale 1ns/1ps
module control_tb;
reg [11:0] r0,r1,r5,r6;
wire [11:0] out;
reg [26:0] tempins;
reg [2:0] read_addr1,read_addr2,write_addr;
reg [11:0] data_in;
reg write_en,clk;
wire [11:0] read_out1,read_out2;
ALU alu(tempins, out);
register_file ref_f(read_addr1, read_addr2, write_addr, data_in, write_en, clk, read_out1, read_out2);
initial 
  begin 
    clk = 1'b0;
    forever #20 clk = ~clk ;
  end
initial 
  begin
    $dumpfile ("control.vcd");
    $dumpvars (0,control_tb);
    r0=12'b111101111100;
    r1=12'b000000000010;
    r5=12'b010001000000;
    r6=12'b010001000000;  

    data_in=r0;
    write_addr=3'b000; 
    write_en = 1'b1; #67;

    write_en = 1'b0; #5;
    data_in=r1;
    write_addr=3'b001; 
    write_en = 1'b1; #67;

    write_en = 1'b0; #5;
    data_in=r5;
    write_addr=3'b101; 
    write_en = 1'b1; #67;

    write_en = 1'b0; #5;
    data_in=r6;
    write_addr=3'b110; 
    write_en = 1'b1; #67;

    // ---------------------------

    write_en = 1'b0; #5;

    read_addr1 = 3'b000;
    read_addr2 = 3'b001; #5;
    tempins[11:0] = read_out2;
    tempins[23:12] = read_out1;
    tempins[26:24] = 3'b001; #5;

    data_in=out;
    write_addr=3'b010;
    write_en = 1'b1; #67;

    // ---------------------------

    write_en = 1'b0; #5;

    read_addr1 = 3'b000;
    read_addr2 = 3'b001;
    tempins[11:0] = read_out2;
    tempins[23:12] = read_out1;
    tempins[26:24] = 3'b010; #5;

    data_in=out;
    write_addr=3'b011;
    write_en = 1'b1; #67;

    // ---------------------------

    write_en = 1'b0; #5;

    read_addr1 = 3'b000;
    read_addr2 = 3'b001;
    tempins[11:0] = read_out2;
    tempins[23:12] = read_out1;
    tempins[26:24] = 3'b011; #5;

    data_in=out;
    write_addr=3'b100;
    write_en = 1'b1; #67;

    // ---------------------------

    write_en = 1'b0; #5;

    read_addr1 = 3'b000;
    read_addr2 = 3'b001;
    tempins[11:0] = read_out2;
    tempins[23:12] = read_out1;
    tempins[26:24] = 3'b100; #5;

    data_in=out;
    write_addr=3'b010;
    write_en = 1'b1; #67;

    // ---------------------------

    write_en = 1'b0; #5;

    read_addr1 = 3'b101;
    read_addr2 = 3'b110; #5;
    tempins[11:0] = read_out2;
    tempins[23:12] = read_out1;
    tempins[26:24] = 3'b101; #5;

    data_in=out;
    write_addr=3'b111;
    write_en = 1'b1; #67;

    // ---------------------------

    write_en = 1'b0; #5;

    read_addr1 = 3'b101;
    read_addr2 = 3'b110;
    tempins[11:0] = read_out2;
    tempins[23:12] = read_out1;
    tempins[26:24] = 3'b110; #5;

    data_in=out;
    write_addr=3'b111;
    write_en = 1'b1; #67;

    // ---------------------------

    write_en = 1'b0; #5;

    read_addr1 = 3'b000;
    read_addr2 = 3'b001; #5;
    tempins[11:0] = read_out2;
    tempins[23:12] = read_out1;
    tempins[26:24] = 3'b111; #5;

    data_in=out;
    write_addr=3'b010;
    write_en = 1'b1; #67;

    // ---------------------------


    
    $finish ;
end
endmodule