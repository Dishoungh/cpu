`timescale 1ns / 1ps

// Test Bench for ALU

module alu_tb;

reg[31:0] a;
reg[31:0] b;
reg[2:0] op;
reg negate;

wire[31:0] res;
wire z;
wire n;
wire c;
wire o;

alu uut
(
    .clk(clk),
    .arst(arst),
    .a(a),
    .b(b),
    .op(op),
    .negate(negate),
    .result(res),
    .zero(z),
    .negative(n),
    .carry(c),
    .overflow(o)
);

initial
    begin
        #0
        a       = 32'd0;
        b       = 32'd0;
        op      = 3'b000;
        negate  = 1'b0;
        
        // ADD
        #25
        a       = 32'd48;
        b       = 32'd8;
        op      = 3'b000;
        negate  = 1'b0;
        
        #25
        a       = 32'd9282;
        b       = 32'd19358;
        op      = 3'b000;
        negate  = 1'b0;
        
        #25
        a       = 32'd4294967293;
        b       = 32'd2;
        op      = 3'b000;
        negate  = 1'b0;
        
        #25
        a       = 32'd4294967293;
        b       = 32'd3;
        op      = 3'b000;
        negate  = 1'b0;
        
        // SUB
        #25
        a       = 32'd4294967293;
        b       = 32'd2;
        op      = 3'b000;
        negate  = 1'b1;
        
        #25
        a       = 32'd285971;
        b       = 32'd285926;
        op      = 3'b000;
        negate  = 1'b1;
        
        #25
        a       = 32'd0;
        b       = 32'd1;
        op      = 3'b000;
        negate  = 1'b1;
        
        #25
        a       = 32'd1;
        b       = 32'd3;
        op      = 3'b000;
        negate  = 1'b1;
        
        // SLL
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd4;
        op      = 3'b001;
        negate  = 1'b0;
        
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd8;
        op      = 3'b001;
        negate  = 1'b0;
        
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd20;
        op      = 3'b001;
        negate  = 1'b0;
        
        // SLT
        #25
        a       = 32'd5;
        b       = 32'd4;
        op      = 3'b010;
        negate  = 1'b1;
        
        #25
        a       = 32'd2500;
        b       = 32'd2500;
        op      = 3'b010;
        negate  = 1'b1;
        
        #25
        a       = 32'd2500;
        b       = 32'd2501;
        op      = 3'b010;
        negate  = 1'b1;
        
        #25 // This should be set
        a       = 32'hFFFFFFFF;
        b       = 32'h7FFFFFFF;
        op      = 3'b010;
        negate  = 1'b1;
        
        // SLTU
        #25
        a       = 32'd5;
        b       = 32'd4;
        op      = 3'b011;
        negate  = 1'b1;
        
        #25
        a       = 32'd2500;
        b       = 32'd2500;
        op      = 3'b011;
        negate  = 1'b1;
        
        #25
        a       = 32'd2500;
        b       = 32'd2501;
        op      = 3'b011;
        negate  = 1'b1;
        
        #25
        a       = 32'h7FFFFFFF;
        b       = 32'hFFFFFFFF;
        op      = 3'b011;
        negate  = 1'b1;
        
        // XOR
        #25      //    1010 1001 1111 0100 1001 0010 1101 0011 (A9F492D3)
        a       = 32'b10101010101010101010101010101010;
        b       = 32'b00000011010111100011100001111001;
        op      = 3'b100;
        negate  = 1'b0;
        
        #25
        a       = 32'hFFFFFFFF;
        b       = 32'hDEADBEEF;
        op      = 3'b100;
        negate  = 1'b0;
        
        // SRL
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd4;
        op      = 3'b101;
        negate  = 1'b0;
        
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd8;
        op      = 3'b101;
        negate  = 1'b0;
        
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd20;
        op      = 3'b101;
        negate  = 1'b0;
        
        
        // SRA
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd4;
        op      = 3'b101;
        negate  = 1'b1;
        
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd8;
        op      = 3'b101;
        negate  = 1'b1;
        
        #25
        a       = 32'hDEADBEEF;
        b       = 32'd20;
        op      = 3'b101;
        negate  = 1'b1;
        
        // OR
        #25
        a       = 32'b10101010101010101010101010101010;
        b       = 32'b00000011010111100011100001111001;
        op      = 3'b110;
        negate  = 1'b0;
        
        #25
        a       = 32'hFFFFFFFF;
        b       = 32'hDEADBEEF;
        op      = 3'b110;
        negate  = 1'b0;
        
        // AND
        #25
        a       = 32'b10101010101010101010101010101010;
        b       = 32'b00000011010111100011100001111001;
        op      = 3'b111;
        negate  = 1'b0;
        
        #25
        a       = 32'hFFFFFFFF;
        b       = 32'hDEADBEEF;
        op      = 3'b111;
        negate  = 1'b0;
        
        #10
        $finish;
    end

endmodule
