`timescale 1ns/1ns

module ALU(
    input [26:0] instruction,
    output [11:0] ALU_output
);

    wire [2:0] opcode = instruction[26:24];
    wire [11:0] operand1 = instruction[23:12];
    wire [11:0] operand2 = instruction[11:0];
    wire [7:0] select;

    decoder decoder1 (opcode, select);

    wire [11:0] integer_adder_output, integer_subtractor_output, unsigned_multiplier_output, signed_multiplier_output;
    wire [11:0] float_adder_output, float_multiplier_output, comparator_output;

    add_8bit adder1 (operand1[7:0], operand2[7:0], 1'b0, 1'b0, 1'b1, integer_adder_output[7:0]); // calculate adder output
    buf buf1[3:0] (integer_adder_output[11:8], 1'b0);
    add_8bit adder2 (operand1[7:0], operand2[7:0], 1'b0, 1'b1, 1'b1, integer_subtractor_output[7:0]); // calculate subtractor output
    buf buf2[3:0] (integer_subtractor_output[11:8], 1'b0);
    unsigned_mult mul1 (operand1[7:0], operand2[7:0], unsigned_multiplier_output[7:0]);
    buf buf3[3:0] (unsigned_multiplier_output[11:8], 1'b0);
    signed_mult mul2 (operand1[7:0], operand2[7:0], signed_multiplier_output[7:0]);
    buf buf4[3:0] (signed_multiplier_output[11:8], 1'b0);
    fp_adder fadder1 (operand1, operand2, float_adder_output);
    fp_multiplier fmul1 (operand1, operand2, float_multiplier_output);
    comp_8bit comp1 (operand1[7:0], operand2[7:0], comparator_output[7:0]);
    buf buf5[3:0] (comparator_output[11:8], 1'b0);

    //extending each select bit to 8-bit length so that an AND operation can be exexuted
    wire [11:0] select0, select1, select2, select3, select4, select5, select6, select7, select_adder;
    buf b0[11:0] (select0, select[0]);
    buf b1[11:0] (select1, select[1]);
    buf b2[11:0] (select2, select[2]);
    buf b3[11:0] (select3, select[3]);
    buf b4[11:0] (select4, select[4]);
    buf b5[11:0] (select5, select[5]);
    buf b6[11:0] (select6, select[6]);
    buf b7[11:0] (select7, select[7]);

    wire [11:0] op1, op2, op3, op4, op5, op6, op7;
    and and0[11:0] (op1, integer_adder_output, select1);
    and and1[11:0] (op2, integer_subtractor_output, select2);
    and and2[11:0] (op3, unsigned_multiplier_output, select3);
    and and3[11:0] (op4, signed_multiplier_output, select4);
    and and4[11:0] (op5, float_adder_output, select5);
    and and5[11:0] (op6, float_multiplier_output, select6);
    and and6[11:0] (op7, comparator_output, select7);
    
    or or1[11:0] (ALU_output, op1, op2, op3, op4, op5, op6, op7);

endmodule


