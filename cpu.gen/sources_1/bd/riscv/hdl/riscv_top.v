`timescale 1ns / 1ps

module riscv_top
(
    input wire clk,
    input wire[0:0] sw,
    input wire[1:0] btn,
    output wire[0:0] led
);

// User Signals
wire genClk;
wire reset;
wire clock_mode;
wire manualClock;

// Signal Assignments
assign genClk       = (clock_mode) ? manualClock : clk; // User can switch between an 125 MHz or a manual clock with sw[0]
assign reset        = btn[0];                           // User can reset CPU with btn[0]
assign clock_mode   = sw[0];                            // Switch off means 125 MHz clock is used; Switch on means manual clock mode
assign manualClock  = btn[1];                           // User can control clock manually with btn[1]
assign led[0]       = clock_mode;                       // LED will be used to tell the clock mode

riscv riscv_bd
(
    .clk(genClk),
    .reset(reset)
);

endmodule
