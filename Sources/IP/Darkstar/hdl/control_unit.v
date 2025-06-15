`timescale 1ns / 1ps

module control
(
    input wire clk,
    input wire arst,
    input wire[31:0] instruction,
    output wire[2:0] ALU_Op,
    output wire Negate,
    output wire wireWrite,
    output wire B_Src,
    output wire MemSigned,
    output wire MemWrite,
    output wire MemRead,
    output wire[1:0] MemSize,
    output wire BEQ,
    output wire BNE,
    output wire BLT,
    output wire BGE,
    output wire BLTU,
    output wire BGEU,
    output wire LUI,
    output wire AUIPC,
    output wire JAL,
    output wire JALR,
    output wire Valid,
    output wire[31:0] Immediate
);

wire[6:0] opcode;
wire[2:0] funct3;
wire[6:0] funct7;

assign opcode = instruction[6:0];
assign funct3 = instruction[14:12];
assign funct7 = instruction[31:25];

// Deal with the rest later

endmodule
