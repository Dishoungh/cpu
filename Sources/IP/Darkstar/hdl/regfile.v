// Module that contains 32 internal registers including the program counter
`timescale 1ns / 1ps

module regfile
(
    input wire clk,          // Clock Signal
    input wire arst,         // Asynchronous Reset
    input wire we,           // Write Enable
    input wire[4:0] rd,      // Destination Register
    input wire[4:0] rAddr1,  // Read Address 1
    input wire[4:0] rAddr2,  // Read Address 2
    input wire[31:0] wData,  // Write Data to "rd"
    input wire[31:0] PC_In,  // Input Program Counter
    output reg[31:0] PC_Out, // Output Program Counter
    output reg[31:0] rs1,    // Source Register 1
    output reg[31:0] rs2     // Source Register 2
    
    ,
    output reg[31:0] x0,
    output reg[31:0] x1,
    output reg[31:0] x2,
    output reg[31:0] x3,
    output reg[31:0] x4,
    output reg[31:0] x5,
    output reg[31:0] x6,
    output reg[31:0] x7,
    output reg[31:0] x8,
    output reg[31:0] x9,
    output reg[31:0] x10,
    output reg[31:0] x11,
    output reg[31:0] x12,
    output reg[31:0] x13,
    output reg[31:0] x14,
    output reg[31:0] x15,
    output reg[31:0] x16,
    output reg[31:0] x17,
    output reg[31:0] x18,
    output reg[31:0] x19,
    output reg[31:0] x20,
    output reg[31:0] x21,
    output reg[31:0] x22,
    output reg[31:0] x23,
    output reg[31:0] x24,
    output reg[31:0] x25,
    output reg[31:0] x26,
    output reg[31:0] x27,
    output reg[31:0] x28,
    output reg[31:0] x29,
    output reg[31:0] x30,
    output reg[31:0] x31,
    output reg[31:0] pc
);

// Internal Registers
/*
reg[31:0] x0;
reg[31:0] x1;
reg[31:0] x2;
reg[31:0] x3;
reg[31:0] x4;
reg[31:0] x5;
reg[31:0] x6;
reg[31:0] x7;
reg[31:0] x8;
reg[31:0] x9;
reg[31:0] x10;
reg[31:0] x11;
reg[31:0] x12;
reg[31:0] x13;
reg[31:0] x14;
reg[31:0] x15;
reg[31:0] x16;
reg[31:0] x17;
reg[31:0] x18;
reg[31:0] x19;
reg[31:0] x20;
reg[31:0] x21;
reg[31:0] x22;
reg[31:0] x23;
reg[31:0] x24;
reg[31:0] x25;
reg[31:0] x26;
reg[31:0] x27;
reg[31:0] x28;
reg[31:0] x29;
reg[31:0] x30;
reg[31:0] x31;
reg[31:0] pc;
*/

// x(*) Logic
always @(posedge clk or posedge arst)
begin
    if (arst)
        begin
            x0      <= 32'd0;
            x1      <= 32'd0;
            x2      <= 32'd0;
            x3      <= 32'd0;
            x4      <= 32'd0;
            x5      <= 32'd0;
            x6      <= 32'd0;
            x7      <= 32'd0;
            x8      <= 32'd0;
            x9      <= 32'd0;
            x10     <= 32'd0;
            x11     <= 32'd0;
            x12     <= 32'd0;
            x13     <= 32'd0;
            x14     <= 32'd0;
            x15     <= 32'd0;
            x16     <= 32'd0;
            x17     <= 32'd0;
            x18     <= 32'd0;
            x19     <= 32'd0;
            x20     <= 32'd0;
            x21     <= 32'd0;
            x22     <= 32'd0;
            x23     <= 32'd0;
            x24     <= 32'd0;
            x25     <= 32'd0;
            x26     <= 32'd0;
            x27     <= 32'd0;
            x28     <= 32'd0;
            x29     <= 32'd0;
            x30     <= 32'd0;
            x31     <= 32'd0;
        end
    else if (we)
        begin
            case (rd)
                5'd0:  x0 <= 32'd0; // x0 will always be zero
                5'd1:  x1 <= wData;
                5'd2:  x2 <= wData;
                5'd3:  x3 <= wData;
                5'd4:  x4 <= wData;
                5'd5:  x5 <= wData;
                5'd6:  x6 <= wData;
                5'd7:  x7 <= wData;
                5'd8:  x8 <= wData;
                5'd9:  x9 <= wData;
                5'd10: x10 <= wData;
                5'd11: x11 <= wData;
                5'd12: x12 <= wData;
                5'd13: x13 <= wData;
                5'd14: x14 <= wData;
                5'd15: x15 <= wData;
                5'd16: x16 <= wData;
                5'd17: x17 <= wData;
                5'd18: x18 <= wData;
                5'd19: x19 <= wData;
                5'd20: x20 <= wData;
                5'd21: x21 <= wData;
                5'd22: x22 <= wData;
                5'd23: x23 <= wData;
                5'd24: x24 <= wData;
                5'd25: x25 <= wData;
                5'd26: x26 <= wData;
                5'd27: x27 <= wData;
                5'd28: x28 <= wData;
                5'd29: x29 <= wData;
                5'd30: x30 <= wData;
                5'd31: x31 <= wData;
                default: x0 <= 32'd0;
            endcase
        end
    else
        begin
            x0      <= x0;
            x1      <= x1;
            x2      <= x2;
            x3      <= x3;
            x4      <= x4;
            x5      <= x5;
            x6      <= x6;
            x7      <= x7;
            x8      <= x8;
            x9      <= x9;
            x10     <= x10;
            x11     <= x11;
            x12     <= x12;
            x13     <= x13;
            x14     <= x14;
            x15     <= x15;
            x16     <= x16;
            x17     <= x17;
            x18     <= x18;
            x19     <= x19;
            x20     <= x20;
            x21     <= x21;
            x22     <= x22;
            x23     <= x23;
            x24     <= x24;
            x25     <= x25;
            x26     <= x26;
            x27     <= x27;
            x28     <= x28;
            x29     <= x29;
            x30     <= x30;
            x31     <= x31;
        end
end

// Program Counter Logic
always @(posedge clk or posedge arst)
    if (arst)
        PC_Out <= 32'd0;
    else
        PC_Out <= pc;

always @(posedge clk or posedge arst)
    if (arst)
        pc <= 32'd0;
    else
        pc <= PC_In;

// RS1 Logic
always @(posedge clk or posedge arst)
begin
    if (arst)
        rs1 <= 32'd0;
    else
        begin
            case (rAddr1)
                5'd0:  rs1 <= x0;
                5'd1:  rs1 <= x1;
                5'd2:  rs1 <= x2;
                5'd3:  rs1 <= x3;
                5'd4:  rs1 <= x4;
                5'd5:  rs1 <= x5;
                5'd6:  rs1 <= x6;
                5'd7:  rs1 <= x7;
                5'd8:  rs1 <= x8;
                5'd9:  rs1 <= x9;
                5'd10: rs1 <= x10;
                5'd11: rs1 <= x11;
                5'd12: rs1 <= x12;
                5'd13: rs1 <= x13;
                5'd14: rs1 <= x14;
                5'd15: rs1 <= x15;
                5'd16: rs1 <= x16;
                5'd17: rs1 <= x17;
                5'd18: rs1 <= x18;
                5'd19: rs1 <= x19;
                5'd20: rs1 <= x20;
                5'd21: rs1 <= x21;
                5'd22: rs1 <= x22;
                5'd23: rs1 <= x23;
                5'd24: rs1 <= x24;
                5'd25: rs1 <= x25;
                5'd26: rs1 <= x26;
                5'd27: rs1 <= x27;
                5'd28: rs1 <= x28;
                5'd29: rs1 <= x29;
                5'd30: rs1 <= x30;
                5'd31: rs1 <= x31;
                default: rs1 <= x0;
            endcase
        end
end

always @(posedge clk or posedge arst)
begin
    if (arst)
        rs2 <= 32'd0;
    else
        begin
            case (rAddr1)
                5'd0:  rs2 <= x0;
                5'd1:  rs2 <= x1;
                5'd2:  rs2 <= x2;
                5'd3:  rs2 <= x3;
                5'd4:  rs2 <= x4;
                5'd5:  rs2 <= x5;
                5'd6:  rs2 <= x6;
                5'd7:  rs2 <= x7;
                5'd8:  rs2 <= x8;
                5'd9:  rs2 <= x9;
                5'd10: rs2 <= x10;
                5'd11: rs2 <= x11;
                5'd12: rs2 <= x12;
                5'd13: rs2 <= x13;
                5'd14: rs2 <= x14;
                5'd15: rs2 <= x15;
                5'd16: rs2 <= x16;
                5'd17: rs2 <= x17;
                5'd18: rs2 <= x18;
                5'd19: rs2 <= x19;
                5'd20: rs2 <= x20;
                5'd21: rs2 <= x21;
                5'd22: rs2 <= x22;
                5'd23: rs2 <= x23;
                5'd24: rs2 <= x24;
                5'd25: rs2 <= x25;
                5'd26: rs2 <= x26;
                5'd27: rs2 <= x27;
                5'd28: rs2 <= x28;
                5'd29: rs2 <= x29;
                5'd30: rs2 <= x30;
                5'd31: rs2 <= x31;
                default: rs2 <= x0;
            endcase
        end
end

endmodule