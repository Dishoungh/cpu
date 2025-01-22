`timescale 1 ps / 1 ps

module Debounce
(
    input wire clk,
    input wire rst,
    input wire[23:0] width,
    input wire dirty,
    output reg clean
);

// Internal Registers
reg[1:0] current_state;
reg[1:0] next_state;
reg[23:0] counter;

wire changed;
assign changed = dirty ^ clean; // changed is high when dirty is different from clean

// States
parameter INIT              = 2'd0;
parameter WAIT_FOR_CHANGE   = 2'd1;
parameter COUNT             = 2'd2;
parameter UPDATE            = 2'd3;

// Current State Logic
always @(posedge clk or posedge rst)
begin
    if (rst)
        current_state <= INIT;
    else
        current_state <= next_state;
end

// Next State Logic
always @(negedge clk or posedge rst)
begin
    if (rst)
        next_state <= INIT;
    else
        begin
            case (current_state)
                INIT:
                    next_state <= WAIT_FOR_CHANGE;
                WAIT_FOR_CHANGE:
                    begin
                        if (changed)
                            next_state <= COUNT;
                        else
                            next_state <= WAIT_FOR_CHANGE;
                    end
                COUNT:
                    begin
                        if (counter >= (width - 1))        // Update Clean Output
                            next_state <= UPDATE;
                        else if (!changed)                 // Input Failed to Stabilize Long Enough
                            next_state <= WAIT_FOR_CHANGE;
                        else
                            next_state <= COUNT;
                    end
                UPDATE:
                    next_state <= WAIT_FOR_CHANGE;
                default:
                    next_state <= INIT;
            endcase
        end
end

// Output Logic
always @(negedge clk or posedge rst)
begin
    if (rst)
        begin
            clean   <= 1'b0;
            counter <= 16'd0;
        end
    else
        begin
            case (current_state)
                INIT:
                    begin
                        clean   <= 1'b0;
                        counter <= 16'd0;
                    end
                WAIT_FOR_CHANGE:
                    begin
                        clean   <= clean;
                        counter <= 16'd0;
                    end
                COUNT:
                    begin
                        clean   <= clean;
                        counter <= counter + 1;
                    end
                UPDATE:
                    begin
                        clean   <= dirty;
                        counter <= 16'd0;
                    end
                default:
                    begin
                        clean   <= 1'b0;
                        counter <= 16'd0;
                    end
            endcase
        end
end

endmodule