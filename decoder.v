`timescale 1ns/1ns

module decoder(
    input [2:0] opcode, // 3-bit opcode input
    output [7:0] select // 8-bit select signal output
); 
    
    wire [2:0] opcode_bar; //this stores the values of the complements of the input opcode bits
    not nots[2:0] (opcode_bar[2:0], opcode[2:0]);

    and and0 (select[0], opcode_bar[2], opcode_bar[1], opcode_bar[0]); //opcode = 000 
    and and1 (select[1], opcode_bar[2], opcode_bar[1], opcode[0]); //opcode = 001
    and and2 (select[2], opcode_bar[2], opcode[1], opcode_bar[0]); //opcode = 010
    and and3 (select[3], opcode_bar[2], opcode[1], opcode[0]); //opcode = 011
    and and4 (select[4], opcode[2], opcode_bar[1], opcode_bar[0]); //opcode = 100
    and and5 (select[5], opcode[2], opcode_bar[1], opcode[0]); //opcode = 101
    and and6 (select[6], opcode[2], opcode[1], opcode_bar[0]); //opcode = 110
    and and7 (select[7], opcode[2], opcode[1], opcode[0]); //opcode = 111

endmodule