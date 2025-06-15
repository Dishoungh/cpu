`timescale 1ns / 1ps

// Arithmetic Logic Unit

module alu
(
    input wire[31:0] a,
    input wire[31:0] b,
    input wire[2:0] op,
    input wire negate,
    output wire[31:0] result,
    // Status Signals
    output wire zero,
    output wire negative,
    output wire carry,
    output wire overflow
);

/*
    Operations
        - 000 = ADD/SUB (Determined by negate)
        - 001 = SLL (Shift Left Logical)
        - 010 = SLT (Set if Less Than)
        - 011 = SLTU (Set if Less Than Unsigned)
        - 100 = XOR
        - 101 = SRL/SRA (Shift Right Logical / Shift Right Arithmetic) (Determined by negate)
        - 110 = OR
        - 111 = AND
*/

// Parameters
parameter ADD  = 3'b000;
parameter SLL  = 3'b001;
parameter SLT  = 3'b010;
parameter SLTU = 3'b011;
parameter XOR  = 3'b100;
parameter SRL  = 3'b101;
parameter OR   = 3'b110;
parameter AND  = 3'b111;

// Adder Signals
wire[31:0] adder_result;
wire[31:0] b_opt;
wire adder_cout;

// SLL Signals
wire[31:0] sll_result;

// SLT Signals
wire slt_flag;

// SLTU Signals
wire sltu_flag;

// XOR Signals
wire[31:0] xor_result;

// SRL/SRA Signals
wire[31:0] right_shift_result;
wire[31:0] logical_right;
wire[31:0] arithmetic_right;

// OR Signals
wire[31:0] or_result;

// AND Signals
wire[31:0] and_result;


assign zero = ~{|result}; // All bits in result must be low for zero to be high
assign negative = result[31]; // Result is negative when most significant bit is high (assuming signed operation)
assign carry = adder_cout; // Carry will come from adder's cout wire
assign overflow = (a[31] ^ adder_result[31]) & ((~(a[31] ^ b[31]) & ~negate) | ((a[31] ^ b[31]) & negate));

assign result = (op == ADD)  ? adder_result          :
                (op == SLL)  ? sll_result            :
                (op == SLT)  ? {30'd0, slt_flag}     :
                (op == SLTU) ? {30'd0, sltu_flag}    :
                (op == XOR)  ? xor_result            :
                (op == SRL)  ? right_shift_result    :
                (op == OR)   ? or_result             :
                (op == AND)  ? and_result            :
                32'd0;

// ADD/SUB
assign b_opt = (negate) ? ~b : b;

cla32 adder
(
    .a(a),
    .b(b_opt),
    .cin(negate),
    .cout(adder_cout),
    .sum(adder_result)
);

// SLL
assign sll_result[31:0] = a[31:0] << b[4:0];

// SLT (A is less than B when ((Sum[31] xor Overflow) and Negate) are true)
assign slt_flag = (adder_result[31] ^ overflow) & negate;

// SLTU (A is less than B unsigned when ~Carry and Negate are true)
assign sltu_flag = ~carry & negate;

// XOR
assign xor_result = {a[31] ^ b[31],
                     a[30] ^ b[30],
                     a[29] ^ b[29],
                     a[28] ^ b[28],
                     a[27] ^ b[27],
                     a[26] ^ b[26],
                     a[25] ^ b[25],
                     a[24] ^ b[24],
                     a[23] ^ b[23],
                     a[22] ^ b[22],
                     a[21] ^ b[21],
                     a[20] ^ b[20],
                     a[19] ^ b[19],
                     a[18] ^ b[18],
                     a[17] ^ b[17],
                     a[16] ^ b[16],
                     a[15] ^ b[15],
                     a[14] ^ b[14],
                     a[13] ^ b[13],
                     a[12] ^ b[12],
                     a[11] ^ b[11],
                     a[10] ^ b[10],
                     a[9] ^ b[9],
                     a[8] ^ b[8],
                     a[7] ^ b[7],
                     a[6] ^ b[6],
                     a[5] ^ b[5],
                     a[4] ^ b[4],
                     a[3] ^ b[3],
                     a[2] ^ b[2],
                     a[1] ^ b[1],
                     a[0] ^ b[0]};
                     
// SRL/SRA
assign logical_right[31:0] = (b[4:0] == 5'd0)  ? a[31:0]            :
                             (b[4:0] == 5'd1)  ? { 1'd0, a[31:1] }  :
                             (b[4:0] == 5'd2)  ? { 2'd0, a[31:2] }  :
                             (b[4:0] == 5'd3)  ? { 3'd0, a[31:3] }  :
                             (b[4:0] == 5'd4)  ? { 4'd0, a[31:4] }  :
                             (b[4:0] == 5'd5)  ? { 5'd0, a[31:5] }  :
                             (b[4:0] == 5'd6)  ? { 6'd0, a[31:6] }  :
                             (b[4:0] == 5'd7)  ? { 7'd0, a[31:7] }  :
                             (b[4:0] == 5'd8)  ? { 8'd0, a[31:8] }  :
                             (b[4:0] == 5'd9)  ? { 9'd0, a[31:9] }  :
                             (b[4:0] == 5'd10) ? { 10'd0, a[31:10] } :
                             (b[4:0] == 5'd11) ? { 11'd0, a[31:11] } :
                             (b[4:0] == 5'd12) ? { 12'd0, a[31:12] } :
                             (b[4:0] == 5'd13) ? { 13'd0, a[31:13] } :
                             (b[4:0] == 5'd14) ? { 14'd0, a[31:14] } :
                             (b[4:0] == 5'd15) ? { 15'd0, a[31:15] } :
                             (b[4:0] == 5'd16) ? { 16'd0, a[31:16] } :
                             (b[4:0] == 5'd17) ? { 17'd0, a[31:17] } :
                             (b[4:0] == 5'd18) ? { 18'd0, a[31:18] } :
                             (b[4:0] == 5'd19) ? { 19'd0, a[31:19] } :
                             (b[4:0] == 5'd20) ? { 20'd0, a[31:20] } :
                             (b[4:0] == 5'd21) ? { 21'd0, a[31:21] } :
                             (b[4:0] == 5'd22) ? { 22'd0, a[31:22] }  :
                             (b[4:0] == 5'd23) ? { 23'd0, a[31:23] }  :
                             (b[4:0] == 5'd24) ? { 24'd0, a[31:24] }  :
                             (b[4:0] == 5'd25) ? { 25'd0, a[31:25] }  :
                             (b[4:0] == 5'd26) ? { 26'd0, a[31:26] }  :
                             (b[4:0] == 5'd27) ? { 27'd0, a[31:27] }  :
                             (b[4:0] == 5'd28) ? { 28'd0, a[31:28] }  :
                             (b[4:0] == 5'd29) ? { 29'd0, a[31:29] }  :
                             (b[4:0] == 5'd30) ? { 30'd0, a[31:30] }  :
                             (b[4:0] == 5'd31) ? { 31'd0, a[31] }    :
                             32'd0;

assign arithmetic_right[31:0] = (b[4:0] == 5'd0)  ? a[31:0]                   :
                                (b[4:0] == 5'd1)  ? { a[31], a[31:1] }        :
                                (b[4:0] == 5'd2)  ? { {2{a[31]}}, a[31:2] }   :
                                (b[4:0] == 5'd3)  ? { {3{a[31]}}, a[31:3] }   :
                                (b[4:0] == 5'd4)  ? { {4{a[31]}}, a[31:4] }   :
                                (b[4:0] == 5'd5)  ? { {5{a[31]}}, a[31:5] }   :
                                (b[4:0] == 5'd6)  ? { {6{a[31]}}, a[31:6] }   :
                                (b[4:0] == 5'd7)  ? { {7{a[31]}}, a[31:7] }   :
                                (b[4:0] == 5'd8)  ? { {8{a[31]}}, a[31:8] }   :
                                (b[4:0] == 5'd9)  ? { {9{a[31]}}, a[31:9] }   :
                                (b[4:0] == 5'd10) ? { {10{a[31]}}, a[31:10] } :
                                (b[4:0] == 5'd11) ? { {11{a[31]}}, a[31:11] } :
                                (b[4:0] == 5'd12) ? { {12{a[31]}}, a[31:12] } :
                                (b[4:0] == 5'd13) ? { {13{a[31]}}, a[31:13] } :
                                (b[4:0] == 5'd14) ? { {14{a[31]}}, a[31:14] } :
                                (b[4:0] == 5'd15) ? { {15{a[31]}}, a[31:15] } :
                                (b[4:0] == 5'd16) ? { {16{a[31]}}, a[31:16] } :
                                (b[4:0] == 5'd17) ? { {17{a[31]}}, a[31:17] } :
                                (b[4:0] == 5'd18) ? { {18{a[31]}}, a[31:18] } :
                                (b[4:0] == 5'd19) ? { {19{a[31]}}, a[31:19] } :
                                (b[4:0] == 5'd20) ? { {20{a[31]}}, a[31:20] } :
                                (b[4:0] == 5'd21) ? { {21{a[31]}}, a[31:21] } :
                                (b[4:0] == 5'd22) ? { {22{a[31]}}, a[31:22] } :
                                (b[4:0] == 5'd23) ? { {23{a[31]}}, a[31:23] } :
                                (b[4:0] == 5'd24) ? { {24{a[31]}}, a[31:24] } :
                                (b[4:0] == 5'd25) ? { {25{a[31]}}, a[31:25] } :
                                (b[4:0] == 5'd26) ? { {26{a[31]}}, a[31:26] } :
                                (b[4:0] == 5'd27) ? { {27{a[31]}}, a[31:27] } :
                                (b[4:0] == 5'd28) ? { {28{a[31]}}, a[31:28] } :
                                (b[4:0] == 5'd29) ? { {29{a[31]}}, a[31:29] } :
                                (b[4:0] == 5'd30) ? { {30{a[31]}}, a[31:30] } :
                                (b[4:0] == 5'd31) ? { {31{a[31]}}, a[31] }    :
                                32'd0;


assign right_shift_result[31:0] = (negate) ? arithmetic_right : logical_right;

// OR
assign or_result = {a[31] | b[31],
                    a[30] | b[30],
                    a[29] | b[29],
                    a[28] | b[28],
                    a[27] | b[27],
                    a[26] | b[26],
                    a[25] | b[25],
                    a[24] | b[24],
                    a[23] | b[23],
                    a[22] | b[22],
                    a[21] | b[21],
                    a[20] | b[20],
                    a[19] | b[19],
                    a[18] | b[18],
                    a[17] | b[17],
                    a[16] | b[16],
                    a[15] | b[15],
                    a[14] | b[14],
                    a[13] | b[13],
                    a[12] | b[12],
                    a[11] | b[11],
                    a[10] | b[10],
                    a[9] | b[9],
                    a[8] | b[8],
                    a[7] | b[7],
                    a[6] | b[6],
                    a[5] | b[5],
                    a[4] | b[4],
                    a[3] | b[3],
                    a[2] | b[2],
                    a[1] | b[1],
                    a[0] | b[0]};

// AND
assign and_result = {a[31] & b[31],
                     a[30] & b[30],
                     a[29] & b[29],
                     a[28] & b[28],
                     a[27] & b[27],
                     a[26] & b[26],
                     a[25] & b[25],
                     a[24] & b[24],
                     a[23] & b[23],
                     a[22] & b[22],
                     a[21] & b[21],
                     a[20] & b[20],
                     a[19] & b[19],
                     a[18] & b[18],
                     a[17] & b[17],
                     a[16] & b[16],
                     a[15] & b[15],
                     a[14] & b[14],
                     a[13] & b[13],
                     a[12] & b[12],
                     a[11] & b[11],
                     a[10] & b[10],
                     a[9] & b[9],
                     a[8] & b[8],
                     a[7] & b[7],
                     a[6] & b[6],
                     a[5] & b[5],
                     a[4] & b[4],
                     a[3] & b[3],
                     a[2] & b[2],
                     a[1] & b[1],
                     a[0] & b[0]};


endmodule
