`timescale 1ns / 1ps

module debounce
(
    input wire clk,         // Clock Signal
    input wire arst,        // Asynchronous Reset
    input wire[31:0] width, // How many clock cycles to debounce signal (if 0, use a default of 10)
    input wire d,
    output reg q
);

reg[3:0] current_state;
reg[3:0] next_state;
reg[31:0] cntr; //Temporary count value

parameter INIT                  = 2'b00;
parameter WAIT_FOR_DATA_CHANGE  = 2'b01;
parameter COUNT                 = 2'b10;
parameter LATCH_NEW_DATA        = 2'b11;

always @(posedge clk or posedge arst)
begin
    if (arst)
        current_state <= INIT;
    else
        current_state <= next_state;
end

always @(posedge clk or posedge arst)
begin
    if (arst)
        next_state <= WAIT_FOR_DATA_CHANGE;
    else
        begin
            case (current_state)
                INIT:
                    next_state <= WAIT_FOR_DATA_CHANGE;
                WAIT_FOR_DATA_CHANGE:
                    begin
                        if (d != q)
                            next_state <= COUNT;
                        else
                            next_state <= WAIT_FOR_DATA_CHANGE;
                    end
                COUNT:
                    begin
                        if (d == q)
                            next_state <= WAIT_FOR_DATA_CHANGE;
                        else if (cntr >= width)
                            next_state <= LATCH_NEW_DATA;
                        else
                            next_state <= COUNT;
                    end
                LATCH_NEW_DATA:
                    next_state <= WAIT_FOR_DATA_CHANGE;
                default:
                    next_state <= INIT;
            endcase
        end
end

always @(posedge clk or posedge arst)
begin
    if (arst)
        begin
            q       <= 1'b0;
            cntr    <= 32'd0;
        end
    else
        begin
            case (current_state)
                INIT:
                    begin
                        q       <= 1'b0;
                        cntr    <= 32'd0;
                    end
                WAIT_FOR_DATA_CHANGE:
                    begin
                        q       <= q;
                        cntr    <= 32'd0;
                    end
                COUNT:
                    begin
                        q       <= q;
                        cntr    <= cntr + 1;
                    end
                LATCH_NEW_DATA:
                    begin
                        q       <= ~q;
                        cntr    <= 32'd0;
                    end
                default:
                    begin
                        q       <= 1'b0;
                        cntr    <= 32'd0;
                    end
            endcase
        end
end

endmodule
