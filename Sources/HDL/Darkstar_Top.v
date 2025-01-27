//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Sun Jan 19 21:59:07 2025
//Host        : trinity running 64-bit Gentoo Linux
//Command     : generate_target cpu_wrapper.bd
//Design      : Darkstar
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Darkstar
(
    // 125 MHz Clock
    input wire clk,
    
    // DDR 
    inout wire[14:0] DDR_addr,
    inout wire[2:0] DDR_ba,
    inout wire DDR_cas_n,
    inout wire DDR_ck_n,
    inout wire DDR_ck_p,
    inout wire DDR_cke,
    inout wire DDR_cs_n,
    inout wire[3:0] DDR_dm,
    inout wire[31:0] DDR_dq,
    inout wire[3:0] DDR_dqs_n,
    inout wire[3:0] DDR_dqs_p,
    inout wire DDR_odt,
    inout wire DDR_ras_n,
    inout wire DDR_reset_n,
    inout wire DDR_we_n,
    
    // Internal MIO
    inout wire FIXED_IO_ddr_vrn,
    inout wire FIXED_IO_ddr_vrp,
    inout wire[53:0] FIXED_IO_mio,
    inout wire FIXED_IO_ps_clk,
    inout wire FIXED_IO_ps_porb,
    inout wire FIXED_IO_ps_srstb,
    
    // Buttons
    input wire[3:0] btn,
    
    // LEDs
    output wire[3:0] led,
    
    // RGB
    output wire led4_r,
    output wire led4_g,
    output wire led4_b,
    
    output wire led5_r,
    output wire led5_g,
    output wire led5_b,
    
    // Switches
    input wire[1:0] sw
);

// Debounce Blocks for Inputs
genvar i;
wire[3:0] btn_debounced;
wire[1:0] sw_debounced;

generate
    for (i = 0; i < 4; i = i + 1)
        begin
            Debounce btn_debounce
            (
                .clk(clk),
                .rst(1'b0),
                .width(24'd6250000),
                .dirty(btn[i]),
                .clean(btn_debounced[i])
            );
        end
endgenerate

generate
    for (i = 0; i < 2; i = i + 1)
        begin
            Debounce sw_debounce
            (
                .clk(clk),
                .rst(1'b0),
                .width(24'd6250000),
                .dirty(sw[i]),
                .clean(sw_debounced[i])
            );
        end
endgenerate


// Block Design Instantiation
cpu darkstar_bd
(
    // DDR
    .DDR_addr(DDR_addr),
    .DDR_ba(DDR_ba),
    .DDR_cas_n(DDR_cas_n),
    .DDR_ck_n(DDR_ck_n),
    .DDR_ck_p(DDR_ck_p),
    .DDR_cke(DDR_cke),
    .DDR_cs_n(DDR_cs_n),
    .DDR_dm(DDR_dm),
    .DDR_dq(DDR_dq),
    .DDR_dqs_n(DDR_dqs_n),
    .DDR_dqs_p(DDR_dqs_p),
    .DDR_odt(DDR_odt),
    .DDR_ras_n(DDR_ras_n),
    .DDR_reset_n(DDR_reset_n),
    .DDR_we_n(DDR_we_n),
    
    // Internal MIO
    .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
    .FIXED_IO_mio(FIXED_IO_mio),
    .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
    
    // Buttons
    .btns_4bits_tri_i(btn),
    
    // LEDs
    .leds_4bits_tri_o(led),
    
    // RGB
    .rgb_led_tri_o({led5_b, led5_g, led5_r, led4_b, led4_g, led4_r}),
    
    // Switches
    .sws_2bits_tri_i(sw)
);

endmodule
