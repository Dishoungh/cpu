`timescale 1ns / 1ps

module full_adder
(
    input wire a,
    input wire b,
    input wire cin,
    output wire s,
    output wire cout
);

wire ha1_sum;
wire ha1_cout;
wire ha2_cout;

half_adder ha1
(
    .a(a),
    .b(b),
    .sum(ha1_sum),
    .cout(ha1_cout)
);

half_adder ha2
(
    .a(ha1_sum),
    .b(cin),
    .sum(s),
    .cout(ha2_cout)
);

assign cout = ha1_cout | ha2_cout;

endmodule
