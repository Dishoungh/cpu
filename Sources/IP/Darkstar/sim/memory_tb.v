`timescale 1ns / 1ps

// Test bench for L1 cache

module memory_tb;

reg clk;
reg arst;
reg store;
reg load;
reg signext;
reg[1:0] size;
reg[31:0] addr;
reg[31:0] dataIn;
wire invalid;
wire[31:0] dataOut;

memory uut
(
    .clk(clk),
    .arst(arst),
    .store(store),
    .load(load),
    .signext(signext),
    .size(size),
    .addr(addr),
    .dataIn(dataIn),
    .invalid(invalid),
    .dataOut(dataOut)
);

initial
    begin
        #0
        clk     = 1'b0;
        arst    = 1'b0;
        store   = 1'b0;
        load    = 1'b0;
        signext = 1'b0;
        size    = 2'b00;
        addr    = 32'd0;
        dataIn  = 32'd0;
        
        #5
        arst    = 1'b1;
        
        #5
        arst    = 1'b0;
        
        // Store byte @ 0x50
        #10
        store   = 1'b1;
        load    = 1'b0;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h00000050;
        dataIn  = 32'h000000C8;
        
        // Store half word @ 0x84
        #10
        store   = 1'b1;
        load    = 1'b0;
        signext = 1'b0;
        size    = 2'b01;
        addr    = 32'h00000084;
        dataIn  = 32'h0000DEAD;
        
        // Store full word @ 0x37
        #10
        store   = 1'b1;
        load    = 1'b0;
        signext = 1'b0;
        size    = 2'b00;
        addr    = 32'h00000037;
        dataIn  = 32'hDEADBEEF;
        
        // Load byte from 0x50 (Expected DataOut = 0x000000C8)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h00000050;
        dataIn  = 32'h00000000;
        
        // Load sign-extended byte from 0x50 (Expected DataOut = 0xFFFFFFC8)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b10;
        addr    = 32'h00000050;
        dataIn  = 32'h00000000;
        
        // Load byte from 0x84 (Expected DataOut = 0x000000AD)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h00000084;
        dataIn  = 32'h00000000;
        
        // Load byte from 0x85 (Expected DataOut = 0x000000DE)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h00000085;
        dataIn  = 32'h00000000;
        
        // Load sign-extended byte from 0x85 (Expected DataOut = 0xFFFFFFDE)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b10;
        addr    = 32'h00000085;
        dataIn  = 32'h00000000;
        
        // Load half word from 0x84 (Expected DataOut = 0x0000DEAD)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b01;
        addr    = 32'h00000084;
        dataIn  = 32'h00000000;
        
        // Load sign-extended half word from 0x84 (Expected DataOut = 0xFFFFDEAD)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b01;
        addr    = 32'h00000084;
        dataIn  = 32'h00000000;
        
        // Load byte from 0x37 (Expected DataOut = 0x000000EF)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h00000037;
        dataIn  = 32'h00000000;
        
        // Load byte from 0x38 (Expected DataOut = 0x000000BE)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h00000038;
        dataIn  = 32'h00000000;
        
        // Load sign-extended byte from 0x38 (Expected DataOut = 0xFFFFFFBE)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b10;
        addr    = 32'h00000038;
        dataIn  = 32'h00000000;
        
        // Load byte from 0x39 (Expected DataOut = 0x000000AD)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h00000039;
        dataIn  = 32'h00000000;
        
        // Load byte from 0x40 (Expected DataOut = 0x000000DE)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b10;
        addr    = 32'h0000003A;
        dataIn  = 32'h00000000;
        
        // Load half word from 0x37 (Expected DataOut = 0x0000BEEF)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b01;
        addr    = 32'h00000037;
        dataIn  = 32'h00000000;
        
        // Load sign-extended half word from 0x37 (Expected DataOut = 0xFFFFBEEF)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b1;
        size    = 2'b01;
        addr    = 32'h00000037;
        dataIn  = 32'h00000000;
        
        // Load full word from 0x37 (Expected DataOut = 0xDEADBEEF)
        #10
        store   = 1'b0;
        load    = 1'b1;
        signext = 1'b0;
        size    = 2'b00;
        addr    = 32'h00000037;
        dataIn  = 32'h00000000;  
        
        #100
        $finish;
    end

always #5 clk = ~clk;

endmodule
