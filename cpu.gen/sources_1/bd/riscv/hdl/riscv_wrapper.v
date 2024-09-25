//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Sun Sep  8 16:53:56 2024
//Host        : trinity running 64-bit Gentoo Linux
//Command     : generate_target riscv_wrapper.bd
//Design      : riscv_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module riscv_wrapper
   (clk,
    reset);
  input clk;
  input reset;

  wire clk;
  wire reset;

  riscv riscv_i
       (.clk(clk),
        .reset(reset));
endmodule
