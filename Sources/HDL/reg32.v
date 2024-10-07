`timescale 1ns / 1ps

module reg32
(
    input wire clk,         // Clock
    input wire arst,        // Asynchronous Reset
    input wire we,          // Write Enable
    input wire[31:0] d,     // Data Input
    output reg[31:0] q      // Data Output
);

always @(posedge clk or posedge arst)
begin
    if (arst)
        q <= 32'd0;
    else if (we)
        q <= d;
    else
        q <= q;
end
endmodule
