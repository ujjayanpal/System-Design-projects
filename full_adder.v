`timescale 1ns/1ps

module full_adder(output s,output cout,input a,input b,input c);

	// 1-bit Full Adder module
	wire a,b,c;
	wire s,cout;
	wire t1,t2,t3;
	xor (t1,a,b);
	xor (s,t1,c);
	and(t2,t1,c);
	and(t3,a,b);
	or(cout,t2,t3);
endmodule