`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2025 08:42:06 PM
// Design Name: 
// Module Name: Debounce_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Debounce_TB;

reg clk;
reg rst;
reg dirty;
wire clean;

// UUT
Debounce uut
(
    .clk(clk),
    .rst(rst),
    .width(24'd1000),
    .dirty(dirty),
    .clean(clean)
);

initial
    begin
        #0
        clk   = 1'b0;
        rst   = 1'b0;
        dirty = 1'b0;
        
        // Reset
        #100
        rst   = 1'b1;
        
        #50
        rst   = 1'b0;
        
        #50
        dirty = 1'b1;
        
        #12000
        dirty = 1'b0;
        
        #6000
        dirty = 1'b1;
        
        #500
        $finish;
    end

always #4 clk = ~clk;

endmodule
