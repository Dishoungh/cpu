`timescale 1ns / 1ps

module data_memory
(
    input wire clk,         // Clock Signal
    input wire arst,        // Asynchronous Reset (Active High)
    input wire signext,     // 0 = No Sign Extension | 1 = Sign Extend 
    input wire load,        // Enables Data Loading
    input wire store,       // Enables Data Storing
    input wire[1:0] size,   // 00 = Store/Load Byte | 01 = Store/Load Half Word | 10 = Store/Load Word | 11 = Invalid
    input wire[31:0] addr,  // 2^12 bytes = 4KB
    input wire[31:0] din,   // Input Data
    output reg[31:0] dout   // Output Data
);

reg[7:0] mem[0:8191];
integer i;

// Store Data Logic
always @(posedge clk or posedge arst)
begin
    if (arst)   // Asynchronous Reset
        begin
            for (i = 0; i < 8192; i = i + 1)
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
                                mem[addr[11:0]+0] <= din[7:0];
                            end
                        2'b01:
                            begin
                                mem[addr[11:0]+0] <= din[7:0];
                                mem[addr[11:0]+1] <= din[15:8];
                            end
                        2'b10:
                            begin
                                mem[addr[11:0]+0] <= din[7:0];
                                mem[addr[11:0]+1] <= din[15:8];
                                mem[addr[11:0]+2] <= din[23:16];
                                mem[addr[11:0]+3] <= din[31:24];
                            end
                        default:
                            begin
                                mem[addr[11:0]+0] <= mem[addr[11:0]+0];
                            end
                    endcase
                end
            else
                begin
                    for (i = 0; i < 8192; i = i + 1)
                    begin
                        mem[i] <= mem[i];
                    end
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
                        2'b00:      dout <= (signext) ? {{24{mem[addr[11:0]][7]}}, mem[addr[11:0]]} : {24'd0, mem[addr[11:0]]};
                        2'b01:      dout <= (signext) ? {{16{mem[addr[11:0]+1][7]}}, mem[addr[11:0]+1], mem[addr[11:0]+0]} : {16'd0, mem[addr[11:0]+1], mem[addr[11:0]+0]};
                        2'b10:      dout <= {mem[addr[11:0]+3], mem[addr[11:0]+2], mem[addr[11:0]+1], mem[addr[11:0]]};
                        default:    dout <= 32'd0;
                    endcase
                end
            else
                dout <= 32'b00000000000000000000000000000000;
        end
end

endmodule
