//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Sat Feb  1 13:47:07 2025
//Host        : trinity running 64-bit Gentoo Linux
//Command     : generate_target cpu_bd_wrapper.bd
//Design      : cpu_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cpu_bd_wrapper
   (addr,
    clk,
    din,
    dout,
    en,
    rst,
    rst_busy,
    we);
  input [11:0]addr;
  input clk;
  input [31:0]din;
  output [31:0]dout;
  input en;
  input rst;
  output rst_busy;
  input [3:0]we;

  wire [11:0]addr;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire en;
  wire rst;
  wire rst_busy;
  wire [3:0]we;

  cpu_bd cpu_bd_i
       (.addr(addr),
        .clk(clk),
        .din(din),
        .dout(dout),
        .en(en),
        .rst(rst),
        .rst_busy(rst_busy),
        .we(we));
endmodule
