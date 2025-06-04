`timescale 1ns / 1ps

// Test bench for Register File

module regfile_tb;

reg clk;
reg arst;
reg we;
reg[4:0] rd;
reg[4:0] rAddr1;  // Read Address 1
reg[4:0] rAddr2;  // Read Address 2
reg[31:0] wData;  // Write Data to "rd"
reg[31:0] PC_In;  // Input Program Counter

wire[31:0] PC_Out; // Output Program Counter
wire[31:0] rs1;    // Source Register 1
wire[31:0] rs2;    // Source Register 2

wire[31:0] x0;
wire[31:0] x1;
wire[31:0] x2;
wire[31:0] x3;
wire[31:0] x4;
wire[31:0] x5;
wire[31:0] x6;
wire[31:0] x7;
wire[31:0] x8;
wire[31:0] x9;
wire[31:0] x10;
wire[31:0] x11;
wire[31:0] x12;
wire[31:0] x13;
wire[31:0] x14;
wire[31:0] x15;
wire[31:0] x16;
wire[31:0] x17;
wire[31:0] x18;
wire[31:0] x19;
wire[31:0] x20;
wire[31:0] x21;
wire[31:0] x22;
wire[31:0] x23;
wire[31:0] x24;
wire[31:0] x25;
wire[31:0] x26;
wire[31:0] x27;
wire[31:0] x28;
wire[31:0] x29;
wire[31:0] x30;
wire[31:0] x31;
wire[31:0] pc;

regfile uut
(
    .clk(clk),
    .arst(arst),
    .we(we),
    .rd(rd),
    .rAddr1(rAddr1),
    .rAddr2(rAddr2),
    .wData(wData),
    .PC_In(PC_In),
    .PC_Out(PC_Out),
    .rs1(rs1),
    .rs2(rs2),
    .x0(x0),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .x9(x9),
    .x10(x10),
    .x11(x11),
    .x12(x12),
    .x13(x13),
    .x14(x14),
    .x15(x15),
    .x16(x16),
    .x17(x17),
    .x18(x18),
    .x19(x19),
    .x20(x20),
    .x21(x21),
    .x22(x22),
    .x23(x23),
    .x24(x24),
    .x25(x25),
    .x26(x26),
    .x27(x27),
    .x28(x28),
    .x29(x29),
    .x30(x30),
    .x31(x31),
    .pc(pc)
);

initial
    begin
        #0
        clk     = 1'b0;
        arst    = 1'b0;
        we      = 1'b0;
        rd      = 5'd0;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'd0;
        PC_In   = 32'd0;

        // Reset
        #10
        arst    = 1'b1;
        we      = 1'b0;
        rd      = 5'd0;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'd0;
        PC_In   = 32'd0;

        // Undo Reset
        #10
        arst    = 1'b0;
        we      = 1'b0;
        rd      = 5'd0;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'd0;
        PC_In   = 32'd0;

        // Write 0xDEADBEEF to x4
        #10
        arst    = 1'b0;
        we      = 1'b1;
        rd      = 5'd4;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'hDEADBEEF;
        PC_In   = 32'd4;
        
        // Write 0xA7B3C4D8 to x5
        #10
        arst    = 1'b0;
        we      = 1'b1;
        rd      = 5'd5;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'hA7B3C4D8;
        PC_In   = 32'd8;

        // Write 0x12345678 to x6
        #10
        arst    = 1'b0;
        we      = 1'b1;
        rd      = 5'd6;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'h12345678;
        PC_In   = 32'd12;

        // Write 0xFFCC8000 to x7
        #10
        arst    = 1'b0;
        we      = 1'b1;
        rd      = 5'd7;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'hFFCC8000;
        PC_In   = 32'd16;

        // Write 0x00337744 to x18
        #10
        arst    = 1'b0;
        we      = 1'b1;
        rd      = 5'd18;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'h00337744;
        PC_In   = 32'd20;

        // Write 0xABCD8833 to x23
        #10
        arst    = 1'b0;
        we      = 1'b1;
        rd      = 5'd23;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'hABCD8833;
        PC_In   = 32'd24;

        // Write 0xABCD1199 to x24
        #10
        arst    = 1'b0;
        we      = 1'b1;
        rd      = 5'd24;
        rAddr1  = 5'd0;
        rAddr2  = 5'd0;
        wData   = 32'hABCD1199;
        PC_In   = 32'd28;

        // Put x4 to rs1 and put x5 to rs2
        #10
        arst    = 1'b0;
        we      = 1'b0;
        rd      = 5'd0;
        rAddr1  = 5'd4;
        rAddr2  = 5'd5;
        wData   = 32'd0;
        PC_In   = 32'd32;

        // Put x6 to rs1 and put x7 to rs2
        #10
        arst    = 1'b0;
        we      = 1'b0;
        rd      = 5'd0;
        rAddr1  = 5'd6;
        rAddr2  = 5'd7;
        wData   = 32'd0;
        PC_In   = 32'd36;

        // Put x18 to rs1 and put x23 to rs2
        #10
        arst    = 1'b0;
        we      = 1'b0;
        rd      = 5'd0;
        rAddr1  = 5'd18;
        rAddr2  = 5'd23;
        wData   = 32'd0;
        PC_In   = 32'd40;

        // Put x24 to rs1 and put x0 to rs2
        #10
        arst    = 1'b0;
        we      = 1'b0;
        rd      = 5'd0;
        rAddr1  = 5'd24;
        rAddr2  = 5'd0;
        wData   = 32'd0;
        PC_In   = 32'd44;
        
        #50
        $finish;
    end

always #5 clk = ~clk;

endmodule
