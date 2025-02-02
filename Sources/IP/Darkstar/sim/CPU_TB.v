`timescale 1ns / 1ps

module CPU_TB;

// Inputs to Block Design
reg clk;
reg rst;
reg en;
reg[3:0] writeEn;
reg[11:0] address;
reg[31:0] dataIn;

// Outputs from Block Design
wire rst_busy;
wire[31:0] dataOut;

// Block Design UUT
cpu_bd uut
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .we(writeEn),
    .addr(address),
    .din(dataIn),
    .rst_busy(rst_busy),
    .dout(dataOut)
);

// Stimulus
initial
    begin
        #0
        clk     = 1'b0;
        rst     = 1'b0;
        en      = 1'b0;
        writeEn = 4'd0;
        address = 12'd0;
        dataIn  = 32'd0;
        
        #100
        rst     = 1'b1;
        address = 12'h0D4;
        
        #10
        rst     = 1'b0;
        en      = 1'b0;
        
        //////////////  WRITE   ///////////////////
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0000;          // No Write
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0001;          // Byte
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0011;          // Half Word
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b1111;          // Full Word
        
        #50
        rst     = 1'b0;
        en      = 1'b1;
        writeEn = 4'b0000;
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0000;          // No Write
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0001;          // Byte
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0011;          // Half Word
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b1111;          // Full Word
        
        //////////////  READ   ///////////////////
        
        #50
        en      = 1'b0;
        writeEn = 4'b0000;
        
        #50
        dataIn  = 32'hDEADBEEF;
        
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0001;          // Byte
        
        #50
        dataIn  = 32'hDEADBEEF;
        writeEn = 4'b0000;          // No Write
        
        #50
        $finish;
    end


always #5 clk = ~clk;
endmodule
