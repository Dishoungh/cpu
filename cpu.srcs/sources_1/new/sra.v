`timescale 1ns / 1ps

module sra
(
    input wire[31:0] a,
    input wire[4:0] b,
    output wire[31:0] y
);

assign y = a >>> b;

endmodule
