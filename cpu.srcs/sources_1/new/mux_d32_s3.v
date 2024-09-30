`timescale 1ns / 1ps

module mux_d32_s3
(
    input wire[31:0] in0,
    input wire[31:0] in1,
    input wire[31:0] in2,
    input wire[31:0] in3,
    input wire[31:0] in4,
    input wire[31:0] in5,
    input wire[31:0] in6,
    input wire[31:0] in7,
    input wire[2:0] sel,
    output reg[31:0] out0
);

always @(*)
begin
    case (sel)
        3'd0:       out0 = in0;
        3'd1:       out0 = in1;
        3'd2:       out0 = in2;
        3'd3:       out0 = in3;
        3'd4:       out0 = in4;
        3'd5:       out0 = in5;
        3'd6:       out0 = in6;
        3'd7:       out0 = in7;
        default:    out0 = 32'd0;
    endcase
end

endmodule
