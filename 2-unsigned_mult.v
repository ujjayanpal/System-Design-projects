`timescale 1ns/1ns

module unsigned_mult(
    input [7:0] a, b,
    output [7:0] ans);

    // 8 partial sums each of 16 bits
    wire [15:0] psum0;
    wire [15:0] psum1;
    wire [15:0] psum2;
    wire [15:0] psum3;
    wire [15:0] psum4;
    wire [15:0] psum5;
    wire [15:0] psum6;
    wire [15:0] psum7;
    // 1st partial sum
    wire [7:0] temp0;
    wire [7:0] p0;
    buf buf0[7:0](temp0[7:0], b[0]);
    and and0[7:0](p0[7:0], a[7:0],temp0[7:0]);
    buf b1[7:0](psum0[7:0], p0);
    buf b2[15:8](psum0[15: 8], 1'b0);

    // 2nd partial sum;
    wire [7:0] temp1;
    wire [7:0] p1;
    buf buf1[7:0](temp1[7:0], b[1]);
    and and1[7:0](p1[7:0], a[7:0],temp1[7:0]);
    buf b3[8:1](psum1[8:1], p1);
    buf b4[15:9](psum1[15: 9], 1'b0);
    buf b5 (psum1[0], 1'b0);

    // 3rd partial sum;
    wire [7:0] temp2;
    wire [7:0] p2;
    buf buf2[7:0](temp2[7:0], b[2]);
    and and2[7:0](p2[7:0],a[7:0],temp2[7:0]);
    buf b6[9:2](psum2[9:2], p2);
    buf b7[15:10](psum2[15: 10], 1'b0);
    buf b8[1:0](psum2[1: 0], 1'b0);

    // 4th partial sum;
    wire [7:0] temp3;
    wire [7:0] p3;
    buf buf3[7:0](temp3[7:0], b[3]);
    and and3[7:0](p3[7:0], a[7:0],temp3[7:0]);
    buf b9[10:3](psum3[10:3], p3);
    buf b10[15:11](psum3[15: 11], 1'b0);
    buf b11[2:0](psum3[2: 0], 1'b0);

    // 5th partial sum;
    wire [7:0] temp4;
    wire [7:0] p4;
    buf buf4[7:0](temp4[7:0], b[4]);
    and and4[7:0](p4[7:0], a[7:0],temp4[7:0]);
    buf b12[11:4](psum4[11:4], p4);
    buf b13[15:12](psum4[15: 12], 1'b0);
    buf b14[3:0](psum4[3: 0], 1'b0);

    // 6th partial sum;
    wire [7:0] temp5;
    wire [7:0] p5;
    buf buf5[7:0](temp5[7:0], b[5]);
    and and5[7:0](p5[7:0], a[7:0],temp5[7:0]);
    buf b15[12:5](psum5[12:5], p5);
    buf b16[15:13](psum5[15: 13], 1'b0);
    buf b17[4:0](psum5[4: 0], 1'b0);

    // 7th partial sum;
    wire [7:0] temp6;
    wire [7:0] p6;
    buf buf6[7:0](temp6[7:0], b[6]);
    and and6[7:0](p6[7:0], a[7:0],temp6[7:0]);
    buf b18[13:6](psum6[13:6], p6);
    buf b19[15:14](psum6[15: 14], 1'b0);
    buf b20[5:0](psum6[5: 0], 1'b0);

    // 8th partial sum;
    wire [7:0] temp7;
    wire [7:0] p7;
    buf buf7[7:0](temp7[7:0], b[7]);
    and and7[7:0](p7[7:0], a[7:0],temp7[7:0]);
    buf b21[14:7](psum7[14:7], p7);
    buf b22[15:15](psum7[15: 15], 1'b0);
    buf b23[6:0](psum7[6: 0], 1'b0);

    wire [15:0] s01, c01, s02, c02, s11, c11, s12, c12, s21, c21, s31, c31;
    wire of01,of02,of11,of12, of21, of31;
    csa c1 (s01, c01, of01, psum0, psum1, psum2);
    csa c2 (s02, c02, of02, psum3, psum4, psum5);
    
    csa c3 (s11, c11, of11, s01, c01, s02);
    csa c4 (s12, c12, of12, c02, psum6, psum7);

    csa c5 (s21, c21, of21, s11,c11,s12);

    csa c6 (s31, c31, of31, s21,c21,c12);

    // adding 2 16 bit summands
    wire C0;
    wire oftemp;
    wire [15:0] ans1;
    CLA_16bit f1 (s31,c31, 1'b0, 1'b0, 1'b0, ans1, C0, oftemp);
    buf buf11[7:0](ans[7:0],ans1[7:0]);
    // or (OF, oftemp, of01,of02,of11,of12, of21, of31,ans1[8],ans1[9],ans1[10],ans1[11],ans1[12],ans1[13],ans1[14],ans1[15]);

endmodule