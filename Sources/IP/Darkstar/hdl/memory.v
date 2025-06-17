`timescale 1ns / 1ps

// L1 cache for instruction and data memory
// Size = 512 bytes (0.5 kB)

module memory
(
    input wire clk,             // Clock Signal
    input wire arst,            // Asynchronous Reset
    input wire store,           // Store Data in Address
    input wire load,            // Load Data out of Address
    input wire signext,         // Sign Extension Flag
    input wire[1:0] size,       // Byte Enable (00 = Full Word | 01 = Half Word | 10 = Byte | 11 = Invalid)
    input wire[31:0] addr,      // Address Pointer
    input wire[31:0] dataIn,
    output reg[31:0] dataOut
);

integer i;

wire[8:0] address;
assign address = addr[8:0];

// Array
reg[7:0] mem[0:511];

// Data Storing Logic
always @(posedge clk or posedge arst)
begin
    if (arst) // Asynchronous Reset
        begin
            for (i = 0; i < 512; i = i + 1)
            begin
                mem[i] <= 8'b00000000;
            end
        end
    else
        begin
            if (store)
                begin
                    case (size)
                        2'b00: // Full Word
                            begin
                                mem[address+0] <= dataIn[7:0];
                                mem[address+1] <= dataIn[15:8];
                                mem[address+2] <= dataIn[23:16];
                                mem[address+3] <= dataIn[31:24];
                            end
                        2'b01: // Half Word
                            begin
                                mem[address+0] <= dataIn[7:0];
                                mem[address+1] <= dataIn[15:8];
                            end
                        2'b10: // Byte
                            begin
                                mem[address+0] <= dataIn[7:0];
                            end
                        default:
                            begin
                                mem[address+0] <= mem[address+0];
                            end
                    endcase
                end
        end
end

// Data Loading Logic
always @(posedge clk or posedge arst or negedge load)
begin
    if (arst || !load)
        dataOut <= 32'd0;
    else
        begin
            case (size)
                2'b00:      dataOut <= {mem[address+3], mem[address+2], mem[address+1], mem[address+0]};                                                // Load Full Word
                2'b01:      dataOut <= (signext) ? {{16{mem[address+1][7]}}, mem[address+1], mem[address+0]} : {16'd0, mem[address+1], mem[address+0]}; // Load Half Word
                2'b10:      dataOut <= (signext) ? {{24{mem[address+0][7]}}, mem[address+0]} : {24'd0, mem[address+0]};                                 // Load Byte
                default:    dataOut <= 32'd0;
            endcase
        end
end

endmodule
