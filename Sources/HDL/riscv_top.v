`timescale 1ns / 1ps

module riscv_top
(
    input wire clk,
    input wire[0:0] sw,
    input wire[2:0] btn,
    output wire[0:0] led
);

// User Signals
wire genClk;        // User can switch between an 125 MHz or a manual clock with sw[0]
wire reset;         // User can reset CPU with btn[0]
wire clock_mode;    // Switch off means 125 MHz clock is used; Switch on means manual clock mode
wire manualClock;   // User can control clock manually with btn[1]

// Debounce Input Signals
debounce db0
(
    .clk(clk),
    .arst(btn[2]),
    .width(32'd1000000),
    .d(sw[0]),
    .q(clock_mode)
);

debounce db1
(
    .clk(clk),
    .arst(btn[2]),
    .width(32'd1000000),
    .d(btn[0]),
    .q(reset)
);

debounce db2
(
    .clk(clk),
    .arst(btn[2]),
    .width(32'd1000000),
    .d(btn[1]),
    .q(manualClock)
);

// Signal Assignments
assign genClk       = (clock_mode) ? manualClock : clk;                        
assign led[0]       = clock_mode;                       // LED will be used to tell the clock mode

riscv riscv_bd
(
    .clk(genClk),
    .reset(reset)
);

endmodule
