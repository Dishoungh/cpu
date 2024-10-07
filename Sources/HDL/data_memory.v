`timescale 1ns / 1ps

module data_memory
(
    input wire clk,         // Clock Signal
    input wire arst,        // Asynchronous Reset (Active High)
    input wire signext,     // 0 = No Sign Extension | 1 = Sign Extend 
    input wire load,        // Enables Data Loading
    input wire store,       // Enables Data Storing
    input wire[1:0] size,   // 00 = Store/Load Byte | 01 = Store/Load Half Word | 10 = Store/Load Word | 11 = Invalid
    input wire[31:0] addr,  // Address
    input wire[31:0] din,   // Input Data
    output reg[31:0] dout   // Output Data
);

reg[7:0] mem[0:1023];
integer i;

wire[9:0] address;
assign address = addr[9:0]; // 10 bits (1KB)

// Store Data Logic
always @(posedge clk or posedge arst)
begin
    if (arst)   // Asynchronous Reset
        begin
            for (i = 0; i < 1024; i = i + 1)
            begin
                mem[i] <= 8'b00000000;
            end
        end
    else
        begin
            if (store)
                begin
                    case (size)
                        2'b00:
                            begin
                                mem[address+0] <= din[7:0];
                            end
                        2'b01:
                            begin
                                mem[address+0] <= din[7:0];
                                mem[address+1] <= din[15:8];
                            end
                        2'b10:
                            begin
                                mem[address+0] <= din[7:0];
                                mem[address+1] <= din[15:8];
                                mem[address+2] <= din[23:16];
                                mem[address+3] <= din[31:24];
                            end
                        default:
                            begin
                                mem[address+0] <= mem[address+0];
                            end
                    endcase
                end
        end
        
end

// Load Data Logic
always @(posedge clk or posedge arst)
begin
    if (arst)
        dout <= 32'd0;
    else
        begin
            if (load)
                begin
                    case (size)
                        2'b00:      dout <= (signext) ? {{24{mem[address+0][7]}}, mem[address+0]} : {24'd0, mem[address+0]};
                        2'b01:      dout <= (signext) ? {{16{mem[address+1][7]}}, mem[address+1], mem[address+0]} : {16'd0, mem[address+1], mem[address+0]};
                        2'b10:      dout <= {mem[address+3], mem[address+2], mem[address+1], mem[address+0]};
                        default:    dout <= 32'd0;
                    endcase
                end
            else
                dout <= 32'b00000000000000000000000000000000;
        end
end

endmodule
