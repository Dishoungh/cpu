`timescale 1ns / 1ps


module mux_d32_s5
(
    input wire[31:0] in0,
    input wire[31:0] in1,
    input wire[31:0] in2,
    input wire[31:0] in3,
    input wire[31:0] in4,
    input wire[31:0] in5,
    input wire[31:0] in6,
    input wire[31:0] in7,
    input wire[31:0] in8,
    input wire[31:0] in9,
    input wire[31:0] in10,
    input wire[31:0] in11,
    input wire[31:0] in12,
    input wire[31:0] in13,
    input wire[31:0] in14,
    input wire[31:0] in15,
    input wire[31:0] in16,
    input wire[31:0] in17,
    input wire[31:0] in18,
    input wire[31:0] in19,
    input wire[31:0] in20,
    input wire[31:0] in21,
    input wire[31:0] in22,
    input wire[31:0] in23,
    input wire[31:0] in24,
    input wire[31:0] in25,
    input wire[31:0] in26,
    input wire[31:0] in27,
    input wire[31:0] in28,
    input wire[31:0] in29,
    input wire[31:0] in30,
    input wire[31:0] in31,
    input [4:0] sel,
    output reg[31:0] out0
);

always @(*)
begin
    case (sel)
        5'd0:       out0 = in0;
        5'd1:       out0 = in1;
        5'd2:       out0 = in2;
        5'd3:       out0 = in3;
        5'd4:       out0 = in4;
        5'd5:       out0 = in5;
        5'd6:       out0 = in6;
        5'd7:       out0 = in7;
        5'd8:       out0 = in8;
        5'd9:       out0 = in9;
        5'd10:      out0 = in10;
        5'd11:      out0 = in11;
        5'd12:      out0 = in12;
        5'd13:      out0 = in13;
        5'd14:      out0 = in14;
        5'd15:      out0 = in15;
        5'd16:      out0 = in16;
        5'd17:      out0 = in17;
        5'd18:      out0 = in18;
        5'd19:      out0 = in19;
        5'd20:      out0 = in20;
        5'd21:      out0 = in21;
        5'd22:      out0 = in22;
        5'd23:      out0 = in23;
        5'd24:      out0 = in24;
        5'd25:      out0 = in25;
        5'd26:      out0 = in26;
        5'd27:      out0 = in27;
        5'd28:      out0 = in28;
        5'd29:      out0 = in29;
        5'd30:      out0 = in30;
        5'd31:      out0 = in31;
        default:    out0 = 32'd0;
    endcase
end
endmodule
