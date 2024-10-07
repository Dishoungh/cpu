`timescale 1ns / 1ps

module half_adder
(
    input wire a,
    input wire b,
    output wire s,
    output wire cout
);

assign s    = a ^ b;
assign cout = a & b;

endmodule
