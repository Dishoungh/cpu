`timescale 1ns / 1ps

module test;

/*
// Adder Test Bench
reg[31:0] a;
reg[31:0] b;
reg cin;
wire[31:0] sum;
wire cout;

cla32 uut
(
    .a(a),
    .b(b),
    .cin(cin),
    .cout(cout),
    .sum(sum)
);

initial
    begin
        #0
        a = 32'd0;
        b = 32'd0;
        cin = 1'b0; 
        
        #25
        a = 32'd520;
        b = 32'd29;
        
        #25
        cin = 1'b1;
        
        #25
        a = 32'hFFFFFFFF;
        b = 32'hFFFFFFFA;
        cin = 1'b0;
        
        #25
        a = 32'd10000;
        b = 32'd10000;
        
        #25
        a = 32'hFFFFFFFF;
        b = 32'd0;
        cin = 1'b1;
        
        
        #25
        $finish;
    end
*/

/*
//    Register Testbench
reg clk;
reg arst;
reg we;
reg[31:0] d;
wire[31:0] q;

reg32 uut
(
    .clk(clk),
    .arst(arst),
    .we(we),
    .d(d),
    .q(q)
);

initial
    begin
        #0
        clk         = 1'b0;
        arst        = 1'b0;
        we          = 1'b0;
        d           = 32'd0;
        
        #50 arst    = 1'b1;
        #5 arst     = 1'b0;
        #8 we       = 1'b1;
        #23 d       = 32'hDEADBEEF;
        #57 d       = 32'hBEEF0033;
        #33 d       = 32'h01234567;
        #60 we      = 1'b0;
        #23 d       = 32'h00840078;
        #9  arst    = 1'b1;
        #46 d       = 32'd0;
        
        #100 $finish;
    end

always #5 clk = ~clk;
*/

//    Data Memory Testbench

reg clk;
reg arst;
reg signext;
reg load;
reg store;
reg[1:0] size;
reg[31:0] addr;
reg[31:0] din;
wire[31:0] dout;

data_memory uut
(
    .clk(clk),
    .arst(arst),
    .signext(signext),
    .load(load),
    .store(store),
    .size(size),
    .addr(addr),
    .din(din),
    .dout(dout)
);

initial
    begin
        #0
        clk     = 1'b0;
        arst    = 1'b0;
        signext = 1'b0;
        load    = 1'b0;
        store   = 1'b0;
        size    = 2'b00;
        addr    = 32'd0;
        din     = 32'd0;
        
        #20
        arst    = 1'b1;
        
        #20
        arst    = 1'b0;
        
        // Store Byte
        #15
        din     = 32'h000000EF;
        store   = 1'b1;
        size    = 2'b00;
        addr    = 32'd32;
        
        // Store Half Word
        #30
        din     = 32'h0000BEEF;
        store   = 1'b1;
        size    = 2'b01;
        addr    = 32'd36;
        
        // Store Word
        #20
        din     = 32'hDEADBEEF;
        store   = 1'b1;
        size    = 2'b10;
        addr    = 32'd40;
        
        #10
        store   = 1'b0;
        
        // Load Byte (Signed)
        #15
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b00;
        addr    = 32'd32;
        
        // Load Byte (Unsigned)
        #15
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b00;
        addr    = 32'd32;
        
        // Load Half Word (Signed)
        #15
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b01;
        addr    = 32'd36;
        
        // Load Half Word (Unsigned)
        #15
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b01;
        addr    = 32'd36;
        
        // Load Word
        #15
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b10;
        addr    = 32'd40;
        
        #30
        $finish;
    end

always #5 clk = ~clk;

endmodule