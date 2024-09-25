`timescale 1ns / 1ps

module mux_d32_s1
(
    input wire[31:0] in0,
    input wire[31:0] in1,
    input wire sel,
    output wire[31:0] out
);

assign out = (!sel) ? in0 : in1;

endmodule
