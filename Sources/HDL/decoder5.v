`timescale 1ns / 1ps

module decoder5
(
    input wire en,
    input wire[4:0] sel,
    output wire out0,
    output wire out1,
    output wire out2,
    output wire out3,
    output wire out4,
    output wire out5,
    output wire out6,
    output wire out7,
    output wire out8,
    output wire out9,
    output wire out10,
    output wire out11,
    output wire out12,
    output wire out13,
    output wire out14,
    output wire out15,
    output wire out16,
    output wire out17,
    output wire out18,
    output wire out19,
    output wire out20,
    output wire out21,
    output wire out22,
    output wire out23,
    output wire out24,
    output wire out25,
    output wire out26,
    output wire out27,
    output wire out28,
    output wire out29,
    output wire out30,
    output wire out31
);

assign out0  = (!sel[4] && !sel[3] && !sel[2] && !sel[1] && !sel[0] && en) ? 1'b1 : 1'b0;
assign out1  = (!sel[4] && !sel[3] && !sel[2] && !sel[1] && sel[0] && en)  ? 1'b1 : 1'b0;
assign out2  = (!sel[4] && !sel[3] && !sel[2] && sel[1] && !sel[0] && en)  ? 1'b1 : 1'b0;
assign out3  = (!sel[4] && !sel[3] && !sel[2] && sel[1] && sel[0] && en)   ? 1'b1 : 1'b0;
assign out4  = (!sel[4] && !sel[3] && sel[2] && !sel[1] && !sel[0] && en)  ? 1'b1 : 1'b0;
assign out5  = (!sel[4] && !sel[3] && sel[2] && !sel[1] && sel[0] && en)   ? 1'b1 : 1'b0;
assign out6  = (!sel[4] && !sel[3] && sel[2] && sel[1] && !sel[0] && en)   ? 1'b1 : 1'b0;
assign out7  = (!sel[4] && !sel[3] && sel[2] && sel[1] && sel[0] && en)    ? 1'b1 : 1'b0;
assign out8  = (!sel[4] && sel[3] && !sel[2] && !sel[1] && !sel[0] && en)  ? 1'b1 : 1'b0;
assign out9  = (!sel[4] && sel[3] && !sel[2] && !sel[1] && sel[0] && en)   ? 1'b1 : 1'b0;
assign out10 = (!sel[4] && sel[3] && !sel[2] && sel[1] && !sel[0] && en)   ? 1'b1 : 1'b0;
assign out11 = (!sel[4] && sel[3] && !sel[2] && sel[1] && sel[0] && en)    ? 1'b1 : 1'b0;
assign out12 = (!sel[4] && sel[3] && sel[2] && !sel[1] && !sel[0] && en)   ? 1'b1 : 1'b0;
assign out13 = (!sel[4] && sel[3] && sel[2] && !sel[1] && sel[0] && en)    ? 1'b1 : 1'b0;
assign out14 = (!sel[4] && sel[3] && sel[2] && sel[1] && !sel[0] && en)    ? 1'b1 : 1'b0;
assign out15 = (!sel[4] && sel[3] && sel[2] && sel[1] && sel[0] && en)     ? 1'b1 : 1'b0;
assign out16 = (sel[4] && !sel[3] && !sel[2] && !sel[1] && !sel[0] && en)  ? 1'b1 : 1'b0;
assign out17 = (sel[4] && !sel[3] && !sel[2] && !sel[1] && sel[0] && en)   ? 1'b1 : 1'b0;
assign out18 = (sel[4] && !sel[3] && !sel[2] && sel[1] && !sel[0] && en)   ? 1'b1 : 1'b0;
assign out19 = (sel[4] && !sel[3] && !sel[2] && sel[1] && sel[0] && en)    ? 1'b1 : 1'b0;
assign out20 = (sel[4] && !sel[3] && sel[2] && !sel[1] && !sel[0] && en)   ? 1'b1 : 1'b0;
assign out21 = (sel[4] && !sel[3] && sel[2] && !sel[1] && sel[0] && en)    ? 1'b1 : 1'b0;
assign out22 = (sel[4] && !sel[3] && sel[2] && sel[1] && !sel[0] && en)    ? 1'b1 : 1'b0;
assign out23 = (sel[4] && !sel[3] && sel[2] && sel[1] && sel[0] && en)     ? 1'b1 : 1'b0;
assign out24 = (sel[4] && sel[3] && !sel[2] && !sel[1] && !sel[0] && en)   ? 1'b1 : 1'b0;
assign out25 = (sel[4] && sel[3] && !sel[2] && !sel[1] && sel[0] && en)    ? 1'b1 : 1'b0;
assign out26 = (sel[4] && sel[3] && !sel[2] && sel[1] && !sel[0] && en)    ? 1'b1 : 1'b0;
assign out27 = (sel[4] && sel[3] && !sel[2] && sel[1] && sel[0] && en)     ? 1'b1 : 1'b0;
assign out28 = (sel[4] && sel[3] && sel[2] && !sel[1] && !sel[0] && en)    ? 1'b1 : 1'b0;
assign out29 = (sel[4] && sel[3] && sel[2] && !sel[1] && sel[0] && en)     ? 1'b1 : 1'b0;
assign out30 = (sel[4] && sel[3] && sel[2] && sel[1] && !sel[0] && en)     ? 1'b1 : 1'b0;
assign out31 = (sel[4] && sel[3] && sel[2] && sel[1] && sel[0] && en)      ? 1'b1 : 1'b0;

endmodule
