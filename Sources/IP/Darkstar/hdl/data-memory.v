`timescale 1ns / 1ps

module data_memory
(
    input wire clk,             // Clock Signal
    input wire arst,            // Asynchronous Reset
    input wire valid,           // Data Valid signal from PS to read data
    input wire signext,         // Signal to sign extend data
    input wire load,            // Load Signal
    input wire store,           // Store Signal
    input wire[1:0] size,       // Size flag (00 = Byte, 01 = Half Word, 10 = Full Word, 11 = Invalid)
    input wire[31:0] ain,       // Memory Address (Input)
    input wire[31:0] din,       // Input Data to store to memory
    output reg ack,             // Acknowledgement signal to PS that data has been retrieved
    output reg rdReq,           // Read Request to DDR memory
    output reg wrReq,           // Write Request to DDR memory
    output reg[31:0] aout,      // Memory Address (Output)
    output reg[31:0] dout       // Output data loaded from memory
);





endmodule
