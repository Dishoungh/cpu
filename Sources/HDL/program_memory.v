`timescale 1ns / 1ps

module program_memory
(
    input wire clk,         // Clock Signal
    input wire[31:0] addr,  // Address
    output reg[31:0] dout   // Output Data
);

reg[7:0] mem[0:1023];
integer i;

wire[9:0] address;
assign address = addr[9:0]; // 10 bits (1KB)

// Read Program Data
always @(posedge clk)
    dout <= mem[address];

/*
initial begin
    $readmemh("addi.mem", mem);
end
*/

endmodule
